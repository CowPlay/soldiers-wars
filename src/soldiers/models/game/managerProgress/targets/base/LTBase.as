/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/23/13
 * Time: 10:00 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerProgress.targets.base
{
import core.DisposableObject;

import serialization.ISerializable;

public class LTBase extends DisposableObject implements ISerializable
{
    /*
     * Fields
     */

    private var _type:String;

    /*
     * Properties
     */


    public function get type():String
    {
        return _type;
    }

    public function isComplete():Boolean
    {
        Debug.assert(false, "Please override it");
        return false;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function LTBase()
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
        Debug.assert(data.hasOwnProperty("type"));

        _type = data["type"];

    }
}
}
