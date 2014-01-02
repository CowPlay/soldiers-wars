/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 5/29/13
 * Time: 4:17 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesGame.barracks
{
import flash.events.Event;
import flash.events.TimerEvent;
import flash.utils.Timer;

import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.housesGame.base.HouseG;

import utils.memory.UtilsMemory;

//! Represents model of Barracks
public class HouseGBarracks extends HouseG
{

    private var _soldiersGenerationSpeed:Number;
    private var _timerSoldiers:Timer;


    /*
     * Properties
     */

    public override function get type():String
    {
        return EHouseTypeG.EHGT_BARRACKS;
    }

    public override function levelUpgrade():void
    {
        super.levelUpgrade();

        cleanupTimerSoldiers();
        createTimerSoldiers();
    }

    /*
     * Events
     */


    override public function onGameStart():void
    {
        super.onGameStart();

        createTimerSoldiers();
    }

    /*
     * Methods
     */

    //! Default constructor for barracks
    //! If owner type == null -> type = neutral
    public function HouseGBarracks()
    {
        super();

        var houseConfig:HouseGConfigBarracks = houseConfig as HouseGConfigBarracks;

        _soldiersGenerationSpeed = houseConfig.soldiersGenerationSpeed;
    }

    private function createTimerSoldiers():void
    {
        Debug.assert(_timerSoldiers == null);

        var time:Number = 1 / Math.pow(_soldiersGenerationSpeed, (level - 1));

        _timerSoldiers = new Timer(time * 1000);
        UtilsMemory.registerEventListener(_timerSoldiers, TimerEvent.TIMER, this, incrementSoldierCount);
        _timerSoldiers.start();
    }

    private function incrementSoldierCount(e:Event):void
    {
        if (owner != null)
        {
            if (soldierCount == this.currentLevelInfo.soldiersMax)
            {
                //do nothing
            }
            else
            {
                soldierCount < this.currentLevelInfo.soldiersMax ? soldierCount++ : soldierCount--;
            }
        }
    }

    /*
     * ISerializable
     */
    public override function serialize():Object
    {
        Debug.assert(false);
        return null;
    }

    public override function deserialize(data:Object):void
    {
        super.deserialize(data);

    }

    private function cleanupTimerSoldiers():void
    {
        if (_timerSoldiers != null)
        {
            _timerSoldiers.stop();
            UtilsMemory.unregisterEventListener(_timerSoldiers, TimerEvent.TIMER, this, incrementSoldierCount);
            _timerSoldiers = null;
        }
    }

    /*
     * IDisposable
     */

    public override function cleanup():void
    {
        cleanupTimerSoldiers();

        super.cleanup();
    }
}
}
