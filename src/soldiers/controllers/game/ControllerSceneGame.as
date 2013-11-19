/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/13/13
 * Time: 4:01 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game
{
import controllers.IController;
import controllers.implementations.Controller;

import controls.EControllerUpdateBase;

import soldiers.controllers.EControllerUpdate;
import soldiers.controllers.game.arrow.ControllerArrowContainer;
import soldiers.controllers.game.houses.ControllerHousesGContainer;
import soldiers.controllers.game.soldiers.ControllerSoldiersContainer;
import soldiers.models.GameInfo;
import soldiers.popups.EPopupType;
import soldiers.views.game.ViewSceneGame;

public class ControllerSceneGame extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewSceneGame;


    /*
     * Properties
     */

    private var _controllerArrow:IController;
    private var _controllerSoldiers:IController;
    private var _controllerHouses:IController;

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerSceneGame()
    {
        _view = new ViewSceneGame(this);
        super(_view);
        init();
    }

    private function init():void
    {
        _controllerArrow = new ControllerArrowContainer();
        _view.addSubView(_controllerArrow.view);

        _controllerHouses = new ControllerHousesGContainer();
        _view.addSubView(_controllerHouses.view);

        _controllerSoldiers = new ControllerSoldiersContainer();
        _view.addSubView(_controllerSoldiers.view);

    }

    public override function update(type:String):void
    {
        switch (type)
        {
            case EControllerUpdate.ECU_HOUSE_SELECTION_CHANGED:
            {
                _controllerArrow.update(type);

                break;
            }
            case EControllerUpdate.ECU_SOLDIER_STATE_CHANGED:
            {
                _controllerSoldiers.update(type);
                break;
            }
            case EControllerUpdateBase.ECUT_GAME_FINISHED:
            {
                GameInfo.instance.managerStates.currentState.showPopup(EPopupType.EPT_LEVEL_END);

                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }
    }

    public override function cleanup():void
    {
        _controllerArrow.cleanup();
        _controllerSoldiers.cleanup();
        _controllerHouses.cleanup();

        super.cleanup();
    }
}
}
