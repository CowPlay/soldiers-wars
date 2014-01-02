/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/7/13
 * Time: 11:31 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.grid
{
import controllers.IController;

import views.implementations.ViewBase;

public class ViewGridCell extends ViewBase
{
    /*
     * Fields
     */
    private var _source:gGridCell;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ViewGridCell(controller:IController)
    {
        _source = new gGridCell();
        super(controller, _source);

        init();
    }

    private function init():void
    {
//        _source.visible = false;
        _source.mouseChildren = false;
        _source.mouseEnabled = false;
    }
}
}
