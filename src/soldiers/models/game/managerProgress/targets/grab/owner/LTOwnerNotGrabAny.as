/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/8/14
 * Time: 8:28 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerProgress.targets.grab.owner
{
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;

public class LTOwnerNotGrabAny extends LTOwnerBase
{
    /*
     * Fields
     */

    private var _isGrabAny:Boolean;
    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function LTOwnerNotGrabAny()
    {
        _isGrabAny = false;
    }


    override public function update():void
    {
        var isComplete:Boolean = !_isGrabAny;

        if (isComplete)
        {
            for each(var house:HouseG in _targetHouses)
            {
                if (house.ownerType == EHouseOwner.EHO_PLAYER)
                {
                    isComplete = false;
                    _isGrabAny = true;
                }
            }
        }

        setIsComplete(isComplete);
    }
}
}
