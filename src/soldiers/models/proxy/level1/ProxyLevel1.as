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
package soldiers.models.proxy.level1
{
import mx.utils.UIDUtil;

import soldiers.models.housesGame.base.EHouseOwner;

import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.proxy.aiActions.ProxyAiActions;
import soldiers.models.proxy.levelTargets.ProxyLevelTargets;

public class ProxyLevel1
{
    public static function getLevelData1():Object
    {
        var houseData1_0:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_PLAYER,
            level: 1,

            position_x: 15,
            position_y: 4,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData1_1:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 15,
            position_y: 26,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData1_2:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 10,
            position_y: 15,

            id: UIDUtil.createUID(),

            soldiers: 4
        };

        var houseData1_3:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 20,
            position_y: 15,

            id: UIDUtil.createUID(),

            soldiers: 8
        };


        var level1Data:Object =
        {
            id                  : "1",
            name                : "",
            description         : "",
            number              : 0,
            complete            : false,
            reward_currency_soft: 0,
            reward_points       : 0,
            grid_width          : 30,
            grid_height         : 30,

            houses_level_max: 1,

            stars_count   : 0,

            // Захватить все вражеские здания на уровне
            targets_star_1: [ProxyLevelTargets.getOwnerGrabAll(EHouseOwner.EHO_ENEMY)],
            // Захватить все здания на уровне
            targets_star_2: [ProxyLevelTargets.getGrabAll()],
            // Отсутствует
            targets_star_3: [ProxyLevelTargets.getNone()],

            ai_actions    : [ProxyAiActions.getActionAttack0(), ProxyAiActions.getActionAttack1(), ProxyAiActions.getActionDeffence0(), ProxyAiActions.getActionUpgrade0() ],

            decor : [],
            houses: [houseData1_0, houseData1_1, houseData1_2, houseData1_3]
        };

        return   level1Data;
    }
}
}
