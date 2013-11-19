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

import soldiers.models.housesGame.base.HouseG;

public class SoldierWaveInfo extends DisposableObject
{

    /*
     * Fields
     */
    private var _generatedSoldierRest:uint;
    private var _generatedSoldierCount:uint;

    private var _owner:HouseG;
    private var _target:HouseG;

    private var _timeGeneratedLast:int;
    private var _timeGeneratedFrequency:int;

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
        return _generatedSoldierCount;
    }

    public function set generatedSoldierCount(value:uint):void
    {
        _generatedSoldierCount = value;
    }

    public function get owner():HouseG
    {
        return _owner;
    }

    public function set owner(value:HouseG):void
    {
        _owner = value;
    }

    public function get target():HouseG
    {
        return _target;
    }

    public function set target(value:HouseG):void
    {
        _target = value;
    }

    public function get timeGeneratedLast():int
    {
        return _timeGeneratedLast;
    }

    public function set timeGeneratedLast(value:int):void
    {
        _timeGeneratedLast = value;
    }

    public function get timeGeneratedFrequency():int
    {
        return _timeGeneratedFrequency;
    }

    public function set timeGeneratedFrequency(value:int):void
    {
        _timeGeneratedFrequency = value;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function SoldierWaveInfo()
    {
    }

    public override function cleanup():void
    {
        _owner = null;
        _target = null;

        super.cleanup();
    }
}
}
