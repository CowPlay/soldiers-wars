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

public class Utils
{
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
