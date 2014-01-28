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
package soldiers.models.proxy.level4
{
import mx.utils.UIDUtil;

import soldiers.models.housesGame.base.EHouseOwner;

import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.proxy.aiActions.ProxyAiActions;
import soldiers.models.proxy.levelTargets.ProxyLevelTargets;

public class ProxyLevel4
{
    public static function getLevelData4():Object
    {
        var houseData4_0:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_PLAYER,
            level: 1,

            position_x: 21,
            position_y: 5,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData4_1:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 12,
            position_y: 21,

            id: UIDUtil.createUID(),

            soldiers: 0
        };

        var houseData4_2:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 5,
            position_y: 12,

            id: UIDUtil.createUID(),

            soldiers: 0
        };

        var houseData4_3:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 1,

            position_x: 5,
            position_y: 21,

            id: UIDUtil.createUID(),

            soldiers: 0
        };

        var houseData4_4:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 13,
            position_y: 13,

            id: UIDUtil.createUID(),

            soldiers: 10
        };


        var level4Data:Object =
        {
            id                  : "3",
            name                : "",
            description         : "",
            number              : 0,
            complete            : false,
            reward_currency_soft: 0,
            reward_points       : 0,

            houses_level_max: 2,

            grid_width : 26,
            grid_height: 26,

            stars_count   : 0,

            // Захватить все здания противника
            targets_star_1: [ProxyLevelTargets.getOwnerGrabAll(EHouseOwner.EHO_ENEMY)],
            // Пройти без захвата нейтральных зданий
            targets_star_2: [ProxyLevelTargets.getOwnerNotGrabAny(EHouseOwner.EHO_NEUTRAL)],
            // TODO: улучшить по крайней мере 2 здания до 2-го уровня
            targets_star_3: [],

            ai_actions    : [ProxyAiActions.getActionAttack0(), ProxyAiActions.getActionAttack1(), ProxyAiActions.getActionDeffence0()],

            decor : [],
            houses: [houseData4_0, houseData4_1, houseData4_2, houseData4_3, houseData4_4]
        };



        return level4Data;
    }
}
}
