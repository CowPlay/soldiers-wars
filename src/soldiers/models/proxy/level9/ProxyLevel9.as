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
package soldiers.models.proxy.level9
{
import mx.utils.UIDUtil;

import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.proxy.aiActions.ProxyAiActions;
import soldiers.models.proxy.levelTargets.ProxyLevelTargets;

public class ProxyLevel9
{
    public static function getLevelData9():Object
    {
        var houseData9_0:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_PLAYER,
            level: 2,

            position_x: 8,
            position_y: 52,

            id: UIDUtil.createUID(),

            soldiers: 15
        };

        var houseData9_1:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 10,
            position_y: 40,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData9_2:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 20,
            position_y: 50,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData9_3:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 20,
            position_y: 40,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData9_4:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 13,
            position_y: 13,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData9_5:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 47,
            position_y: 47,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData9_6:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 36,
            position_y: 16,

            id: UIDUtil.createUID(),

            soldiers: 3
        };

        var houseData9_7:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 44,
            position_y: 24,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData9_8:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 42,
            position_y: 5,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData9_9:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 55,
            position_y: 18,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData9_10:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 4,

            position_x: 52,
            position_y: 8,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var level9Data:Object =
        {
            id                  : "9",
            name                : "",
            description         : "",
            number              : 0,
            complete            : false,
            reward_currency_soft: 0,
            reward_points       : 0,

            houses_level_max: 2,

            grid_width : 60,
            grid_height: 60,

            stars_count   : 0,

            // Захватить здание houseData9_10
            targets_star_1: [ProxyLevelTargets.getTargetGrab(houseData9_10.id)],
            // TODO:Не допустить переполненности зданий
            targets_star_2: [],
            // Захватить все вражеские здания
            targets_star_3: [ProxyLevelTargets.getOwnerGrabAll(EHouseOwner.EHO_ENEMY)],

            ai_actions: [ProxyAiActions.getActionAttack0(), ProxyAiActions.getActionAttack1(), ProxyAiActions.getActionDeffence0(), ProxyAiActions.getActionUpgrade0() ],

            decor : [],
            houses: [houseData9_0, houseData9_1, houseData9_2, houseData9_3, houseData9_4, houseData9_5, houseData9_6, houseData9_7, houseData9_8, houseData9_9, houseData9_10]
        };


        return level9Data;
    }
}
}
