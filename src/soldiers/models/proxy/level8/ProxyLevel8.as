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
package soldiers.models.proxy.level8
{
import mx.utils.UIDUtil;

import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.proxy.aiActions.ProxyAiActions;
import soldiers.models.proxy.levelTargets.ProxyLevelTargets;

public class ProxyLevel8
{
    public static function getLevelData8():Object
    {
        var houseData8_0:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_PLAYER,
            level: 1,

            position_x: 15,
            position_y: 15,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData8_1:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 2,

            position_x: 47,
            position_y: 47,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData8_2:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 2,

            position_x: 47,
            position_y: 35,

            id: UIDUtil.createUID(),

            soldiers: 3
        };

        var houseData8_3:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 2,

            position_x: 35,
            position_y: 47,

            id: UIDUtil.createUID(),

            soldiers: 3
        };

        var houseData8_4:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 27,
            position_y: 27,

            id: UIDUtil.createUID(),

            soldiers: 30
        };

        var houseData8_5:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 29,
            position_y: 13,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData8_6:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 13,
            position_y: 29,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData8_7:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 5,
            position_y: 5,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData8_8:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 45,
            position_y: 5,

            id: UIDUtil.createUID(),

            soldiers: 3
        };

        var houseData8_9:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 5,
            position_y: 45,

            id: UIDUtil.createUID(),

            soldiers: 3
        };

        var level8Data:Object =
        {
            id                  : "8",
            name                : "",
            description         : "",
            number              : 0,
            complete            : false,
            reward_currency_soft: 0,
            reward_points       : 0,

            grid_width : 52,
            grid_height: 52,

            houses_level_max: 2,

            stars_count: 0,

            targets_star_1: [ProxyLevelTargets.getGrabAll()],
            targets_star_2: [],
            targets_star_3: [],

            ai_actions: [ProxyAiActions.getActionAttack0(), ProxyAiActions.getActionAttack1(), ProxyAiActions.getActionDeffence0(), ProxyAiActions.getActionUpgrade0() ],

            decor : [],
            houses: [houseData8_0, houseData8_1, houseData8_2, houseData8_3, houseData8_4, houseData8_5, houseData8_6, houseData8_7, houseData8_8, houseData8_9]
        };


        return level8Data;
    }
}
}
