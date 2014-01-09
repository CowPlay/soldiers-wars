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

    public static function getNone():Object
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

    public static function getGrabAll():Object
    {
        var result:Object =
        {
            type: ELevelTarget.ELT_GRAB_ALL
        };

        return result;
    }

    public static function getOwnerGrabAll(ownerType:String):Object
    {
        var result:Object =
        {
            type      : ELevelTarget.ELT_OWNER_GRAB_ALL,
            owner_type: ownerType
        };

        return result;
    }

    public static function getOwnerNotGrabAny(ownerType:String):Object
    {
        var result:Object =
        {
            type      : ELevelTarget.ELT_OWNER_NOT_GRAB_ANY,
            owner_type: ownerType
        };

        return result;
    }

    public static function getOwnerNotMissingAny(ownerType:String):Object
    {
        var result:Object =
        {
            type      : ELevelTarget.ELT_OWNER_NOT_MISSING_ANY,
            owner_type: ownerType
        };

        return result;
    }


    public static function getTargetNotGrab(id:String):Object
    {
        var result:Object =
        {
            type     : ELevelTarget.ELT_TARGET_NOT_GRAB,
            target_id: id
        };

        return result;
    }

    public static function getTargetGrab(id:String):Object
    {
        var result:Object =
        {
            type     : ELevelTarget.ELT_TARGET_GRAB,
            target_id: id
        };

        return result;
    }

    public static function getTimeLimit(time:uint):Object
    {
        var result:Object =
        {
            type: ELevelTarget.ELT_TIME_LIMIT,
            time: time
        };

        return result;
    }

    public static function getTimePlay(time:uint):Object
    {
        var result:Object =
        {
            type: ELevelTarget.ELT_TIME_PLAY,
            time: time
        };

        return result;
    }
}
}
