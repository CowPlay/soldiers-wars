/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/7/13
 * Time: 4:55 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.village.ui
{
import controllers.implementations.Controller;

import controls.IView;

import soldiers.views.village.ui.ViewAddFriend;

public class ControllerAddFriend extends Controller
{
    /*
     * Fields
     */
    private var _view:IView;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerAddFriend()
    {
        _view = new ViewAddFriend(this);
        super(_view);

        init();
    }

    private function init():void
    {
    }
}
}
