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

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.geom.Point;
import flash.text.TextField;

import soldiers.GameInfo;
import soldiers.models.game.managerPath.GridCell;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.housesGame.base.HouseG;

import views.IView;
import views.implementations.ViewBase;

public class ViewHouseG extends ViewBase
{
    /*
     * Static methods
     */

    private static function getHouseClass(type:String):Class
    {
        var result:Class = null;

        switch (type)
        {
            case EHouseTypeG.EHGT_BARRACKS:
            {
                result = gHouseBarracks;

                break;
            }
            default :
            {
                break;
            }
        }

        return result;
    }

    /*
     * Fields
     */
    protected var _sourceView:DisplayObjectContainer;

    protected var _houseView:DisplayObjectContainer;

    private var _houseViewEnemy:DisplayObject;
    private var _houseViewPlayer:DisplayObject;
    private var _viewRank:MovieClip;

    private var _labelSoldiers:TextField;

    private var _houseCurrentPosition:Point;

    private var _viewAuraEnemy:DisplayObjectContainer;
    private var _viewAuraPlayer:DisplayObjectContainer;

    private var _viewIconLevelUp:IView;

    /*
     * Properties
     */


    public function get viewIconLevelUp():IView
    {
        return _viewIconLevelUp;
    }

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
        _houseCurrentPosition = entry.positionCurrent;

        init();

        initHouseView(entry.type);
    }


    private function init():void
    {
        //click move upOver upOut down over  out
        handleEvents(true, false, true, true, true, true, true);

        _viewAuraEnemy = new gAuraEnemy();
        _viewAuraEnemy.visible = false;

        _viewAuraEnemy.mouseEnabled = false;
        _viewAuraEnemy.mouseChildren = false;

        _sourceView.addChild(_viewAuraEnemy);

        _viewAuraPlayer = new gAuraPlayer();
        _viewAuraPlayer.visible = false;

        _viewAuraPlayer.mouseEnabled = false;
        _viewAuraPlayer.mouseChildren = false;

        _sourceView.addChild(_viewAuraPlayer);

        _viewIconLevelUp = new ViewBase(controller, new gIconLevelUp());
        _sourceView.addChild(_viewIconLevelUp.source);
        _viewIconLevelUp.handleEvents(true, false, false, false, true);
    }

    private function initHouseView(type:String):void
    {
        var sourceClass:Class = getHouseClass(type);
        _houseView = new sourceClass();

        Debug.assert(_houseView.hasOwnProperty("viewPlayer"));
        Debug.assert(_houseView.hasOwnProperty("viewEnemy"));
        Debug.assert(_houseView.hasOwnProperty("labelSoldiers"));
        Debug.assert(_houseView.hasOwnProperty("viewRank"));

        _houseView.mouseEnabled = false;
        _houseView.mouseChildren = false;

        _houseViewEnemy = _houseView["viewEnemy"];
        _houseViewPlayer = _houseView["viewPlayer"];

        _viewRank = _houseView["viewRank"];

        _labelSoldiers = _houseView["labelSoldiers"];

        _sourceView.addChild(_houseView);
    }


    public function setLevel(value:uint, levelMax:uint):void
    {
        for (var level:int = 1; level <= levelMax; level++)
        {
            var propertyName:String = "level_" + level.toString();
            Debug.assert(_houseViewEnemy.hasOwnProperty(propertyName), "Not found soldier view: " + propertyName);
            Debug.assert(_houseViewPlayer.hasOwnProperty(propertyName), "Not found soldier view: " + propertyName);

            _houseViewEnemy[propertyName].visible = level == value;
            _houseViewPlayer[propertyName].visible = level == value;
        }

        _viewRank.gotoAndStop(value);
    }

    public override function placeViews(fullscreen:Boolean):void
    {
        super.placeViews(fullscreen);

        var cellEntry:GridCell = GameInfo.instance.managerGame.managerPath.getCell(_houseCurrentPosition);
        _sourceView.x = cellEntry.view.source.x;
        _sourceView.y = cellEntry.view.source.y;

        _viewIconLevelUp.source.x = -100;
        _viewIconLevelUp.source.y = -100;
    }

    public override function cleanup():void
    {
        _viewIconLevelUp.cleanup();
        _viewIconLevelUp = null;

        super.cleanup();
    }

}
}
