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
import controllers.IController;

import core.DisposableObject;

import flash.geom.Point;

import models.interfaces.players.IPlayerInfo;

import serialization.ISerializable;

import soldiers.models.GameInfo;

public class HouseG extends DisposableObject implements ISerializable
{
    /*
     * Fields
     */
    private var _controller:IController;

    private var _ownerTypeOnStart:String;
    private var _owner:IPlayerInfo;

    //[Serializable]
    private var _level:uint;

    //! Use Get\SetSoldierCount
    //[Serializable]
    private var _soldierCount:int;
    //[Serializable]
    private var _rotateLeftToRight:Boolean;
    //[Serializable]
    private var _positionCurrent:Point;


    private var _isSelect:Boolean;

    private var _houseConfig:HouseGConfig;

    /*
     * Properties
     */

    public function get controller():IController
    {
        return _controller;
    }

    public function set controller(value:IController):void
    {
        _controller = value;
    }

    public function get ownerType():String
    {
        var result:String;

        if (_owner == null)
        {
            result = EHouseOwner.EHO_NEUTRAL;
        }
        else if (_owner == GameInfo.instance.managerGame.gameOwner)
        {
            result = EHouseOwner.EHO_PLAYER;
        }
        else if (_owner == GameInfo.instance.managerGame.gameOwnerOpponent)
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

    public function get positionCurrent():Point
    {
        return _positionCurrent;
    }

    public function get positionExit():Point
    {
        return _positionCurrent.add(currentLevelInfo.positionExitOffset);
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

    public function get houseConfig():HouseGConfig
    {
        return _houseConfig;
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

    public function get currentLevelInfo():HouseGLevelInfo
    {
        return _houseConfig.houseLevelsInfo[_level];
    }


    /*
     * Methods
     */

    //! Default constructor
    public function HouseG()
    {
        _houseConfig = GameInfo.instance.managerHousesGame.getHouseConfig(type);
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
        Debug.assert(data0.hasOwnProperty("soldiers"));

        Debug.assert(data0.hasOwnProperty("position_x"));
        Debug.assert(data0.hasOwnProperty("position_y"));

        _ownerTypeOnStart = data0["owner"].toUpperCase();
        _level = data0["level"];
        _soldierCount = data0["soldiers"];

        _positionCurrent = new Point(data0["position_x"], data0["position_y"]);
    }
}
}
