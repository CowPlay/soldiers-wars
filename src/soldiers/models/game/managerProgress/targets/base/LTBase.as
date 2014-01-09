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

import soldiers.GameInfo;
import soldiers.controllers.EControllerUpdate;

public class LTBase extends DisposableObject implements ISerializable
{
    /*
     * Fields
     */

    private var _type:String;

    private var _isComplete:Boolean;

    /*
     * Properties
     */


    public function get type():String
    {
        return _type;
    }

    public function isComplete():Boolean
    {
        return _isComplete;
    }

    protected function setIsComplete(value:Boolean):void
    {
        if (_isComplete == value)
            return;

        _isComplete = value;

        GameInfo.instance.managerStates.currentState.update(EControllerUpdate.ECU_LEVEL_TARGET_STATUS);
    }

    /*
     * Methods
     */

    //! Default constructor
    public function LTBase()
    {
        super(false);
    }

    public function onGameStart():void
    {
        update();
    }

    public function update():void
    {
        Debug.assert(false, "Please override");
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
