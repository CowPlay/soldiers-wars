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

import flash.display.DisplayObjectContainer;

import utils.UtilsFilters;

import views.implementations.ViewBase;

public class ViewFlag extends ViewBase
{
    /*
     * Fields
     */
    private var _sourceView:DisplayObjectContainer;

    /*
     * Properties
     */

    /*
     * Methods
     */
    public function ViewFlag(controller:IController, isCurrent:Boolean, starsCount:uint = 0)
    {
        if (isCurrent)
        {
            _sourceView = new gViewFlagCurrent();
        }
        else
        {
            var source:gViewFlag = new gViewFlag();
            source.levelStars.gotoAndStop(starsCount + 1);

            _sourceView = source;
        }

        super(controller, _sourceView);
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
