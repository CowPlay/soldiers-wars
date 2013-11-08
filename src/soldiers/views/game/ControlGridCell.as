/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/23/13
 * Time: 8:48 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game
{
import controls.IView;
import controls.implementations.ViewSprite;

import models.interfaces.states.IState;

import soldiers.models.game.managerPath.GridCell;

public class ControlGridCell extends ViewSprite
{
    /*
     * Fields
     */
    private var _entry:GridCell;

    private var _sourceViewTyped:gGridCell;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlGridCell(parent:IView, entryValue:GridCell)
    {
        Debug.assert(entryValue != null);
        _entry = entryValue;

        _sourceViewTyped = new gGridCell();
        super(parent, _sourceViewTyped);
    }
}
}
