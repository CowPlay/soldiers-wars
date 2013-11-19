/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/19/13
 * Time: 8:52 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesGame.base
{
import core.DisposableObject;

import flash.geom.Point;

import serialization.ISerializable;

public class HouseGLevelInfo extends DisposableObject implements ISerializable
{
    /*
     * Fields
     */
    private var _level:uint;
    private var _soldiersMax:uint;

    private var _foundationSize:Point;
    private var _positionExitOffset:Point;
    /*
     * Properties
     */


    public function get level():uint
    {
        return _level;
    }

    public function get soldiersMax():uint
    {
        return _soldiersMax;
    }

    public function get foundationSize():Point
    {
        return _foundationSize;
    }


    public function get positionExitOffset():Point
    {
        return _positionExitOffset;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function HouseGLevelInfo()
    {
        super(false);

        init();
    }

    private function init():void
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
        Debug.assert(data.hasOwnProperty("soldiers_max"));
        Debug.assert(data.hasOwnProperty("level"));

        Debug.assert(data.hasOwnProperty("foundation_width"));
        Debug.assert(data.hasOwnProperty("foundation_height"));

        Debug.assert(data.hasOwnProperty("position_exit_offset_x"));
        Debug.assert(data.hasOwnProperty("position_exit_offset_y"));

        _foundationSize = new Point(data["foundation_width"], data["foundation_height"]);

        _level = data["level"];
        _soldiersMax = data["soldiers_max"];

        _positionExitOffset = new Point(data["position_exit_offset_x"], data["position_exit_offset_y"]);
    }

}
}
