/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/8/14
 * Time: 12:11 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerProgress.targets.grab.owner
{
import flash.utils.Dictionary;

import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;

public class LTOwnerGrabLimit extends LTOwnerBase
{
    /*
     * Fields
     */
    private var _grabLimit:uint;

    private var _housesStatus:Dictionary;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function LTOwnerGrabLimit()
    {
    }

    override public function onGameStart():void
    {
        super.onGameStart();

        _housesStatus = new Dictionary(true);

        for each(var house:HouseG in _housesStatus)
        {
            _housesStatus[house] = house.ownerType == EHouseOwner.EHO_PLAYER;
        }
    }


    override public function update():void
    {
        var grabCount:uint = 0;
        for each(var house:HouseG in _housesStatus)
        {
            var status:Boolean = house.ownerType == EHouseOwner.EHO_PLAYER;
            _housesStatus[house] = status;

            if (status)
            {
                grabCount++;
            }
        }

        var isComplete:Boolean = _grabLimit >= grabCount;
        setIsComplete(isComplete);
    }

    override public function deserialize(data:Object):void
    {
        super.deserialize(data);

        Debug.assert(data.hasOwnProperty("grab_limit"));
        _grabLimit = data["grab_limit"];
    }
}
}
