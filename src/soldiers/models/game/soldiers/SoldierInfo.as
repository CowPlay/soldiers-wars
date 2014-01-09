/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 5/29/13
 * Time: 7:02 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.soldiers
{
import controllers.IController;

import core.DisposableObject;

import models.interfaces.players.IPlayerInfo;

import soldiers.GameInfo;
import soldiers.controllers.EControllerUpdate;
import soldiers.models.housesGame.base.HouseG;

public class SoldierInfo extends DisposableObject implements IDisposable
{
    private var _houseOwnerPlayer:IPlayerInfo;
    private var _houseOwnerType:String;
    private var _houseTarget:HouseG;

    private var _level:uint;
    private var _levelMax:uint;

    private var _path:Array;

    private var _controller:IController;

    private var _state:String;

    private var _isLastOnWave:Boolean;


    /*
     * Properties
     */


    public function get houseOwnerType():String
    {
        return _houseOwnerType;
    }

    public function get houseOwnerPlayer():IPlayerInfo
    {
        return _houseOwnerPlayer;
    }

    public function get houseTarget():HouseG
    {
        return _houseTarget;
    }

    public function get level():uint
    {
        return _level;
    }

    public function get controller():IController
    {
        return _controller;
    }

    public function set controller(value:IController):void
    {
        if (_controller == value)
            return;

        _controller = value;
    }

    public function get damage():int
    {
        return 1;
    }


    //! cells count by second
    public function get speed():Number
    {
        return 2;
    }


    public function get path():Array
    {
        return _path;
    }


    public function get levelMax():uint
    {
        return _levelMax;
    }


    public function get state():String
    {
        return _state;
    }


    public function set state(value:String):void
    {
        if (_state == value)
            return;

        _state = value;

        GameInfo.instance.managerStates.currentState.update(EControllerUpdate.ECU_SOLDIER_STATE)
    }

    public function get isLastOnWave():Boolean
    {
        return _isLastOnWave;
    }

    public function set isLastOnWave(value:Boolean):void
    {
        _isLastOnWave = value;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function SoldierInfo(houseOwnerType:String, level:uint, levelMax:uint, ownerPlayer:IPlayerInfo, target:HouseG, path:Array)
    {
        Debug.assert(ownerPlayer != null);
        Debug.assert(target != null);
        Debug.assert(path != null);
        Debug.assert(path.length > 1);

        _path = path;
        _level = level;
        _levelMax = levelMax;
        _houseOwnerType = houseOwnerType;
        _houseOwnerPlayer = ownerPlayer;

        _houseTarget = target;

        state = ESoldierState.ESS_NEW;
    }


    /*
     *  IDisposable
     */

    public override function cleanup():void
    {
        _houseOwnerPlayer = null;
        _houseTarget = null;

        _path.length = 0;
        _path = null;

        _controller = null;

        super.cleanup();
    }
}
}
