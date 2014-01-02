/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/23/13
 * Time: 10:45 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerProgress.targets.grab
{
import soldiers.GameInfo;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;
import soldiers.models.game.managerProgress.targets.base.LTBase;

public class LTGrabAll extends LTBase
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    override public function isComplete():Boolean
    {
        var result:Boolean = true;

        var houses:Array = GameInfo.instance.managerGame.houses;
        for each(var house:HouseG in houses)
        {
            if (house.ownerType != EHouseOwner.EHO_PLAYER)
            {
                result = false;
                break;
            }
        }

        return result;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function LTGrabAll()
    {
        init();
    }

    private function init():void
    {
    }


}
}
