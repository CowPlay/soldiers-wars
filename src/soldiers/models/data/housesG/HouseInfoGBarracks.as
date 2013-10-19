/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 5/29/13
 * Time: 4:17 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.data.housesG
{
import controls.EControlUpdateTypeBase;

import flash.events.Event;
import flash.events.TimerEvent;
import flash.utils.Timer;

import soldiers.models.data.housesG.base.EHouseGType;
import soldiers.models.data.housesG.base.HouseInfoG;

import utils.memory.UtilsMemory;

//! Represents model of Barracks
public class HouseInfoGBarracks extends HouseInfoG
{

    private var _timerSoldierGenerator:Timer;


    /*
     * Properties
     */

    public override function get type():String
    {
        return EHouseGType.EHGT_BARRACKS;
    }

    /*
     * Methods
     */

    //! Default constructor for barracks
    //! If owner type == null -> type = neutral
    public function HouseInfoGBarracks()
    {
        super();

        //TODO: move to config
        _timerSoldierGenerator = new Timer(1000);
        UtilsMemory.registerEventListener(_timerSoldierGenerator, TimerEvent.TIMER, this, incrementSoldierCount);
        _timerSoldierGenerator.start();
    }

    public function incrementSoldierCount(e:Event):void
    {
        if (owner != null)
        {
            if (soldierCount == soldierCountMax)
            {
                //do nothing
            }
            else
            {
                soldierCount < soldierCountMax ? soldierCount++ : soldierCount--;
                view.update(EControlUpdateTypeBase.ECUT_ENTRY_UPDATED);
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
