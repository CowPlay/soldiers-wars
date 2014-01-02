/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/26/13
 * Time: 2:41 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerAi.aiActions.upgrade
{
import soldiers.models.game.ManagerGame;
import soldiers.models.game.managerAi.aiActions.base.AiActionBase;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;

public class AiActionUpgrade0 extends AiActionBase
{
    /*
     * Fields
     */

    private var _soldiersLimitPlayer:int;
    private var _soldiersLimit:int;

    /*
     * Properties
     */

    override public function get canApply():Boolean
    {
        var result:Boolean = true;

        if (owner.soldierCountPercent >= _soldiersLimit && owner.canLevelUpgrade)
        {
            var houses:Array = _managerGame.getHousesByDistance(owner, [EHouseOwner.EHO_PLAYER]);

            for each(var house:HouseG in houses)
            {
                if (house.soldierCountPercent > _soldiersLimitPlayer)
                {
                    result = false;

                    break;
                }
            }
        }
        else
        {
            result = false;
        }

        return result;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function AiActionUpgrade0(owner:HouseG, managerGame:ManagerGame)
    {
        super(owner, managerGame);
    }


    override public function apply():void
    {
        owner.levelUpgrade();
    }

    override public function deserialize(data:Object):void
    {
        super.deserialize(data);

        Debug.assert(data.hasOwnProperty("soldiers_limit_player"));
        Debug.assert(data.hasOwnProperty("soldiers_limit"));

        _soldiersLimitPlayer = data["soldiers_limit_player"];
        _soldiersLimit = data["soldiers_limit"];
    }
}
}
