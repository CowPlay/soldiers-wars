/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/8/14
 * Time: 10:04 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerProgress.targets.grab.owner
{
import soldiers.GameInfo;
import soldiers.models.game.managerProgress.targets.base.LTBase;
import soldiers.models.housesGame.base.HouseG;

public class LTOwnerBase extends LTBase
{
    /*
     * Fields
     */

    protected var _targetHouses:Array;
    private var _targetOwnerType:String;

    /*
     * Properties
     */
    public function get targetOwnerType():String
    {
        return _targetOwnerType;
    }


    /*
     * Methods
     */

    //! Default constructor
    public function LTOwnerBase()
    {
    }

    override public function onGameStart():void
    {
        _targetHouses = [];

        var houses:Array = GameInfo.instance.managerGame.houses;

        for each(var house:HouseG in houses)
        {
            if (house.ownerType == _targetOwnerType)
            {
                _targetHouses.push(house);
            }
        }

        super.onGameStart();
    }

    override public function deserialize(data:Object):void
    {
        super.deserialize(data);

        Debug.assert(data.hasOwnProperty("owner_type"));
        _targetOwnerType = data["owner_type"];
    }
}
}
