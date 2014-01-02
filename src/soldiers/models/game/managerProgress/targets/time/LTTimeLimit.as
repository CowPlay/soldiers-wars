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
import flash.utils.getTimer;

import soldiers.GameInfo;
import soldiers.models.game.managerProgress.targets.base.LTBase;
import soldiers.models.game.managerProgress.targets.time.LTTimeBase;

public class LTTimeLimit extends LTTimeBase
{
    /*
     * Fields
     */


    /*
     * Properties
     */

    override public function isComplete():Boolean
    {
        var result:Boolean = getTimer() - GameInfo.instance.managerGame.currentLevel.timeStart < _time;

        return result;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function LTTimeLimit()
    {
        init();
    }

    private function init():void
    {
    }

    /*
     *  ISerializable
     */



}
}
