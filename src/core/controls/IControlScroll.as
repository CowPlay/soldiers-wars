/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/9/13
 * Time: 5:35 PM
 * To change this template use File | Settings | File Templates.
 */
package core.controls
{
import flash.geom.Point;

public interface IControlScroll extends IControl
{

    /*
     * Properties
     */
    function get controlSize():Point;

    function set controlSize(value:Point):void;

    /*
     * Methods
     */

}
}
