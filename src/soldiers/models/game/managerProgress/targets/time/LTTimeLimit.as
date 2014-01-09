/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/23/13
 * Time: 10:01 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerProgress.targets.time
{
public class LTTimeLimit extends LTTimeBase
{
    /*
     * Fields
     */
    private var _timeLeft:int;


    /*
     * Properties
     */

    public function get timeLeft():uint
    {
        return _timeLeft;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function LTTimeLimit()
    {
    }


    override public function onGameStart():void
    {
        _timeLeft = time;

        super.onGameStart();
    }

    override public function update():void
    {
        _timeLeft -= 1000;

        var isComplete:Boolean = _timeLeft >= 0;

        setIsComplete(isComplete);
    }


}
}
