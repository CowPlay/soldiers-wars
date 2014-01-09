/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/13/13
 * Time: 4:58 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game.soldiers
{
import controllers.IController;
import controllers.implementations.Controller;

import soldiers.controllers.EControllerUpdate;
import soldiers.GameInfo;
import soldiers.models.game.soldiers.ESoldierState;
import soldiers.models.game.soldiers.SoldierInfo;
import soldiers.views.game.soldiers.ViewSoldiersContainer;

import utils.UtilsArray;

public class ControllerSoldiersContainer extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewSoldiersContainer;
    private var _soldiers:Array;
    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerSoldiersContainer(view:ViewSoldiersContainer)
    {
        _view = view;
        super(_view);

        init();
    }

    private function init():void
    {
        _soldiers = [];
    }


    public override function update(type:String):void
    {
        switch (type)
        {
            case EControllerUpdate.ECU_SOLDIER_STATE:
            {
                var soldiers:Array = GameInfo.instance.managerGame.managerSoldiers.soldiers;

                for each(var soldier:SoldierInfo in soldiers)
                {
                    switch (soldier.state)
                    {
                        case ESoldierState.ESS_NEW:
                        {
                            var controller:IController = new ControllerSoldier(soldier);
                            soldier.controller = controller;
                            _view.addSubView(controller.view);

                            _soldiers.push(controller);
                            break;
                        }
                        case ESoldierState.ESS_IN_MOVE:
                        {
                            //do nothing
                            break;
                        }
                        case ESoldierState.ESS_NEED_REMOVE:
                        {
                            _view.removeSubView(soldier.controller.view);

                            UtilsArray.removeValue(_soldiers, soldier.controller);
                            soldier.controller.cleanup();
                            soldier.controller = null;

                            break;
                        }
                        default :
                        {
                            Debug.assert(false);
                            break;
                        }
                    }
                }

                break;
            }
            default:
            {
                Debug.assert(false);
                break;
            }
        }
    }

    public override function cleanup():void
    {
        for each(var controller:IController in _soldiers)
        {
            controller.cleanup();
        }

        _soldiers = null;

        super.cleanup();
    }


}
}
