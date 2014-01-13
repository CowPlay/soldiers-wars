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
import soldiers.GameInfo;
import soldiers.models.game.ManagerGame;
import soldiers.models.game.managerAi.aiActions.base.AiActionBase;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;

public class AiActionAttack0 extends AiActionBase
{
    /*
     * Fields
     */

    private var _soldierLimitPlayer:uint;
    private var _soldierLimitNeutral:uint;

    /*
     * Properties
     */

    override public function get canApply():Boolean
    {
        var result:Boolean = false;

//        "attack_0:
//        1. Под ближайшим зданием должно подразумевается ближайшее здание, которое НЕ принадлежит стороне AI
//        2. Для нападение на здание необходимо чтобы в здании AI находилось заданное количество войск, а не в здании цели
//        "

        if (_target == null || _target.ownerType == EHouseOwner.EHO_ENEMY)
        {
            _target = _managerGame.getNearestHouse(owner, [EHouseOwner.EHO_NEUTRAL, EHouseOwner.EHO_PLAYER]);
        }

        if (_target != null)
        {
            if (_target.ownerType == EHouseOwner.EHO_NEUTRAL)
            {
                result = owner.soldierCountPercent > _soldierLimitNeutral
            }
            else if (_target.ownerType == EHouseOwner.EHO_PLAYER)
            {
                result = owner.soldierCountPercent > _soldierLimitPlayer
            }
        }

        return result;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function AiActionAttack0(owner:HouseG, managerGame:ManagerGame)
    {
        super(owner, managerGame);
    }

    override public function deserialize(data:Object):void
    {
        super.deserialize(data);

        data.hasOwnProperty("soldiers_limit_player");
        data.hasOwnProperty("soldiers_limit_neutral");

        _soldierLimitPlayer = data["soldiers_limit_player"];
        _soldierLimitNeutral = data["soldiers_limit_neutral"];
    }
}
}
