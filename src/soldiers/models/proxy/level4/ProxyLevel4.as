/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/24/13
 * Time: 4:30 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.proxy.level4
{
import mx.utils.UIDUtil;

import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.proxy.aiActions.ProxyAiActions;
import soldiers.models.proxy.levelTargets.ProxyLevelTargets;

public class ProxyLevel4
{
    public static function getLevelData4():Object
    {
        var houseData4_0:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_PLAYER,
            level: 3,

            position_x: 20,
            position_y: 20,

            id: UIDUtil.createUID(),

            soldiers: 24
        };

        var houseData4_1:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 8,
            position_y: 8,

            id: UIDUtil.createUID(),

            soldiers: 1
        };

        var houseData4_2:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 32,
            position_y: 32,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData4_3:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 32,
            position_y: 8,

            id: UIDUtil.createUID(),

            soldiers: 3
        };

        var houseData4_4:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 8,
            position_y: 32,

            id: UIDUtil.createUID(),

            soldiers: 7
        };

        var houseData4_5:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 20,
            position_y: 4,

            id: UIDUtil.createUID(),

            soldiers: 2
        };

        var houseData4_6:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 4,
            position_y: 20,

            id: UIDUtil.createUID(),

            soldiers: 8
        };

        var houseData4_7:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 20,
            position_y: 36,

            id: UIDUtil.createUID(),

            soldiers: 6
        };

        var houseData4_8:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 36,
            position_y: 20,

            id: UIDUtil.createUID(),

            soldiers: 4
        };
        var level4Data:Object =
        {
            id                  : "4",
            name                : "",
            description         : "",
            number              : 0,
            complete            : false,
            reward_currency_soft: 0,
            reward_points       : 0,

            grid_width : 40,
            grid_height: 40,

            houses_level_max: 3,

            stars_count   : 0,

            // Продержаться 2 минуты
            targets_star_1: [ProxyLevelTargets.getTimePlay(60 * 2 * 1000)],
            //TODO: Улучшить все здания до 3 уровня
            targets_star_2: [],
            // Захватить все вражеские здания
            targets_star_3: [ProxyLevelTargets.getOwnerGrabAll(EHouseOwner.EHO_ENEMY)],

            ai_actions: [ProxyAiActions.getActionAttack0(), ProxyAiActions.getActionAttack1(), ProxyAiActions.getActionDeffence0(), ProxyAiActions.getActionUpgrade0() ],

            decor : [],
            houses: [houseData4_0, houseData4_1, houseData4_2, houseData4_3, houseData4_4, houseData4_5, houseData4_6, houseData4_7, houseData4_8]
        };


        return level4Data;
    }
}
}

