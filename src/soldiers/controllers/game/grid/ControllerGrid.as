/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/30/13
 * Time: 5:03 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game.grid
{
import controllers.implementations.Controller;

import soldiers.views.game.grid.ViewGrid;

public class ControllerGrid extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewGrid;
    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerGrid(view:ViewGrid)
    {
        Debug.assert(view != null);

        _view = view;
        super(_view);

        init();
    }

    private function init():void
    {
        _view.showFoundation();
        _view.showPaths();
        _view.showHouseExits();
    }
}
}
