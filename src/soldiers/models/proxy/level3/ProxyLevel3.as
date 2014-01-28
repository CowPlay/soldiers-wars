/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/24/13
 * Time: 4:29 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.proxy.level3
{
import mx.utils.UIDUtil;

import soldiers.models.game.decor.EDecorType;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.proxy.aiActions.ProxyAiActions;
import soldiers.models.proxy.levelTargets.ProxyLevelTargets;

public class ProxyLevel3
{
    public static function getLevelData3():Object
    {
        var houseData3_0:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_PLAYER,
            level: 1,

            position_x: 15,
            position_y: 5,

            id: UIDUtil.createUID(),

            soldiers: 2
        };

        var houseData3_1:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_PLAYER,
            level: 1,

            position_x: 5,
            position_y: 15,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData3_2:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 33,
            position_y: 5,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData3_3:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 19,
            position_y: 19,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData3_4:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 5,
            position_y: 33,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData3_5:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 2,

            position_x: 33,
            position_y: 23,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData3_6:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 2,

            position_x: 23,
            position_y: 33,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var level3Data:Object =
        {
            id                  : "2",
            name                : "",
            description         : "",
            number              : 0,
            complete            : false,
            reward_currency_soft: 0,
            reward_points       : 0,

            grid_width : 39,
            grid_height: 39,

            houses_level_max: 2,

            stars_count   : 0,

            // Захватить все вражеские здания
            targets_star_1  : [ProxyLevelTargets.getGrabAll()],
            // Пройти уровень менее чем за 2 минуты
            targets_star_2  : [ProxyLevelTargets.getTimeLimit(60 * 2 * 1000)],
            // Не потерять ниодного здания
            targets_star_3  : [ProxyLevelTargets.getOwnerNotMissingAny(EHouseOwner.EHO_PLAYER)],

            ai_actions    : [ProxyAiActions.getActionDeffence0()],

            decor : [],
            houses: [houseData3_0, houseData3_1, houseData3_2, houseData3_3, houseData3_4, houseData3_5, houseData3_6]
        };

        return level3Data;
    }

}
}