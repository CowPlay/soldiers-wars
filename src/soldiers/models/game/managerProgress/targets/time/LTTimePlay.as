/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/8/14
 * Time: 10:54 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerProgress.targets.time
{
public class LTTimePlay extends LTTimeBase
{
    /*
     * Fields
     */

    private var _timePlay:uint;

    /*
     * Properties
     */

    public function get timePlay():uint
    {
        return _timePlay;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function LTTimePlay()
    {
    }

    override public function onGameStart():void
    {
        _timePlay = 0;

        super.onGameStart();
    }


    override public function update():void
    {
        _timePlay += 1000;

        var isComplete:Boolean = _timePlay >= time;

        setIsComplete(isComplete);
    }
}
}
