/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/13/13
 * Time: 5:28 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game.houses
{
import controllers.IController;
import controllers.implementations.Controller;

import views.IView;

import flash.events.MouseEvent;

import soldiers.GameInfo;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.housesGame.base.HouseG;
import soldiers.views.game.houses.ViewHousesGContainer;

public class ControllerHousesGContainer extends Controller
{
    /*
     * Fields
     */
    private var _houses:Array;

    private var _view:ViewHousesGContainer;


    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerHousesGContainer(view:ViewHousesGContainer)
    {
        _view = view;
        super(_view);

        init();
    }

    private function init():void
    {
        initHouses();
    }

    private function initHouses():void
    {
        _houses = [];

        var housesEntries:Array = GameInfo.instance.managerGame.houses;

        for each(var entry:HouseG in housesEntries)
        {
            var controllerHouse:IController;

            switch (entry.type)
            {
                case EHouseTypeG.EHGT_BARRACKS:
                {
                    controllerHouse = new ControllerHouseG(entry);
                    break;
                }
                default :
                {
                    Debug.assert(false);
                    break;
                }
            }

            _view.addSubView(controllerHouse.view);

            entry.controller = controllerHouse;
            _houses.push(controllerHouse);
        }
    }

    public override function cleanup():void
    {
        for each(var controller:IController in _houses)
        {
            controller.cleanup();
        }

        _houses = null;

        super.cleanup();
    }

}
}
