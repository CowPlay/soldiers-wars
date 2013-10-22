/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 22.10.13
 * Time: 16:36
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesVillage.mineGold
{
import flash.utils.Timer;

import soldiers.models.housesVillage.base.HouseConfigV;

public class HouseConfigVMineGold extends HouseConfigV
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

    public function HouseConfigVMineGold()
    {
        super();
    }

    public function timerStart(onComplete:Function):void
    {

    }

}
}
