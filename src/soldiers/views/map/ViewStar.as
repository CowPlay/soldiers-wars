/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 11.11.13
 * Time: 16:46
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.map
{
import controllers.IController;

import controls.implementations.ControlBase;

public class ViewStar extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceView:gStar;

    /*
     * Properties
     */

    /*
     * Methods
     */
    public function ViewStar(controller:IController)
    {
        _sourceView = new gStar();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {

    }

    public override function placeViews(isFullscreen:Boolean):void
    {
        super.placeViews(isFullscreen);
    }

    public override function cleanup():void
    {
        _sourceView = null;

        super.cleanup();
    }
}
}
