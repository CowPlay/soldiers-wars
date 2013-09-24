/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 5/29/13
 * Time: 4:17 PM
 * To change this template use File | Settings | File Templates.
 */
package models.data.houses.barracks
{
import flash.events.Event;
import flash.events.TimerEvent;
import flash.utils.Timer;

import models.data.houses.base.EHouseType;
import models.data.houses.base.HouseInfo;

//! Represents model of Barracks
public class HouseInfoBarracks extends HouseInfo
{

    private var _timerSoldierGenerator:Timer;


    /*
     * Properties
     */

    public override function get type():String
    {
        return EHouseType.EHT_BARRACKS;
    }

    /*
     * Methods
     */

    //! Default constructor for barracks
    //! If owner type == null -> type = neutral
    public function HouseInfoBarracks()
    {
        super();

        //TODO: move to config
        _timerSoldierGenerator = new Timer(1000);
        _timerSoldierGenerator.addEventListener(TimerEvent.TIMER, incrementSoldierCount);
        _timerSoldierGenerator.start();
    }

    private function incrementSoldierCount(e:Event):void
    {
//        if (_ownerType != EHouseOwner.EHO_NEUTRAL)
//        {
//            if (_soldierCount < _soldierCountMax)
//            {
//                setSoldierCount(_soldierCount + 1);
//            }
//            else if (_soldierCount >= _soldierCountMax + 1)
//            {
//                setSoldierCount(_soldierCount - 1);
//            }
//        }
    }

    /*
     * ISerializable
     */
    public override function serialize():Object
    {
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
    }
}
}
