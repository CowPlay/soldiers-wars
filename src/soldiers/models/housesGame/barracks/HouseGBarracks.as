/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 5/29/13
 * Time: 4:17 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesGame.barracks
{
import controls.EControllerUpdateBase;

import flash.events.Event;
import flash.events.TimerEvent;
import flash.utils.Timer;

import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.housesGame.base.HouseG;

import utils.memory.UtilsMemory;

//! Represents model of Barracks
public class HouseGBarracks extends HouseG
{

    private var _timerSoldierGenerator:Timer;


    /*
     * Properties
     */

    public override function get type():String
    {
        return EHouseTypeG.EHGT_BARRACKS;
    }

    /*
     * Methods
     */

    //! Default constructor for barracks
    //! If owner type == null -> type = neutral
    public function HouseGBarracks()
    {
        super();

        //TODO: move time to config
        _timerSoldierGenerator = new Timer(1000);
        UtilsMemory.registerEventListener(_timerSoldierGenerator, TimerEvent.TIMER, this, incrementSoldierCount);
//        _timerSoldierGenerator.start();
    }

    public function incrementSoldierCount(e:Event):void
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

    /*
     * IDisposable
     */

    public override function cleanup():void
    {
        _timerSoldierGenerator.stop();
        UtilsMemory.unregisterEventListener(_timerSoldierGenerator, TimerEvent.TIMER, this, incrementSoldierCount);
        _timerSoldierGenerator = null;

        super.cleanup();
    }
}
}
