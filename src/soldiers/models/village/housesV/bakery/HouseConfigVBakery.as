/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/19/13
 * Time: 5:26 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.village.housesV.bakery
{
import controls.EControlUpdateTypeBase;

import flash.events.TimerEvent;
import flash.utils.Timer;

import soldiers.models.village.housesV.base.HouseConfigV;

import utils.memory.UtilsMemory;

public class HouseConfigVBakery extends HouseConfigV
{
    /*
     * Fields
     */

    private var _time:int;
    private var _count:int;
    private var _timeLeft:int;

    private var _timer:Timer;
    private var _timerCallback:Function;


    /*
     * Properties
     */

    //! Returns generation bread time
    public function get time():int
    {
        return _time;
    }

    //! Return generation bread count
    public function get count():int
    {
        return _count;
    }


    public function get timeLeft():int
    {
        return _timeLeft;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function HouseConfigVBakery()
    {
        super();
    }

    public function timerStart(onComplete:Function):void
    {
        Debug.assert(onComplete != null);
        Debug.assert(_timer == null);

        _timerCallback = onComplete;


        _timer = new Timer(1000, _time);
        UtilsMemory.registerEventListener(_timer, TimerEvent.TIMER, this, onTimerTick);
        UtilsMemory.registerEventListener(_timer, TimerEvent.TIMER_COMPLETE, this, onTimerComplete);
        _timer.start();
    }

    public function onTimerTick(e:TimerEvent):void
    {
        _timeLeft--;

        if (view != null)
        {
            view.update(EControlUpdateTypeBase.ECUT_ENTRY_UPDATED);
        }
    }

    public function onTimerComplete(e:TimerEvent):void
    {
        UtilsMemory.unregisterEventListener(_timer, TimerEvent.TIMER, this, onTimerTick);
        UtilsMemory.unregisterEventListener(_timer, TimerEvent.TIMER_COMPLETE, this, onTimerComplete);
        _timer = null;

        _timeLeft = _time;

        if (view != null)
        {
            view.update(EControlUpdateTypeBase.ECUT_ENTRY_UPDATED);
        }

        _timerCallback(this);
    }

    /*
     * ISerializable
     */

    public override function deserialize(data:Object):void
    {
        super.deserialize(data);

        Debug.assert(data.hasOwnProperty("time"));
        Debug.assert(data.hasOwnProperty("count"));

        _time = data["time"];
        _timeLeft = _time;
        _count = data["count"];
    }


}
}
