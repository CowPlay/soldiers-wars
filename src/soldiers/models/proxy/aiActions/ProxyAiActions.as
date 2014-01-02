/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/25/13
 * Time: 4:46 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.proxy.aiActions
{
import soldiers.models.game.managerAi.aiActions.EAiAction;

public class ProxyAiActions
{
    public static function getActionAttack0():Object
    {
        var result:Object =
        {
            type         : EAiAction.EAS_ATTACK_0,
            time_reaction: 5000,

            soldiers_limit_player : 70,
            soldiers_limit_neutral: 50
        };

        return result;
    }

    public static function getActionAttack1():Object
    {
        var result:Object =
        {
            type         : EAiAction.EAS_ATTACK_1,
            time_reaction: 5000,

            attack_time          : 60000,
            attack_soldiers_limit: 50
        };

        return result;
    }

    public static function getActionDeffence0():Object
    {
        var result:Object =
        {
            type         : EAiAction.EAS_DEFENSE_0,
            time_reaction: 5000,

            soldiers_limit       : 500,
            soldiers_target_count: 20
        };

        return result;
    }

    public static function getActionUpgrade0():Object
    {
        var result:Object =
        {
            type         : EAiAction.EAS_UPGRADE_0,
            time_reaction: 5000,

            soldiers_limit_player: 50,
            soldiers_limit       : 80  
        };

        return result;
    }
}
}
