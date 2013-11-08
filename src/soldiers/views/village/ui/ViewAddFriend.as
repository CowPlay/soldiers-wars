/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/7/13
 * Time: 4:56 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.village.ui
{
import controllers.IController;

import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

public class ViewAddFriend extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceView:DisplayObjectContainer;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ViewAddFriend(controller:IController)
    {
        _sourceView = new Sprite();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
    }
}
}
