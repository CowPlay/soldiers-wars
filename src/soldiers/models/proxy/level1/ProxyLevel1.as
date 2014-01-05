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

import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.proxy.levelTargets.ProxyLevelTargets;

public class ProxyLevel1
{
    public static function getLevelData1():Object
    {
        var houseData1_0:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_player",
            level: 1,

            position_x: 15,
            position_y: 3,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData1_1:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_neutral",
            level: 1,

            position_x: 15,
            position_y: 23,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData1_2:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_neutral",
            level: 1,

            position_x: 11,
            position_y: 15,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData1_3:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_enemy",
            level: 1,

            position_x: 19,
            position_y: 15,

            id: UIDUtil.createUID(),

            soldiers: 5
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

            targets_star_1: [ProxyLevelTargets.getTargetGrabAllHouses()],
            targets_star_2: [],
            targets_star_3: [],

            ai_actions: [],

            decor : [],
            houses: [houseData1_0, houseData1_1, houseData1_2, houseData1_3]
        };

        return   level1Data;
    }
}
}
