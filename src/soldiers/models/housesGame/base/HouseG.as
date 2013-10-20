/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/22/13
 * Time: 4:21 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesGame.base
{
import flash.geom.Point;
import flash.utils.Dictionary;

import models.interfaces.players.IPlayerInfo;

import serialization.ISerializable;

import soldiers.controllers.scenes.game.views.housesG.base.ControlGHouseView;
import soldiers.models.GameInfo;

public class HouseG implements ISerializable
{
    /*
     * Fields
     */
    private var _view:ControlGHouseView;

    private var _ownerTypeOnStart:String;
    private var _owner:IPlayerInfo;

    //[Serializable]
    private var _level:uint;
    private var _levelMax:uint;

    //! Use Get\SetSoldierCount
    //[Serializable]
    private var _soldierCount:int;
    //[Serializable]
    private var _rotateLeftToRight:Boolean;
    //[Serializable]
    private var _positionCurrent:Point;

    //[Serializable base]
    private var _positionExit:Point;

    private var _foundationSize:Point;

    private var _isSelect:Boolean;

    private var _configs:Dictionary;
    /*
     * Properties
     */

    public function get view():ControlGHouseView
    {
        return _view;
    }

    public function set view(value:ControlGHouseView):void
    {
        _view = value;
    }

    public function get ownerType():String
    {
        var result:String;

        if (_owner == null)
        {
            result = EHouseOwner.EHO_NEUTRAL;
        }
        else if (_owner == GameInfo.instance.managerGameSoldiers.gameOwner)
        {
            result = EHouseOwner.EHO_PLAYER;
        }
        else if (_owner == GameInfo.instance.managerGameSoldiers.gameOwnerOpponent)
        {
            result = EHouseOwner.EHO_ENEMY;
        }
        else
        {
            Debug.assert(false);
        }

        return result;
    }

    public function get ownerTypeOnStart():String
    {
        return _ownerTypeOnStart;
    }

    public function get owner():IPlayerInfo
    {
        return _owner;
    }

    public function set owner(value:IPlayerInfo):void
    {
        if (_owner == value)
            return;

        _owner = value;
    }

    public function get type():String
    {
        Debug.assert(false, "Please implement it in derived classes.");
        return null;
    }

    public function get positionExit():Point
    {
        return _positionExit;
    }

    public function get positionCurrent():Point
    {
        return _positionCurrent;
    }

    public function get foundationSize():Point
    {
        return _foundationSize;
    }

    public function get isSelect():Boolean
    {
        return _isSelect;
    }

    public function set isSelect(value:Boolean):void
    {
        if (_isSelect == value)
            return;

        _isSelect = value;

    }

    public function get level():uint
    {
        return _level;
    }

    public function get levelMax():uint
    {
        return _levelMax;
    }

    public function get soldierCount():int
    {
        return _soldierCount;
    }

    public function set soldierCount(value:int):void
    {
        if (_soldierCount == value)
            return;

        _soldierCount = value;
    }

    public function get currentConfig():HouseConfigG
    {
        return _configs[_level];
    }


    /*
     * Methods
     */

    //! Default constructor
    public function HouseG()
    {
    }

    public function onGameStart():void
    {
        var configs:Array = GameInfo.instance.managerHousesGame.getConfigsForHouse(type);

        _configs = new Dictionary(true);

        for each(var config:HouseConfigG in configs)
        {
            _configs[config.level] = config;

            _levelMax = Math.max(config.level, _levelMax);
        }
    }

    /*
     * ISerializable
     */

    public function serialize():Object
    {
        return null;
    }

    public function deserialize(data0:Object):void
    {
        Debug.assert(data0.hasOwnProperty("owner"));
        Debug.assert(data0.hasOwnProperty("level"));
        Debug.assert(data0.hasOwnProperty("position_x"));
        Debug.assert(data0.hasOwnProperty("position_y"));
        Debug.assert(data0.hasOwnProperty("position_exit_offset_x"));
        Debug.assert(data0.hasOwnProperty("position_exit_offset_y"));
        Debug.assert(data0.hasOwnProperty("soldiers"));
        Debug.assert(data0.hasOwnProperty("soldiers_max"));
        Debug.assert(data0.hasOwnProperty("soldiers_max"));

        Debug.assert(data0.hasOwnProperty("foundation_width"));
        Debug.assert(data0.hasOwnProperty("foundation_height"));

        _ownerTypeOnStart = data0["owner"].toUpperCase();

        _positionCurrent = new Point(data0["position_x"], data0["position_y"]);
        _foundationSize = new Point(data0["foundation_width"], data0["foundation_height"]);

        var positionExitOffset:Point = new Point(data0["position_exit_offset_x"], data0["position_exit_offset_y"]);
        _positionExit = new Point(_positionCurrent.x + positionExitOffset.x, _positionCurrent.y + positionExitOffset.y);

        _soldierCount = data0["soldiers"];

        _level = data0["level"];
    }

    /*
     * IDisposable
     */

    public function cleanup():void
    {
    }


}
}
