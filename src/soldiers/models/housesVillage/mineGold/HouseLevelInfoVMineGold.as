/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 22.10.13
 * Time: 16:36
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesVillage.mineGold
{
import views.EControllerUpdateBase;

import flash.events.TimerEvent;
import flash.utils.Timer;

import soldiers.models.housesVillage.base.HouseLevelInfoV;

import utils.memory.UtilsMemory;

public class HouseLevelInfoVMineGold extends HouseLevelInfoV
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
     *Properties
     */
    //! Return generation gold time
    public function get time():int
    {
        return _time;
    }

    //! Return generate gold count
    public function get count():int
    {
        return _count;
    }

    public function get timeLeft():int
    {
        return _timeLeft;
    }


    /*
     *Methods
     */

    public function HouseLevelInfoVMineGold()
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

    private function onTimerTick(e:TimerEvent):void
    {
        _timeLeft--;

        if (controller != null)
        {
            controller.update(EControllerUpdateBase.ECUT_ENTRY_UPDATED);
        }
    }

    private function onTimerComplete(e:TimerEvent):void
    {
        UtilsMemory.unregisterEventListener(_timer, TimerEvent.TIMER, this, onTimerTick);
        UtilsMemory.unregisterEventListener(_timer, TimerEvent.TIMER_COMPLETE, this, onTimerComplete);
        _timer = null;

        _timeLeft = _time;

        if (controller != null)
        {
            controller.update(EControllerUpdateBase.ECUT_ENTRY_UPDATED);
        }

        _timerCallback(this);
    }

    /*
     *ISerialize
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
