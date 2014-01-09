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

import soldiers.GameInfo;
import soldiers.controllers.EControllerUpdate;

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

    //[Serializable]
    private var _soldierCount:int;
    //[Serializable]
    private var _rotateLeftToRight:Boolean;
    //[Serializable]
    private var _positionCurrent:Point;

    private var _positionsExits:Array;

    private var _isSelect:Boolean;

    private var _houseConfig:HouseGConfig;

    private var _id:String;

    /*
     * Properties
     */



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

        if (_controller != null)
        {
            _controller.update(EControllerUpdate.ECU_HOUSE_OWNER);
        }
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

    public function get positionsExits():Array
    {
        return _positionsExits;
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

    public function get canLevelUpgrade():Boolean
    {
        var condition0:Boolean = _level < houseConfig.levelMax;
        var condition1:Boolean = _soldierCount >= currentLevelInfo.soldiersMax / 2;
        var condition2:Boolean = _level < GameInfo.instance.managerGame.currentLevel.housesLevelMax;

        return  condition0 && condition1 && condition2;
    }

    public function levelUpgrade():void
    {
        _level++;

        Debug.assert(_level <= _houseConfig.levelMax);

        _controller.update(EControllerUpdate.ECU_HOUSE_LEVEL);

        this.soldierCount -= this.soldierCount / 2;
    }

    public function get houseConfig():HouseGConfig
    {
        return _houseConfig;
    }

    public function get soldierCountPercent():int
    {
        return _soldierCount / currentLevelInfo.soldiersMax * 100;
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

        _controller.update(EControllerUpdate.ECU_HOUSE_SOLDIERS);
    }

    public function get currentLevelInfo():HouseGLevelInfo
    {
        return _houseConfig.houseLevelsInfo[_level];
    }


    public function get id():String
    {
        return _id;
    }

    /*
     * Events
     */

    public function onGameStart():void
    {

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

        Debug.assert(data0.hasOwnProperty("id"));

        _ownerTypeOnStart = data0["owner"].toUpperCase();
        _level = data0["level"];
        _soldierCount = data0["soldiers"];
        _id = data0["id"];

        _positionCurrent = new Point(data0["position_x"], data0["position_y"]);

        initPositionsExit();
    }

    private function initPositionsExit():void
    {
        _positionsExits = [];

        var foundationWidthHalf:int = _houseConfig.foundationSize.x / 2;
        var foundationHeightHalf:int = _houseConfig.foundationSize.y / 2;

        var left:uint = _positionCurrent.x - foundationWidthHalf;
        var right:uint = _positionCurrent.x + foundationWidthHalf;

        var top:uint = _positionCurrent.y - foundationHeightHalf;
        var bottom:uint = _positionCurrent.y + foundationHeightHalf;

        var positionExit0:Point = new Point(left - 1, top - 1);
        _positionsExits.push(positionExit0);

        var positionExit1:Point = new Point(right + 1, top - 1);
        _positionsExits.push(positionExit1);

        var positionExit2:Point = new Point(right + 1, bottom + 1);
        _positionsExits.push(positionExit2);

        var positionExit3:Point = new Point(left - 1, bottom + 1);
        _positionsExits.push(positionExit3);


        var positionExit01:Point = new Point(left + _houseConfig.foundationSize.x / 2, top - 1);
        _positionsExits.push(positionExit01);

        var positionExit12:Point = new Point(right + 1, top + _houseConfig.foundationSize.y / 2);
        _positionsExits.push(positionExit12);

        var positionExit23:Point = new Point(left + _houseConfig.foundationSize.x / 2, bottom + 1);
        _positionsExits.push(positionExit23);

        var positionExit34:Point = new Point(left - 1, top + _houseConfig.foundationSize.y / 2);
        _positionsExits.push(positionExit34);
    }

    public override function cleanup():void
    {
        _controller = null;
        _owner = null;

        super.cleanup();
    }
}
}
