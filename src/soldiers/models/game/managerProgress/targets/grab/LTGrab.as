/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/23/13
 * Time: 10:02 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerProgress.targets.grab
{
import soldiers.GameInfo;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;
import soldiers.models.game.managerProgress.targets.grab.LTGrabBase;

public class LTGrab extends LTGrabBase
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    public override function isComplete():Boolean
    {
        var result:Boolean = false;

        var houses:Array = GameInfo.instance.managerGame.houses;

        for each(var house:HouseG in houses)
        {
            if (house.id == _targetHouseId)
            {
                result = house.ownerType == EHouseOwner.EHO_PLAYER;

                break;
            }
        }

        return result;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function LTGrab()
    {
    }
}
}
