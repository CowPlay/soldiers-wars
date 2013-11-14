/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/13/13
 * Time: 4:04 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game
{
import controllers.implementations.Controller;

import soldiers.views.game.arrows.ViewArrow;

public class ControllerArrow extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewArrow;


    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerArrow()
    {
        _view = new ViewArrow(this);
        super(_view);

        init();
    }

    private function init():void
    {
    }
}
}
