/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/5/13
 * Time: 4:56 PM
 * To change this template use File | Settings | File Templates.
 */
package core.controls.popups
{
import flash.geom.Point;

public interface IControlPopup
{
    /*
     * Properties
     */

    function get type():String;

    function get positionShow():Point;

    function get positionHide():Point;

    /*
     * Methods
     */

    function show(onComplete:Function, delay:Number):void;

    function hide(onComplete:Function, delay:Number):void;
}
}
