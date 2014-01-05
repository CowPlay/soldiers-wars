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

import soldiers.models.housesGame.base.EHouseTypeG;

public class ProxyLevel4
{
    public static function getLevelData4():Object
    {
        var houseData4_0:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_player",
            level: 1,

            position_x: 75,
            position_y: 12,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData4_1:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_enemy",
            level: 1,

            position_x: 30,
            position_y: 40,

            id: UIDUtil.createUID(),

            soldiers: 4
        };

        var houseData4_2:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_enemy",
            level: 1,

            position_x: 15,
            position_y: 80,

            id: UIDUtil.createUID(),

            soldiers: 4
        };

        var houseData4_3:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_enemy",
            level: 1,

            position_x: 120,
            position_y: 40,

            id: UIDUtil.createUID(),

            soldiers: 4
        };

        var houseData4_4:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_enemy",
            level: 1,

            position_x: 135,
            position_y: 80,

            id: UIDUtil.createUID(),

            soldiers: 4
        };

        var houseData4_5:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_enemy",
            level: 1,

            position_x: 75,
            position_y: 80,

            id: UIDUtil.createUID(),

            soldiers: 4
        };

        var houseData4_6:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_enemy",
            level: 1,

            position_x: 100,
            position_y: 120,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData4_7:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_enemy",
            level: 1,

            position_x: 75,
            position_y: 135,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData4_8:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: "eho_enemy",
            level: 1,

            position_x: 50,
            position_y: 120,

            id: UIDUtil.createUID(),

            soldiers: 5
        };


        var level4Data:Object =
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
            houses: [houseData4_0, houseData4_1, houseData4_2, houseData4_3, houseData4_4, houseData4_5, houseData4_6, houseData4_7, houseData4_8]
        };

        return level4Data;
    }
}
}
