/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/26/13
 * Time: 2:27 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerAi.aiActions.defence
{
import soldiers.models.game.ManagerGame;
import soldiers.models.game.managerAi.aiActions.base.AiActionBase;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;

public class AiActionDeffense0 extends AiActionBase
{
    /*
     * Fields
     */
    private var _soldiersLimit:int;
    private var _soldiersTargetCount:int;

    /*
     * Properties
     */
    override public function get canApply():Boolean
    {
        var result:Boolean = false;

        var houses:Array = _managerGame.getHousesByDistance(owner, [EHouseOwner.EHO_ENEMY]);

        for each(var house:HouseG in houses)
        {
            if(house.soldierCount < _soldiersTargetCount && owner.soldierCountPercent > _soldiersLimit)
            {
                _target = house;
                result = true;

                break;
            }
        }

        return result;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function AiActionDeffense0(owner:HouseG, managerGame:ManagerGame)
    {
        super(owner, managerGame);
    }


    override public function deserialize(data:Object):void
    {
        super.deserialize(data);

        Debug.assert(data.hasOwnProperty("soldiers_limit"));
        Debug.assert(data.hasOwnProperty("soldiers_target_count"));

        _soldiersLimit = data["soldiers_limit"];
        _soldiersTargetCount = data["soldiers_target_count"];
    }
}
}
