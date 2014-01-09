/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/8/14
 * Time: 10:44 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerProgress.targets.time
{
import soldiers.models.game.managerProgress.targets.base.LTBase;

public class LTTimeBase extends LTBase
{
    /*
     * Fields
     */
    private var _time:uint;

    /*
     * Properties
     */


    public function get time():uint
    {
        return _time;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function LTTimeBase()
    {
    }


    override public function onGameStart():void
    {

        super.onGameStart();
    }


    override public function deserialize(data:Object):void
    {
        super.deserialize(data);

        Debug.assert(data.hasOwnProperty("time"));
        _time = data["time"];
    }


}
}
