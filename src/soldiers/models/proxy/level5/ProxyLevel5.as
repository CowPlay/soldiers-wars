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
package soldiers.models.proxy.level5
{
import mx.utils.UIDUtil;

import soldiers.models.game.decor.EDecorType;
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
            level: 1,

            position_x: 30,
            position_y: 35,

            id: UIDUtil.createUID(),

            soldiers: 8
        };

        var houseData5_1:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 3,

            position_x: 43,
            position_y: 43,

            id: UIDUtil.createUID(),

            soldiers: 12
        };

        var houseData5_2:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 5,
            position_y: 5,

            id: UIDUtil.createUID(),

            soldiers: 6
        };

        var houseData5_3:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 20,
            position_y: 8,

            id: UIDUtil.createUID(),

            soldiers: 6
        };

        var houseData5_4:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 8,
            position_y: 20,

            id: UIDUtil.createUID(),

            soldiers: 6
        };

        var houseData5_5:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 6,
            position_y: 44,

            id: UIDUtil.createUID(),

            soldiers: 8
        };

        var houseData5_6:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 44,
            position_y: 6,

            id: UIDUtil.createUID(),

            soldiers: 8
        };

        var decorData5_0:Object =
        {
            type: EDecorType.EDT_0,

            width : 3,
            height: 18,

            position_x: 24,
            position_y: 40
        };

        var decorData5_1:Object =
        {
            type: EDecorType.EDT_0,

            width : 9,
            height: 2,

            position_x: 45,
            position_y: 20
        };

        var decorData5_2:Object =
        {
            type: EDecorType.EDT_0,

            width : 15,
            height: 12,

            position_x: 25,
            position_y: 25
        };

        var decorData5_3:Object =
        {
            type: EDecorType.EDT_0,

            width : 4,
            height: 4,

            position_x: 40,
            position_y: 46
        };

        var level5Data:Object =
        {
            id                  : "5",
            name                : "",
            description         : "",
            number              : 0,
            complete            : false,
            reward_currency_soft: 0,
            reward_points       : 0,

            grid_width : 50,
            grid_height: 50,

            houses_level_max: 3,

            stars_count: 0,

            targets_star_1: [ProxyLevelTargets.getGrabAll()],
            targets_star_2: [],
            targets_star_3: [],

            ai_actions: [ProxyAiActions.getActionAttack0(), ProxyAiActions.getActionAttack1(), ProxyAiActions.getActionDeffence0(), ProxyAiActions.getActionUpgrade0() ],

            decor : [decorData5_0, decorData5_1, decorData5_2/*, decorData4_3*/],
            houses: [houseData5_0, houseData5_1, houseData5_2, houseData5_3, houseData5_4, houseData5_5, houseData5_6]
        };


        return level5Data;
    }
}
}