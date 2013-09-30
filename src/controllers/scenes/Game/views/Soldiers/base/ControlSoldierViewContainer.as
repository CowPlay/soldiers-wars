/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/30/13
 * Time: 2:18 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.game.views.soldiers.base
{
import controllers.EControlUpdateType;

import controls.IControlScene;
import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

import models.GameInfo;
import models.data.soldiers.SoldierInfo;

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
    public function ControlSoldierViewContainer(sceneOwner:IControlScene)
    {
        super(sceneOwner);

        _sourceViewTyped = new Sprite();
        setSourceView(_sourceViewTyped);
    }


    public override function update(type:String = ""):void
    {
        switch (type)
        {
            case EControlUpdateType.ECUT_SOLDIER_GENERATE:
            {
                var soldiers:Array = GameInfo.instance.managerGameSoldiers.managerSoldiers.soldiers;
                for each(var soldier:SoldierInfo in soldiers)
                {
                    if (soldier.view == null)
                    {
                        soldier.view = new ControlSoldierView(sceneOwner, soldier);
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
