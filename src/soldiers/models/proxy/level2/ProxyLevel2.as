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
package soldiers.models.proxy.level2
{
import mx.utils.UIDUtil;

import soldiers.models.game.decor.EDecorType;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.proxy.aiActions.ProxyAiActions;
import soldiers.models.proxy.levelTargets.ProxyLevelTargets;

public class ProxyLevel2
{
    public static function getLevelData2():Object
    {
        var houseData2_0:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_PLAYER,
            level: 1,

            position_x: 22,
            position_y: 12,

            id: UIDUtil.createUID(),

            soldiers: 2
        };

        var houseData2_1:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_PLAYER,
            level: 1,

            position_x: 12,
            position_y: 22,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData2_2:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 44,
            position_y: 16,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData2_3:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 30,
            position_y: 30,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData2_4:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_NEUTRAL,
            level: 1,

            position_x: 16,
            position_y: 44,

            id: UIDUtil.createUID(),

            soldiers: 10
        };

        var houseData2_5:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 2,

            position_x: 48,
            position_y: 38,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var houseData2_6:Object =
        {
            type : EHouseTypeG.EHGT_BARRACKS,
            owner: EHouseOwner.EHO_ENEMY,
            level: 2,

            position_x: 38,
            position_y: 48,

            id: UIDUtil.createUID(),

            soldiers: 5
        };

        var decorData2_0:Object =
        {
            type: EDecorType.EDT_0,

            width : 1,
            height: 1,

            position_x: 27,
            position_y: 25
        };

        var level2Data:Object =
        {
            id                  : "2",
            name                : "",
            description         : "",
            number              : 0,
            complete            : false,
            reward_currency_soft: 0,
            reward_points       : 0,

            grid_width : 60,
            grid_height: 60,

            houses_level_max: 2,

            stars_count   : 0,

            // Захватить все вражеские здания
            targets_star_1  : [ProxyLevelTargets.getGrabAll()],
            // Пройти уровень менее чем за 2 минуты
            targets_star_2  : [ProxyLevelTargets.getTimeLimit(60 * 2 * 1000)],
            // Не потерять ниодного здания
            targets_star_3  : [ProxyLevelTargets.getOwnerNotMissingAny(EHouseOwner.EHO_PLAYER)],

            ai_actions: [ProxyAiActions.getActionAttack0(), ProxyAiActions.getActionAttack1(), ProxyAiActions.getActionDeffence0(), ProxyAiActions.getActionUpgrade0() ],

            decor : [decorData2_0],
            houses: [houseData2_0, houseData2_1, houseData2_2, houseData2_3, houseData2_4, houseData2_5, houseData2_6]
        };

        return level2Data;
    }

}
}
