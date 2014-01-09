/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/23/13
 * Time: 11:29 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerProgress.targets.grab.target
{
import soldiers.GameInfo;
import soldiers.models.game.managerProgress.targets.base.LTBase;
import soldiers.models.housesGame.base.HouseG;

public class LTTargetBase extends LTBase
{
    /*
     * Fields
     */

    protected var _targetHouse:HouseG;
    private var _targetHouseId:String;

    /*
     * Properties
     */


    public function get targetHouseId():String
    {
        return _targetHouseId;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function LTTargetBase()
    {
    }

    override public function onGameStart():void
    {
        var houses:Array = GameInfo.instance.managerGame.houses;

        for each(var house:HouseG in houses)
        {
            if (house.id == targetHouseId)
            {
                _targetHouse = house;

                break;
            }
        }

        super.onGameStart();
    }

    /*
     *  ISerializable
     */


    override public function deserialize(data:Object):void
    {
        super.deserialize(data);

        Debug.assert(data.hasOwnProperty("target_id"));

        _targetHouseId = data["target_id"];
    }

}
}
