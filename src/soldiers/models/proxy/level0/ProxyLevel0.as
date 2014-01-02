/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/24/13
 * Time: 4:26 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.proxy.level0
{
import mx.utils.UIDUtil;

import soldiers.models.housesGame.base.EHouseOwner;

import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.proxy.levelTargets.ProxyLevelTargets;
import soldiers.models.proxy.aiActions.ProxyAiActions;

public class ProxyLevel0
{
    public static function getLevelData0():Object
    {
        var houseData0_0:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_PLAYER,
            level: 1,

            position_x: 5,
            position_y: 5,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData0_1:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_PLAYER,
            level: 1,

            position_x: 20,
            position_y: 5,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData0_2:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 20,
            position_y: 24,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData0_3:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 5,
            position_y: 15,

            id: UIDUtil.createUID(),

            soldiers: 10
        };


        var level0Data:Object =
        {
            id                  : "0",
            name                : "",
            description         : "",
            number              : 0,
            complete            : false,
            reward_currency_soft: 0,
            reward_points       : 0,

            grid_width          : 30,
            grid_height         : 30,

            houses_level_max    : 2,

            targets_star_1: [ProxyLevelTargets.getTargetGrabAllHouses()],
            targets_star_2: [ProxyLevelTargets.getTargetGrabTargetHouse(houseData0_3.id)],
            targets_star_3: [ProxyLevelTargets.getTargetNone()],

//              ProxyAiActions.getActionAttack0()
//              ProxyAiActions.getActionAttack1()
//              ProxyAiActions.getActionDeffence0()
//              ProxyAiActions.getActionUpgrade0()


            ai_actions: [],

            houses: [houseData0_0, houseData0_1, houseData0_2, houseData0_3]
        };

        return  level0Data;

    }
}
}
