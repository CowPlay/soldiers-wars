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

import flash.events.FullScreenEvent;

import soldiers.GameInfo;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.housesGame.base.HouseG;
import soldiers.views.game.houses.ViewHousesGContainer;

import views.EControllerUpdateBase;

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

        GameInfoBase.instance.managerApp.applicationStage.addEventListener(FullScreenEvent.FULL_SCREEN, onFullscreenModeChanged);

    }

    private static function onFullscreenModeChanged(e:FullScreenEvent):void
    {
        GameInfo.instance.managerGame.clearHousesSelection(GameInfo.instance.managerGame.gameOwner);
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

    public override function update(type:String):void
    {
        switch (type)
        {
            case EControllerUpdateBase.ECUT_GAME_FINISHED:
            {
                GameInfo.instance.managerGame.clearHousesSelection(GameInfo.instance.managerGame.gameOwner);
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
        GameInfoBase.instance.managerApp.applicationStage.removeEventListener(FullScreenEvent.FULL_SCREEN, onFullscreenModeChanged);

        for each(var controller:IController in _houses)
        {
            controller.cleanup();
        }

        _houses = null;

        super.cleanup();
    }

}
}
