/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/30/13
 * Time: 2:18 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.soldiers.base
{
import controls.IView;
import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

import models.interfaces.states.IState;

import soldiers.controllers.EControllerUpdate;
import soldiers.models.GameInfo;
import soldiers.models.game.soldiers.SoldierInfo;

public class ControlSoldierViewContainer extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceViewTyped:DisplayObjectContainer;
    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlSoldierViewContainer(parent:IView)
    {
        super(parent);

        _sourceViewTyped = new Sprite();
        _sourceViewTyped.mouseChildren = false;
        _sourceViewTyped.mouseEnabled = false;
        setSourceView(_sourceViewTyped);
    }


    public override function update(type:String = ""):void
    {
        switch (type)
        {
            case EControllerUpdate.ECU_SOLDIER_GENERATE:
            {
                var soldiers:Array = GameInfo.instance.managerGameSoldiers.managerSoldiers.soldiers;
                for each(var soldier:SoldierInfo in soldiers)
                {
                    if (soldier.view == null)
                    {
                        soldier.view = new ControlSoldierView(this, soldier);
                        _sourceViewTyped.addChild(soldier.view.sourceView);
                    }
                }

                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }
    }
}
}
