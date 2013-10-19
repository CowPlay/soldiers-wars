/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/30/13
 * Time: 12:37 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.scenes.game.views.housesG.base
{
import controls.IControl;
import controls.IControlScene;
import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.MouseEvent;

import soldiers.controllers.scenes.game.views.housesG.ControlGHouseViewBarracks;

import soldiers.models.GameInfo;
import soldiers.models.data.housesG.base.EHouseGType;
import soldiers.models.data.housesG.base.EHouseOwner;
import soldiers.models.data.housesG.base.HouseInfoG;

import soldiers.models.game.ManagerGameSoldiers;
import soldiers.models.game.managerPath.GridCell;

public class ControlGHouseViewContainer extends ControlBase
{
    /*
     * Fields
     */
    private var _managerGame:ManagerGameSoldiers;
    private var _sourceViewTyped:DisplayObjectContainer;
    private var _controlsHouses:Array;


    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlGHouseViewContainer(sceneOwner:IControlScene)
    {
        super(sceneOwner);
        init();
    }

    private function init():void
    {
        _managerGame = GameInfo.instance.managerGameSoldiers;
        _sourceViewTyped = new Sprite();
        setSourceView(_sourceViewTyped);

        initHouses();
    }

    private function initHouses():void
    {
        _controlsHouses = [];

        var housesEntries:Array = _managerGame.currentLevel.houses;

        for each(var entry:HouseInfoG in housesEntries)
        {
            var view:ControlGHouseView;

            switch (entry.type)
            {
                case EHouseGType.EHGT_BARRACKS:
                {
                    view = new ControlGHouseViewBarracks(sceneOwner, entry);
                    break;
                }
                default :
                {
                    Debug.assert(false);
                    break;
                }
            }

            _sourceViewTyped.addChild(view.sourceView);

            view.actionDelegate = this;
            entry.view = view;
            _controlsHouses.push(view);
        }
    }

    public override function placeViews():void
    {
        super.placeViews();

        for each(var houseView:ControlGHouseView in _controlsHouses)
        {
            var cellEntry:GridCell = _managerGame.managerPath.getCell(houseView.entry.positionCurrent);

            houseView.placeViews();
            houseView.sourceView.x = cellEntry.view.sourceView.x;
            houseView.sourceView.y = cellEntry.view.sourceView.y;
        }
    }

    /*
     * IActionDelegate
     */

    public override function onControlMouseOver(target:IControl, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onControlMouseDown(target, e);
        if (!result)
        {
            if (target is ControlGHouseView)
            {
                var houseView:ControlGHouseView = target as ControlGHouseView;

                if (houseView.entry.ownerType == EHouseOwner.EHO_PLAYER &&
                        _managerGame.isAnyHouseSelected(_managerGame.gameOwner) && !houseView.entry.isSelect)
                {
                    _managerGame.onPlayerSelectHouse(_managerGame.gameOwner, houseView.entry);

                    result = true;
                }
            }
        }

        return result;

    }

    public override function onControlMouseDown(target:IControl, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onControlMouseDown(target, e);

        if (!result)
        {
            if (target is ControlGHouseView)
            {
                var houseView:ControlGHouseView = target as ControlGHouseView;

                if (houseView.entry.ownerType == EHouseOwner.EHO_PLAYER)
                {
                    _managerGame.onPlayerSelectHouse(_managerGame.gameOwner, houseView.entry);

                    result = true;
                }
            }
        }

        return result;
    }

    public override function onControlMouseUp(target:IControl, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onControlMouseDown(target, e);

        if (!result)
        {
            if (target is ControlGHouseView)
            {
                if (_managerGame.isAnyHouseSelected(_managerGame.gameOwner))
                {
                    var houseView:ControlGHouseView = target as ControlGHouseView;

                    _managerGame.onPlayerGenerateSoldiers(_managerGame.gameOwner, houseView.entry);

                    result = true;
                }
            }
        }

        return result;
    }
}
}
