/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/19/13
 * Time: 5:29 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesVillage.base
{
import controls.IControl;

import serialization.ISerializable;

public class HouseConfigV implements ISerializable
{
    /*
     * Fields
     */

    private var _level:int;
    private var _isAvailable:Boolean;

    private var _view:IControl;


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

    public function get view():IControl
    {
        return _view;
    }

    public function set view(value:IControl):void
    {
        _view = value;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function HouseConfigV()
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
        Debug.assert(data != null);
        Debug.assert(data.hasOwnProperty("level"));

        _level = data["level"];
    }

    /*
     * IDisposable
     */


    public function cleanup():void
    {
    }
}
}
