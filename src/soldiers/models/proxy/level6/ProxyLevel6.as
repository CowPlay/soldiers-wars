/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/24/13
 * Time: 4:30 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.proxy.level6
{
import mx.utils.UIDUtil;

import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.proxy.aiActions.ProxyAiActions;
import soldiers.models.proxy.levelTargets.ProxyLevelTargets;

public class ProxyLevel6
{
    public static function getLevelData6():Object
    {
        var houseData6_0:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_PLAYER,
            level: 1,

            position_x: 4,
            position_y: 4,

            id: UIDUtil.createUID(),

            soldiers: 1
        };

        var houseData6_1:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 17,
            position_y: 17,

            id: UIDUtil.createUID(),

            soldiers: 30
        };

        var houseData6_2:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 29,
            position_y: 5,

            id: UIDUtil.createUID(),

            soldiers: 15
        };

        var houseData6_3:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 5,
            position_y: 29,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData6_4:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 2,

            position_x: 30,
            position_y: 30,

            id: UIDUtil.createUID(),

            soldiers: 8
        };

        var level6Data:Object =
        {
            id                  : "6",
            name                : "",
            description         : "",
            number              : 0,
            complete            : false,
            reward_currency_soft: 0,
            reward_points       : 0,

            grid_width : 34,
            grid_height: 34,

            stars_count   : 0,

            // Захватить все здания противника
            targets_star_1: [ProxyLevelTargets.getOwnerGrabAll(EHouseOwner.EHO_ENEMY)],
            // Не потерять ниодного здания
            targets_star_2: [ProxyLevelTargets.getOwnerNotMissingAny(EHouseOwner.EHO_PLAYER)],
            //TODO: Убить не более 50 вражеских юнитов
            targets_star_3: [],

            houses_level_max: 3,

            ai_actions: [ProxyAiActions.getActionAttack0(), ProxyAiActions.getActionAttack1(), ProxyAiActions.getActionDeffence0(), ProxyAiActions.getActionUpgrade0() ],

            decor : [],
            houses: [houseData6_0, houseData6_1, houseData6_2, houseData6_3, houseData6_4]
        };


        return level6Data;
    }
}
}
