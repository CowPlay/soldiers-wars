/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/24/13
 * Time: 4:24 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.proxy.levelTargets
{
import soldiers.models.game.managerProgress.targets.ELevelTarget;

public class ProxyLevelTargets
{
    /*
     * Other
     */

    public static function getTargetNone():Object
    {
        var result:Object =
        {
            type: ELevelTarget.ELT_NONE
        };

        return result;
    }

    /*
     * Grab
     */

    public static function getTargetGrabAllHouses():Object
    {
        var result:Object =
        {
            type: ELevelTarget.ELT_GRAB_ALL
        };

        return result;
    }

    public static function getTargetGrabTargetHouse(id:String):Object
    {
        var result:Object =
        {
            type           : ELevelTarget.ELT_GRAB,
            target_id: id
        };

        return result;
    }
}
}
