/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/5/14
 * Time: 10:14 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.decor
{
import core.DisposableObject;

import flash.geom.Point;

import serialization.ISerializable;

public class Decor extends DisposableObject implements ISerializable
{
    /*
     * Fields
     */
    private var _type:String;
    private var _size:Point;
    private var _position:Point;

    /*
     * Properties
     */


    public function get type():String
    {
        return _type;
    }

    public function get size():Point
    {
        return _size;
    }

    public function get position():Point
    {
        return _position;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function Decor()
    {

    }

    /*
     *  ISerializable
     */


    public function serialize():Object
    {
        return null;
    }

    public function deserialize(data:Object):void
    {
        Debug.assert(data.hasOwnProperty("type"));

        Debug.assert(data.hasOwnProperty("width"));
        Debug.assert(data.hasOwnProperty("height"));

        Debug.assert(data.hasOwnProperty("position_x"));
        Debug.assert(data.hasOwnProperty("position_y"));

        _type = data["type"];

        _size = new Point(data["width"], data["height"]);
        _position = new Point(data["position_x"], data["position_y"]);

    }
}
}
