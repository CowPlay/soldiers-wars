/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/13/13
 * Time: 4:58 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game.soldiers
{
import controllers.implementations.Controller;

import soldiers.controllers.EControllerUpdate;
import soldiers.models.GameInfo;
import soldiers.models.game.soldiers.SoldierInfo;
import soldiers.views.game.soldiers.ViewSoldier;
import soldiers.views.game.soldiers.ViewSoldiersContainer;

public class ControllerSoldiersContainer extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewSoldiersContainer;
    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerSoldiersContainer()
    {
        _view = new ViewSoldiersContainer(this);
        super(_view);

        init();
    }

    private function init():void
    {
    }


    public override function update(type:String):void
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
                        soldier.view = new ViewSoldier(this, soldier);
                        _view.addSubView(soldier.view);
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
