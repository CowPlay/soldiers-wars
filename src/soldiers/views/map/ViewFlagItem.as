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

public class ViewFlagItem extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceView:gFlag;

    /*
     * Properties
     */

    /*
     * Methods
     */
    public function ViewFlagItem(controller:IController)
    {
        _sourceView = new gFlag();

        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
         handleEvents(true);
    }

    public override function placeViews(isFullscreen:Boolean):void
    {
        super.placeViews(isFullscreen);
    }

    public override function cleanup():void
    {
//        if(isCleanuped)
//        {
//            trace("");
//        }
//        else
//        {
//            trace("");
//        }

        _sourceView = null;

        super.cleanup();
    }

}
}
