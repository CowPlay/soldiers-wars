/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/6/13
 * Time: 12:02 PM
 * To change this template use File | Settings | File Templates.
 */
package core.models.interfaces
{
import flash.geom.Point;

public interface IManagerApp
{
    //! Returns current app size
    function get applicationSize():Point;

    function get screenResolution():Point;

    function get screenAspectRatio():Number;

    function get currentDirectory():String;

    function get applicationName():String;

    function get fullScreenEnable():Boolean;

    function set fullScreenEnable(value:Boolean):void;
}
}
