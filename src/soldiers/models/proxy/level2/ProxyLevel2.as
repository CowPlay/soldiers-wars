/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/24/13
 * Time: 4:28 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.proxy.level2
{
import mx.utils.UIDUtil;

import soldiers.models.housesGame.base.EHouseOwner;

import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.proxy.aiActions.ProxyAiActions;
import soldiers.models.proxy.levelTargets.ProxyLevelTargets;

public class ProxyLevel2
{
    public static function getLevelData2():Object
    {
        var houseData2_0:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_PLAYER,
            level: 1,

            position_x: 27,
            position_y: 11,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData2_1:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_PLAYER,
            level: 1,

            position_x: 27,
            position_y: 21,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData2_2:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 16,
            position_y: 16,

            id: UIDUtil.createUID(),

            soldiers: 4
        };

        var houseData2_3:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 5,
            position_y: 21,

            id: UIDUtil.createUID(),

            soldiers: 8
        };

        var houseData2_4:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 5,
            position_y: 11,

            id: UIDUtil.createUID(),

            soldiers: 8
        };


        var level2Data:Object =
        {
            id                  : "1",
            name                : "",
            description         : "",
            number              : 0,
            complete            : true,
            reward_currency_soft: 0,
            reward_points       : 0,

            grid_width          : 33,
            grid_height         : 33,

            houses_level_max: 1,

            stars_count   : 0,

            // Захватить все вражеские здания на уровне
            targets_star_1: [ProxyLevelTargets.getOwnerGrabAll(EHouseOwner.EHO_ENEMY)],

            // Захватить все здания на уровне
            targets_star_2: [ProxyLevelTargets.getGrabAll()],

            // Не потерять ниодного строения
            targets_star_3: [ProxyLevelTargets.getOwnerNotMissingAny(EHouseOwner.EHO_PLAYER)],

            ai_actions    : [ProxyAiActions.getActionAttack0()],

            decor : [],
            houses: [houseData2_0, houseData2_1, houseData2_2, houseData2_3, houseData2_4]
        };

        return   level2Data;
    }
}
}

