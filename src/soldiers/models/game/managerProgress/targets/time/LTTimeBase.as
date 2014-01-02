/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/23/13
 * Time: 11:32 AM
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
    protected var _time:uint;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function LTTimeBase()
    {
    }

    override public function deserialize(data:Object):void
    {
        super.deserialize(data);

        Debug.assert(data.hasOwnProperty("time"));

        _time = data["time"];
    }
}
}
