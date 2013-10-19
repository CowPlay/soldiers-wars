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
package soldiers.controllers.scenes.game.views
{
import controls.IControlScene;
import controls.implementations.ControlSpriteBase;

import soldiers.models.game.managerPath.GridCell;

public class ControlGridCell extends ControlSpriteBase
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
    public function ControlGridCell(sceneOwner:IControlScene, entryValue:GridCell)
    {
        Debug.assert(entryValue != null);
        _entry = entryValue;

        _sourceViewTyped = new gGridCell();
        super(sceneOwner, _sourceViewTyped);
    }
}
}
