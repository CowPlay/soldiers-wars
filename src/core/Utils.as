/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/7/13
 * Time: 2:59 AM
 * To change this template use File | Settings | File Templates.
 */
package core
{
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;

import models.gameInfo.GameInfo;

public class Utils
{
    //@param offset  - vertical offset in percent. 0.0 - align top of application, 1.0 - align bottom of application.
    //@param targetAnchorPoint - vertical target anchor in percent
    public static function alignVertical(target:DisplayObject, offsetAppSize:Number = 0, targetAnchorPoint:Number = 0):void
    {
        Debug.assert(target != null);

        target.y = GameInfo.Instance.appHelper.applicationSize.y * offsetAppSize - target.height * targetAnchorPoint;
    }

    //@param offset  - horizontal offset in percent. 0.0 - align left of application, 1.0 - align right of application.
    //@param targetAnchorPoint - horizontal target anchor in percent
    public static function alignHorizontal(target:DisplayObject, offsetAppSize:Number = 0, targetAnchorPoint:Number = 0):void
    {
        Debug.assert(target != null);

        target.x = GameInfo.Instance.appHelper.applicationSize.x * offsetAppSize - target.width * targetAnchorPoint;
    }

    //! Cache as bitmap target with all its children
    public static function cacheAsBitmap(target:DisplayObjectContainer, needCache:Boolean = true):void
    {
        Debug.assert(target != null);

        target.cacheAsBitmap = needCache;

        for (var i:int = 0; i < target.numChildren; i++)
        {
            var childObj:DisplayObject = target.getChildAt(i);

            if (childObj is DisplayObjectContainer)
            {
                var child:DisplayObjectContainer = childObj as DisplayObjectContainer;

                cacheAsBitmap(child);
            }
            else
            {
                childObj.cacheAsBitmap = needCache;
            }
        }
    }

    public static function randomFromTo(from:Number, to:Number):Number
    {
        return Math.floor(Math.random() * (1 + to - from)) + from;
    }
}
}
