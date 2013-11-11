/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 11.11.13
 * Time: 16:48
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.map
{
import controllers.implementations.Controller;

import models.interfaces.levels.ILevelInfo;

import soldiers.views.map.ViewFlagItem;

public class ControllerFlagItem extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewFlagItem;

    private var _entry:ILevelInfo;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerFlagItem(entry:ILevelInfo)
    {
        _view = new ViewFlagItem(this);

        _entry = entry;

        super(_view);

        init();
    }

    private function init():void
    {

    }

    public override function cleanup():void
    {
        _view.cleanup();
        _view = null;

        super.cleanup();
    }

}
}
