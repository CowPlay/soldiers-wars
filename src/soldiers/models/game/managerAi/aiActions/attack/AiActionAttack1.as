/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/25/13
 * Time: 3:03 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerAi.aiActions.attack
{
import flash.utils.getTimer;

import soldiers.GameInfo;
import soldiers.models.game.ManagerGame;
import soldiers.models.game.managerAi.aiActions.base.AiActionBase;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;

public class AiActionAttack1 extends AiActionBase
{
    /*
     * Fields
     */
    private var _attackTime:uint;
    private var _attackSoldierLimit:uint;

    /*
     * Properties
     */


    override public function get canApply():Boolean
    {
        var result:Boolean = false;

        var houses:Array = _managerGame.getHousesByDistance(owner, [EHouseOwner.EHO_PLAYER]);

        for each(var house:HouseG in houses)
        {
            if (_target == null)
            {
                _target = house;
            }
            else
            {
                _target = house.soldierCount < _target.soldierCount ? house : _target;
            }
        }

        if (_target != null)
        {
            var timeStart:int = GameInfo.instance.managerGame.timeStart;
            var currentTime:int = getTimer();

            result = currentTime - timeStart > _attackTime && owner.soldierCountPercent > _attackSoldierLimit;
        }

        return result;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function AiActionAttack1(owner:HouseG, managerGame:ManagerGame)
    {
        super(owner, managerGame);
    }

    override public function deserialize(data:Object):void
    {
        super.deserialize(data);

        data.hasOwnProperty("attack_time");
        data.hasOwnProperty("attack_soldiers_limit");

        _attackTime = data["attack_time"];
        _attackSoldierLimit = data["attack_soldiers_limit"];
    }
}
}
