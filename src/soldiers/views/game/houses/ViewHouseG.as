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

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
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

    private var _houseViewEnemy:DisplayObject;
    private var _houseViewPlayer:DisplayObject;

    private var _labelSoldiers:TextField;

    private var _entry:HouseG;

    private var _viewAuraEnemy:DisplayObject;
    private var _viewAuraPlayer:DisplayObject;

    /*
     * Properties
     */

    public function get labelSoldiers():TextField
    {
        return _labelSoldiers;
    }

    public function get houseViewEnemy():DisplayObject
    {
        return _houseViewEnemy;
    }

    public function get houseViewPlayer():DisplayObject
    {
        return _houseViewPlayer;
    }


    public function get viewAuraEnemy():DisplayObject
    {
        return _viewAuraEnemy;
    }

    public function get viewAuraPlayer():DisplayObject
    {
        return _viewAuraPlayer;
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

        _viewAuraEnemy = new gAuraEnemy();
        _viewAuraEnemy.visible = false;
        _sourceView.addChild(_viewAuraEnemy);

        _viewAuraPlayer = new gAuraPlayer();
        _viewAuraPlayer.visible = false;
        _sourceView.addChild(_viewAuraPlayer);
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

        Debug.assert(_houseView.hasOwnProperty("viewPlayer"));
        Debug.assert(_houseView.hasOwnProperty("viewEnemy"));
        Debug.assert(_houseView.hasOwnProperty("labelSoldiers"));

        _houseView.mouseEnabled = false;
        _houseView.mouseChildren = false;

        _houseViewEnemy = _houseView["viewEnemy"];
        _houseViewPlayer = _houseView["viewPlayer"];

        _labelSoldiers = _houseView["labelSoldiers"];

        _sourceView.addChild(_houseView);
    }

    public function setLevel(value:uint):void
    {
        for (var level:int = 1; level <= _entry.houseConfig.levelMax; level++)
        {
            var propertyName:String = "level_" + level.toString();
            Debug.assert(_houseViewEnemy.hasOwnProperty(propertyName), "Not found soldier view: " + propertyName);
            Debug.assert(_houseViewPlayer.hasOwnProperty(propertyName), "Not found soldier view: " + propertyName);

            _houseViewEnemy[propertyName].visible = level == _entry.level;
            _houseViewPlayer[propertyName].visible = level == _entry.level;
        }
    }

    public override function placeViews(fullscreen:Boolean):void
    {
        super.placeViews(fullscreen);

        var cellEntry:GridCell = GameInfo.instance.managerGame.managerPath.getCell(_entry.positionCurrent);
        _sourceView.x = cellEntry.view.source.x;
        _sourceView.y = cellEntry.view.source.y;

        var offsetX:Number = _houseView.width / 2;

        _viewAuraEnemy.x = _viewAuraPlayer.x = offsetX;

        _houseView.x = offsetX

    }

}
}
