/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/23/13
 * Time: 11:18 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerProgress.targets.grab.owner
{
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;

public class LTOwnerNotMissingAny extends LTOwnerBase
{
    /*
     * Fields
     */

    private var _isMissingAny:Boolean;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function LTOwnerNotMissingAny()
    {
        _isMissingAny = false;
    }


    override public function update():void
    {
        var isComplete:Boolean = !_isMissingAny;

        if (isComplete)
        {
            for each(var house:HouseG in _targetHouses)
            {
                if (house.ownerType != EHouseOwner.EHO_PLAYER)
                {
                    isComplete = false;
                    _isMissingAny = true;
                }
            }
        }

        setIsComplete(isComplete);
    }
}
}
