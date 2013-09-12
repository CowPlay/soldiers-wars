/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/7/13
 * Time: 2:59 AM
 * To change this template use File | Settings | File Templates.
 */
package core.utils
{
import core.*;
import core.models.GameInfoBase;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.geom.Point;

public class Utils
{



    //! Convert point to global applization coords
    public static function convertToGlobalCoords(point:Point):Point
    {
        var appSize:Point = GameInfoBase.Instance.managerApp.applicationSize;
        return new Point(appSize.x * point.x, appSize.y * point.y);
    }

    //! Remove value from array and return index;
    public static function removeValue(array:Array, value:Object):Number
    {
        var result:Number = ConstantsBase.INDEX_NONE;

        Debug.assert(array != null);
        Debug.assert(value != null);

        var valueIndex:int = array.indexOf(value);

        Debug.assert(valueIndex != ConstantsBase.INDEX_NONE, "Value not found.");

        array.splice(valueIndex, 1);

        return result;
    }


    //@param offset  - vertical offset in percent. 0.0 - parent top align, 1.0 -  parent bottom align.
    //@param targetAnchorPoint - vertical target anchor in percent
    public static function alignVertical(target:DisplayObject, offsetParent:Number = 0, targetAnchorPoint:Number = 0):void
    {
        Debug.assert(target != null);
        Debug.assert(target.parent != null);

        target.y = target.parent.height * offsetParent - target.height * targetAnchorPoint;

    }

    //@param offset  - vertical offset in percent. 0.0 - app top align, 1.0 -  app bottom align.
    //@param targetAnchorPoint - vertical target anchor in percent
    public static function alignVerticalAbsolute(target:DisplayObject, offsetAppSize:Number = 0, targetAnchorPoint:Number = 0):void
    {
        Debug.assert(target != null);
        Debug.assert(target.parent != null);

        target.y = GameInfoBase.Instance.managerApp.applicationSize.y * offsetAppSize - target.height * targetAnchorPoint;
    }

    //@param offset  - horizontal offset in percent. 0.0 - parent left align , 1.0 - parent right align.
    //@param targetAnchorPoint - horizontal target anchor in percent
    public static function alignHorizontal(target:DisplayObject, offsetParent:Number = 0, targetAnchorPoint:Number = 0):void
    {
        Debug.assert(target != null);
        Debug.assert(target.parent != null);

        target.x = target.parent.width * offsetParent - target.width * targetAnchorPoint;
    }

    //@param offset  - horizontal offset in percent. 0.0 - application left align , 1.0 - app right align.
    //@param targetAnchorPoint - horizontal target anchor in percent
    public static function alignHorizontalAbsolute(target:DisplayObject, offsetAppSize:Number = 0, targetAnchorPoint:Number = 0):void
    {
        Debug.assert(target != null);
        Debug.assert(target.parent != null);
        target.x = GameInfoBase.Instance.managerApp.applicationSize.x * offsetAppSize - target.width * targetAnchorPoint;
    }


    //! Cache as bitmap target with all its children
    public static function cacheAsBitmap(target:DisplayObject, needCache:Boolean = true):void
    {
        Debug.assert(target != null);

        target.cacheAsBitmap = needCache;

        if (target is DisplayObjectContainer)
        {
            var targetContainer:DisplayObjectContainer = target as DisplayObjectContainer;

            for (var i:int = 0; i < targetContainer.numChildren; i++)
            {
                cacheAsBitmap(targetContainer.getChildAt(i));
            }
        }
    }

    //! WARNING: value have range [from..to]
    public static function randomFromTo(from:Number, to:Number):Number
    {
        return Math.floor(Math.random() * (1 + to - from)) + from;
    }
}
}
