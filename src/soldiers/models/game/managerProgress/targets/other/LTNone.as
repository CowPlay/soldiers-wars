/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/24/13
 * Time: 3:11 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerProgress.targets.other
{
import soldiers.models.game.managerProgress.targets.base.LTBase;

public class LTNone   extends LTBase
{
    /*
     * Properties
     */

    override public function isComplete():Boolean
    {
        return true;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function LTNone()
    {
    }
}
}
