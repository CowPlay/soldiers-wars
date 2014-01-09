/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/23/13
 * Time: 10:41 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerProgress.targets.grab.target
{
import soldiers.models.housesGame.base.EHouseOwner;

public class LTTargetNotGrab extends LTTargetBase
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function LTTargetNotGrab()
    {
    }


    override public function update():void
    {
        var isComplete:Boolean = _targetHouse.ownerType != EHouseOwner.EHO_PLAYER;
        setIsComplete(isComplete);
    }
}
}
