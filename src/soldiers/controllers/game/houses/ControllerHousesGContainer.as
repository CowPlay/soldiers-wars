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

import controls.IView;

import flash.events.MouseEvent;

import soldiers.models.GameInfo;
import soldiers.models.game.ManagerGame;
import soldiers.models.housesGame.base.EHouseOwner;
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

    private var _managerGame:ManagerGame;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerHousesGContainer()
    {
        _view = new ViewHousesGContainer(this);
        super(_view);


        init();
    }

    private function init():void
    {
        _managerGame = GameInfo.instance.managerGameSoldiers;

        initHouses();
    }


    private function initHouses():void
    {
        _houses = [];

        var housesEntries:Array = _managerGame.currentLevel.houses;

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

    private function getHouseControllerByView(view:IView):ControllerHouseG
    {
        var result:ControllerHouseG = null;

        for each(var controllerHouse:ControllerHouseG in _houses)
        {
            if (controllerHouse.view == view)
            {
                result = controllerHouse;
                break;
            }
        }

        Debug.assert(result != null);

        return result;
    }

    public override function onViewMouseOver(view:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewMouseOver(view, e);

        if (!result)
        {
            var targetController:ControllerHouseG = getHouseControllerByView(view);

            if (targetController.entry.ownerType == EHouseOwner.EHO_PLAYER &&
                    _managerGame.isAnyHouseSelected(_managerGame.gameOwner) && !targetController.entry.isSelect)
            {
                _managerGame.onPlayerSelectHouse(_managerGame.gameOwner, targetController.entry);

                result = true;
            }
        }

        return result;
    }

    public override function onViewMouseDown(view:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewMouseDown(view, e);

        if (!result)
        {
            var targetController:ControllerHouseG = getHouseControllerByView(view);

            if (targetController.entry.ownerType == EHouseOwner.EHO_PLAYER)
            {
                _managerGame.onPlayerSelectHouse(_managerGame.gameOwner, targetController.entry);

                result = true;
            }
        }

        return result;
    }

    public override function onViewMouseUp(target:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewMouseUp(target, e);

        if (!result)
        {
            if (_managerGame.isAnyHouseSelected(_managerGame.gameOwner))
            {
                var targetController:ControllerHouseG = getHouseControllerByView(view);

                _managerGame.onPlayerGenerateSoldiers(_managerGame.gameOwner, targetController.entry);

                result = true;
            }
        }

        return result;
    }
}
}
