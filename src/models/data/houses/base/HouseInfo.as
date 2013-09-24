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
package models.data.houses.base
{
import controls.IControl;

import flash.geom.Point;

import serialization.ISerializable;

public class HouseInfo implements ISerializable
{
    /*
     * Fields
     */
    private var _view:IControl;

    //[Serializable]
    private var _type:String;

    //! Represents house owner type
    private var _ownerType:String;

    //[Serializable]
    private var _level:uint;

    private var _levelMax:uint;

    //! Use Get\SetSoldierCount
    //[Serializable]
    private var _soldierCount:Number;
    //[Serializable]
    private var _soldierCountMax:uint;
    //[Serializable]
    private var _rotateLeftToRight:Boolean;
    //[Serializable]
    private var _positionCurrent:Point;

    //[Serializable base]
    private var _positionExit:Point;

    //[Serializable base]
    private var _foundation:Array;

    /*
     * Properties
     */

    public function get view():IControl
    {
        return _view;
    }

    public function set view(value:IControl):void
    {
        _view = value;
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

    /*
     * Methods
     */

    //! Default constructor
    public function HouseInfo()
    {
    }

    /*
     * ISerializable
     */

    public function serialize():Object
    {
        return null;
    }

    public function deserialize(data:Object):void
    {
        Debug.assert(data.hasOwnProperty("owner"));
        Debug.assert(data.hasOwnProperty("type"));
        Debug.assert(data.hasOwnProperty("level"));
        Debug.assert(data.hasOwnProperty("level_max"));
        Debug.assert(data.hasOwnProperty("position_x"));
        Debug.assert(data.hasOwnProperty("position_y"));
        Debug.assert(data.hasOwnProperty("position_exit_x"));
        Debug.assert(data.hasOwnProperty("position_exit_y"));
        Debug.assert(data.hasOwnProperty("soldiers"));
        Debug.assert(data.hasOwnProperty("soldiers_max"));

        _ownerType = data["owner"];
        _type = data["type"];
        _level = data["level"];
        _levelMax =   data["level_max"];

        _positionCurrent = new Point(data["position_x"], data["position_y"]);
        _positionExit = new Point(data["position_exit_x"], data["position_exit_y"]);

        _soldierCount =  data["soldiers"];
        _soldierCountMax =  data["soldiers_max"];
    }

    /*
     * IDisposable
     */

    public function cleanup():void
    {
    }


}
}
