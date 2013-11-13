/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/19/13
 * Time: 5:29 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesVillage.base
{
import controllers.IController;

import controls.IView;

import core.DisposableObject;

import serialization.ISerializable;

public class HouseLevelInfoV extends DisposableObject implements ISerializable
{
    /*
     * Fields
     */

    private var _level:int;
    private var _isAvailable:Boolean;

    private var _controller:IController;


    /*
     * Properties
     */

    public function get level():int
    {
        return _level;
    }

    public function get isAvailable():Boolean
    {
        return _isAvailable;
    }

    public function set isAvailable(value:Boolean):void
    {
        _isAvailable = value;
    }

    public function get controller():IController
    {
        return _controller;
    }

    public function set controller(value:IController):void
    {
        _controller = value;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function HouseLevelInfoV()
    {
        super(false);
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
        Debug.assert(data != null);
        Debug.assert(data.hasOwnProperty("level"));

        _level = data["level"];
    }
}
}
