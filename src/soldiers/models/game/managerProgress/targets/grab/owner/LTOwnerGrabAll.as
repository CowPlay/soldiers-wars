/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/7/14
 * Time: 10:33 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerProgress.targets.grab.owner
{
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;

public class LTOwnerGrabAll extends LTOwnerBase
{
    /*
     * Fields
     */


    private var _housesRest:uint;
    /*
     * Properties
     */
    public function get housesRest():uint
    {
        return _housesRest;
    }


    /*
     * Methods
     */

    //! Default constructor

    public function LTOwnerGrabAll()
    {
    }


    override public function update():void
    {
        _housesRest = 0;

        var isComplete:Boolean = true;

        for each(var house:HouseG in _targetHouses)
        {
            if (house.ownerType != EHouseOwner.EHO_PLAYER)
            {
                isComplete = false;

                _housesRest++;
            }
        }

        setIsComplete(isComplete);
    }


}
}
