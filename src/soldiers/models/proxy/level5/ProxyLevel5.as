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
package soldiers.models.proxy.level5
{
import mx.utils.UIDUtil;

import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.proxy.aiActions.ProxyAiActions;
import soldiers.models.proxy.levelTargets.ProxyLevelTargets;

public class ProxyLevel5
{
    public static function getLevelData5():Object
    {
        var houseData5_0:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_PLAYER,
            level: 3,

            position_x: 20,
            position_y: 20,

            id: UIDUtil.createUID(),

            soldiers: 24
        };

        var houseData5_1:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 8,
            position_y: 8,

            id: UIDUtil.createUID(),

            soldiers: 1
        };

        var houseData5_2:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 32,
            position_y: 32,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData5_3:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 32,
            position_y: 8,

            id: UIDUtil.createUID(),

            soldiers: 3
        };

        var houseData5_4:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 8,
            position_y: 32,

            id: UIDUtil.createUID(),

            soldiers: 7
        };

        var houseData5_5:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 20,
            position_y: 4,

            id: UIDUtil.createUID(),

            soldiers: 2
        };

        var houseData5_6:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 4,
            position_y: 20,

            id: UIDUtil.createUID(),

            soldiers: 8
        };

        var houseData5_7:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 20,
            position_y: 36,

            id: UIDUtil.createUID(),

            soldiers: 6
        };

        var houseData5_8:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 36,
            position_y: 20,

            id: UIDUtil.createUID(),

            soldiers: 4
        };
        var level5Data:Object =
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
            houses: [houseData5_0, houseData5_1, houseData5_2, houseData5_3, houseData5_4, houseData5_5, houseData5_6, houseData5_7, houseData5_8]
        };


        return level5Data;
    }
}
}