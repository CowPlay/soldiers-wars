/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/15/14
 * Time: 3:08 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.base
{
import controllers.IController;

import flash.display.DisplayObjectContainer;
import flash.geom.Point;

import soldiers.views.game.ui.ViewOptions;

import views.EViewPosition;
import views.IView;
import views.implementations.ViewBase;

public class ViewUIBase extends ViewBase
{
    /*
     * Fields
     */
    private var _source:DisplayObjectContainer;
    private var _viewOptions:ViewOptions;
    private var _viewGameName:IView;

    /*
     * Properties
     */
    public function get viewOptions():ViewOptions
    {
        return _viewOptions;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ViewUIBase(controller:IController, source:DisplayObjectContainer)
    {
        _source = source;
        super(controller, source);

        init();
    }

    private function init():void
    {
        _viewGameName = new ViewBase(controller, new gViewGameName());
        _source.addChild(_viewGameName.source);

        _viewGameName.anchorPoint = new Point(0.5, 0);
        _viewGameName.position = EViewPosition.EVP_ABSOLUTE;

        _viewOptions = new ViewOptions(controller);
        _source.addChild(_viewOptions.source);

        _viewOptions.anchorPoint = new Point(1, 0);
        _viewOptions.position = EViewPosition.EVP_ABSOLUTE;
    }


    override public function placeViews(fullscreen:Boolean):void
    {
        super.placeViews(fullscreen);

        _viewOptions.translate(1, 0);
        _viewOptions.source.x -= 30;
        _viewOptions.source.y += 30;

        _viewGameName.translate(0.5, 0);
    }

    override public function cleanup():void
    {
        _viewOptions.cleanup();
        _viewOptions = null;

        _viewGameName.cleanup();
        _viewGameName = null;

        super.cleanup();
    }
}
}
