/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/20/13
 * Time: 7:07 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesGame.base
{
import serialization.ISerializable;

public class HouseGConfig implements ISerializable
{
    /*
     * Fields
     */
    private var _levelMax:uint;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function HouseGConfig()
    {
        init();
    }

    private function init():void
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
        Debug.assert(data.hasOwnProperty("level_max"));


    }

    /*
     * IDisposable
     */


    public function cleanup():void
    {
    }
}
}
