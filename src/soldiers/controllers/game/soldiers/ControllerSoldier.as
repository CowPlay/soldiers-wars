/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/13/13
 * Time: 5:00 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game.soldiers
{
import controllers.implementations.Controller;

import soldiers.models.game.soldiers.SoldierInfo;

import soldiers.views.game.soldiers.ViewSoldier;

public class ControllerSoldier extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewSoldier;

    private var _entry:SoldierInfo;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerSoldier(entry:SoldierInfo)
    {
        Debug.assert(entry != null);
        _entry = entry;

        _view = new ViewSoldier(this, _entry);
        super(_view);

        init();
    }

    private function init():void
    {
    }
}
}
