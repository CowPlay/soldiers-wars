/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/6/13
 * Time: 10:00 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerSoldiers
{
import core.DisposableObject;

import models.interfaces.players.IPlayerInfo;

import soldiers.Constants;
import soldiers.models.housesGame.base.HouseG;

public class SoldierWaveInfo extends DisposableObject
{
    /*
     * Fields
     */
    private var _generatedSoldierRest:uint;

    private var _waveOwnerType:String;

    private var _houseOwner:HouseG;

    //cache
    private var _houseOwnerLevel:uint;
    private var _houseOwnerLevelMax:uint;
    private var _houseOwnerType:String;
    private var _houseOwnerPlayer:IPlayerInfo;

    private var _houseTarget:HouseG;

    private var _timeGenerated:int;

    /*
     * Properties
     */
    public function get generatedSoldierRest():uint
    {
        return _generatedSoldierRest;
    }

    public function set generatedSoldierRest(value:uint):void
    {
        _generatedSoldierRest = value;
    }

    public function get generatedSoldierCount():uint
    {
        return Constants.PATH_COUNT;
    }

    public function get waveOwnerType():String
    {
        return _waveOwnerType;
    }

    public function get houseOwner():HouseG
    {
        return _houseOwner;
    }

    public function get houseTarget():HouseG
    {
        return _houseTarget;
    }

    public function get timeGenerated():int
    {
        return _timeGenerated;
    }

    public function set timeGenerated(value:int):void
    {
        _timeGenerated = value;
    }

    public function get timeGeneratedFrequency():int
    {
        return ConstantsBase.ANIMATION_DURATION * 4 * 1000;
    }


    public function get houseOwnerLevelMax():uint
    {
        return _houseOwner.ownerType == _houseOwnerType ? _houseOwner.houseConfig.levelMax : _houseOwnerLevelMax;
    }

    public function get houseOwnerType():String
    {
        return _houseOwnerType;
    }

    public function get houseOwnerLevel():uint
    {
        return _houseOwner.ownerType == _houseOwnerType ? _houseOwner.level : _houseOwnerLevel;
    }

    public function get houseOwnerPlayer():IPlayerInfo
    {
        return _houseOwnerPlayer;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function SoldierWaveInfo(houseOwner:HouseG, houseTarget:HouseG)
    {
        _houseOwner = houseOwner;
        _houseOwnerLevel = houseOwner.level;
        _houseOwnerLevelMax = houseOwner.houseConfig.levelMax;
        _houseOwnerType = houseOwner.ownerType;
        _houseOwnerPlayer = houseOwner.owner;

        _houseTarget = houseTarget;

        _waveOwnerType = _houseOwner.ownerType;
    }

    public override function cleanup():void
    {
        _houseOwner = null;
        _houseTarget = null;

        super.cleanup();
    }
}
}
