/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/6/13
 * Time: 5:23 PM
 * To change this template use File | Settings | File Templates.
 */
package core.utils
{
import core.ConstantsBase;
import core.Debug;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.InteractiveObject;
import flash.text.TextField;
import flash.utils.getQualifiedClassName;

public class UtilsDisplayObject
{


    //! returns all target childs for each level. If levelMax = ConstantBase.INDEX_NONE - returns all childs
    public static function getAllChild(target:DisplayObjectContainer, levelMax:int, exceptInstances:Array = null, exceptClasses:Array = null):Array
    {
        var result:Array = [];

        exceptInstances = exceptInstances == null ? [] : exceptInstances;
        exceptClasses = exceptClasses == null ? [] : exceptClasses;

        for (var i:int = 0; i < target.numChildren; i++)
        {
            var child:DisplayObject = target.getChildAt(i);

            if(child is TextField)
            {
                trace("");
            }

            if (exceptInstances.indexOf(child) != ConstantsBase.INDEX_NONE)
            {
                //do nothing
            }
            else if (exceptClasses.indexOf(getQualifiedClassName(child)) != ConstantsBase.INDEX_NONE)
            {
                //do nothing
            }
            else if (child is DisplayObjectContainer && levelMax != 0)
            {
                var childContainer:DisplayObjectContainer = child as DisplayObjectContainer;

                var childsOfChild:Array = getAllChild(childContainer, levelMax == ConstantsBase.INDEX_NONE ? levelMax : levelMax - 1, exceptInstances, exceptClasses);

                for each(var childOfChild:DisplayObject in childsOfChild)
                {
                    result.push(childOfChild);
                }
            }
            else
            {
                result.push(child);
            }
        }

        return result;
    }

    public static function getChildIndex(target:DisplayObjectContainer, possibleChild:DisplayObject):int
    {
        Debug.assert(target != null);
        Debug.assert(possibleChild != null);

        var result:int = ConstantsBase.INDEX_NONE;

        for (var i:int = 0; i < target.numChildren; i++)
        {
            var child:DisplayObject = target.getChildAt(i);

            if (child == possibleChild)
            {
                result = i;
                break;
            }
        }

        return result;
    }

    //! For add value to @param exceptClasses please use getQualifiedClassName(obj);
    public static function setMouseEnabledForChildren(target:DisplayObjectContainer, mouseEnabled:Boolean, exceptInstances:Array = null, exceptClasses:Array = null):void
    {
        Debug.assert(target != null);

        exceptInstances = exceptInstances == null ? [] : exceptInstances;
        exceptClasses = exceptClasses == null ? [] : exceptClasses;


        for (var i:uint = 0; i < target.numChildren; i++)
        {
            var childObj:DisplayObject = target.getChildAt(i);

            if (exceptInstances.indexOf(childObj) != ConstantsBase.INDEX_NONE)
            {
                //do nothing
            }
            else if (exceptClasses.indexOf(getQualifiedClassName(childObj)) != ConstantsBase.INDEX_NONE)
            {
                //do nothing
            }
            else if (childObj is DisplayObjectContainer)
            {
                var childContainer:DisplayObjectContainer = childObj as DisplayObjectContainer;
                childContainer.mouseEnabled = mouseEnabled;

                setMouseEnabledForChildren(childContainer, mouseEnabled, exceptInstances, exceptClasses);
            }
            else if (childObj is InteractiveObject)
            {
                var childInteractive:InteractiveObject = childObj as InteractiveObject;
                childInteractive.mouseEnabled = mouseEnabled;
            }
        }
    }

}
}
