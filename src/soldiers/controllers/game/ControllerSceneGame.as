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

import soldiers.controllers.EControllerUpdate;
import soldiers.controllers.game.houses.ControllerHousesGContainer;
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
        _controllerArrow = new ControllerArrow();

        _controllerHouses = new ControllerHousesGContainer();

        _view.addSubView(_controllerHouses.view);
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
            case EControllerUpdate.ECU_SOLDIER_GENERATE:
            {
                _controllerSoldiers.update(type);
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
