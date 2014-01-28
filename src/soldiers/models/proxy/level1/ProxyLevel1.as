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
package soldiers.models.proxy.level1
{
import mx.utils.UIDUtil;

import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.proxy.aiActions.ProxyAiActions;
import soldiers.models.proxy.levelTargets.ProxyLevelTargets;

public class ProxyLevel1
{
    public static function getLevelData1():Object
    {
        var houseData1_0:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_PLAYER,
            level: 1,

            position_x: 8,
            position_y: 5,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData1_1:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_PLAYER,
            level: 1,

            position_x: 20,
            position_y: 5,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData1_2:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 2,

            position_x: 14,
            position_y: 19,

            id: UIDUtil.createUID(),

            soldiers: 4
        };

        var houseData1_3:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 5,
            position_y: 25,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData1_4:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 23,
            position_y: 25,

            id: UIDUtil.createUID(),

            soldiers: 10
        };


        var level1Data:Object =
        {
            id                  : "7",
            name                : "",
            description         : "",
            number              : 0,
            complete            : false,
            reward_currency_soft: 0,
            reward_points       : 0,

            grid_width : 29,
            grid_height: 31,

            houses_level_max: 1,

            stars_count   : 0,

            // Захватить все строения на карте
            targets_star_1: [ProxyLevelTargets.getGrabAll()],

            //TODO: Захватить первым дом "houseData1_2"
            targets_star_2: [ProxyLevelTargets.getNone()],

            //TODO: Потерять не более 40 юнитов
            targets_star_3: [ProxyLevelTargets.getNone()],

            ai_actions: [],

            decor : [],
            houses: [houseData1_0, houseData1_1, houseData1_2, houseData1_3, houseData1_4]
        };


        return level1Data;
    }
}
}
