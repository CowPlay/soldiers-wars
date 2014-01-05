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
package soldiers.models.proxy.level3
{
import mx.utils.UIDUtil;

import soldiers.models.housesGame.base.EHouseTypeG;

public class ProxyLevel3
{
    public static function getLevelData3():Object
    {
        var houseData3_0:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_player",
            level: 2,

            position_x: 75,
            position_y: 75,

            id: UIDUtil.createUID(),

            soldiers: 20
        };

        var houseData3_1:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_enemy",
            level: 1,

            position_x: 55,
            position_y: 30,

            id: UIDUtil.createUID(),

            soldiers: 3
        };

        var houseData3_2:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_enemy",
            level: 1,

            position_x: 30,
            position_y: 55,

            id: UIDUtil.createUID(),

            soldiers: 3
        };

        var houseData3_3:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_enemy",
            level: 1,

            position_x: 30,
            position_y: 90,

            id: UIDUtil.createUID(),

            soldiers: 3
        };

        var houseData3_4:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_enemy",
            level: 1,

            position_x: 90,
            position_y: 30,

            id: UIDUtil.createUID(),

            soldiers: 3
        };

        var houseData3_5:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_enemy",
            level: 1,

            position_x: 95,
            position_y: 120,

            id: UIDUtil.createUID(),

            soldiers: 3
        };

        var houseData3_6:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_enemy",
            level: 1,

            position_x: 120,
            position_y: 95,

            id: UIDUtil.createUID(),

            soldiers: 3
        };

        var houseData3_7:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_enemy",
            level: 1,

            position_x: 120,
            position_y: 60,

            id: UIDUtil.createUID(),

            soldiers: 3
        };

        var houseData3_8:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_enemy",
            level: 1,

            position_x: 60,
            position_y: 120,

            id: UIDUtil.createUID(),

            soldiers: 3
        };

        var level3Data:Object =
        {
            id         : "3",
            name       : "",
            description: "",
            number     : 0,
            complete   : false,

            reward_currency_soft: 0,
            reward_points       : 0,

            grid_width : 150,
            grid_height: 150,

            targets_star_1: [],
            targets_star_2: [],
            targets_star_3: [],

            ai_actions: [],

            decor : [],
            houses: [houseData3_0, houseData3_1, houseData3_2, houseData3_3, houseData3_4, houseData3_5, houseData3_6, houseData3_7, houseData3_8]
        };


        return level3Data;
    }
}
}
