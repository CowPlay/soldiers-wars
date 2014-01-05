/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/5/14
 * Time: 11:43 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game.decor
{
import controllers.implementations.Controller;

import soldiers.models.game.decor.Decor;
import soldiers.views.game.decor.ViewDecor;

import views.IView;

public class ControllerDecor extends Controller
{
    /*
     * Fields
     */
    private var _entry:Decor;
    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerDecor(entry:Decor)
    {
        var view:IView = new ViewDecor(this, entry);
        super(view);

        _entry = entry;
    }
}
}
