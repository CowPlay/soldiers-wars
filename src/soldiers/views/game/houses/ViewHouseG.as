/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/22/13
 * Time: 9:46 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.houses
{
import controllers.IController;

import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.text.TextField;

import soldiers.models.GameInfo;
import soldiers.models.game.managerPath.GridCell;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.housesGame.base.HouseG;

public class ViewHouseG extends ControlBase
{
    /*
     * Fields
     */
    protected var _sourceView:DisplayObjectContainer;

    protected var _houseView:DisplayObjectContainer;
    protected var _houseViewEnemy:DisplayObjectContainer;
    protected var _houseViewPlayer:DisplayObjectContainer;
    protected var _labelSoldiers:TextField;

    private var _entry:HouseG;


    private var _auraPosition:Point;
    /*
     * Properties
     */

    public function get auraPosition():Point
    {
        return _auraPosition;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ViewHouseG(controller:IController, entry:HouseG)
    {
        _sourceView = new Sprite();
        super(controller, _sourceView);

        Debug.assert(entry != null);
        _entry = entry;

        init();
    }

    private function init():void
    {
        //click move upOver upOut down over  out
        handleEvents(true, false, true, true, true, true, true);

        initHouseView();

//        _auraEnemy = new gAuraEnemy();
//        _auraEnemy.visible = false;
//        _sourseViewTyped.addChild(_auraEnemy);
//
//        _auraPlayer = new gAuraPlayer();
//        _auraPlayer.visible = false;
//        _sourseViewTyped.addChild(_auraPlayer);

        _auraPosition = new Point(65, 0);
    }

    private function initHouseView():void
    {
        var resultClass:Class = null;

        switch (_entry.type)
        {
            case EHouseTypeG.EHGT_BARRACKS:
            {
                resultClass = gHouseBarracks;

                break;
            }
            default :
            {
                break;
            }
        }

        _houseView = new resultClass();

        //TODO: add levels
        Debug.assert(_houseView.hasOwnProperty("viewPlayer"));
        Debug.assert(_houseView.hasOwnProperty("viewEnemy"));
        Debug.assert(_houseView.hasOwnProperty("labelSoldiers"));

        _houseView.mouseEnabled = false;
        _houseView.mouseChildren = false;

        _houseViewEnemy = _houseView["viewEnemy"];
        _houseViewPlayer = _houseView["viewPlayer"];
        _labelSoldiers = _houseView["labelSoldiers"];

        _sourceView.addChild(_houseView);

        //TODO: review
//        update(EControllerUpdateBase.ECUT_ENTRY_UPDATED);
    }


    public override function placeViews(isFullscreen:Boolean):void
    {
        super.placeViews(isFullscreen);

//        _auraEnemy.x = _auraPlayer.x = _auraPosition.x;
//        _auraEnemy.y = _auraPlayer.y = _auraPosition.y;

        var cellEntry:GridCell = GameInfo.instance.managerGame.managerPath.getCell(_entry.positionCurrent);
        _sourceView.x = cellEntry.view.source.x;
        _sourceView.y = cellEntry.view.source.y;
    }
}
}
