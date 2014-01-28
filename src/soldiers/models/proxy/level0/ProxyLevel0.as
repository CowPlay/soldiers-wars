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

            soldiers: 5
        };

        var houseData0_1:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_PLAYER,
            level: 1,

            position_x: 17,
            position_y: 5,

            id: UIDUtil.createUID(),

            soldiers: 0
        };

        var houseData0_2:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 11,
            position_y: 19,

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

            grid_width : 23,
            grid_height: 25,

            houses_level_max: 1,

            stars_count   : 0,

            // Захватить все здания на уровне
            targets_star_1: [ProxyLevelTargets.getGrabAll()],
            // Отсутствует
            targets_star_2: [ProxyLevelTargets.getNone()],
            // Отсутствует
            targets_star_3: [ProxyLevelTargets.getNone()],

            ai_actions: [],

            decor : [],
            houses: [houseData0_0, houseData0_1, houseData0_2]
        };

        return  level0Data;

    }
}
}
