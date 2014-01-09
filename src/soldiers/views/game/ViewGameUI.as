/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/5/14
 * Time: 2:33 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game
{
import controllers.IController;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.geom.Point;

import soldiers.views.game.ui.*;

import views.EViewPosition;
import views.IView;
import views.implementations.ViewBase;

public class ViewGameUI extends ViewBase
{
    /*
     * Fields
     */
    private var _source:DisplayObjectContainer;

    private var _viewOptions:ViewOptions;
    private var _viewProgress:IView;

    /*
     * Properties
     */

    public function get viewOptions():ViewOptions
    {
        return _viewOptions;
    }

    public function set viewProgress(value:IView):void
    {
        _viewProgress = value;
        _source.addChild(_viewProgress.source);

        _viewProgress.position = EViewPosition.EVP_ABSOLUTE;
        _viewProgress.anchorPoint = new Point(0, 0);
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ViewGameUI(controller:IController)
    {
        _source = new Sprite();
        super(controller, _source);

        init();
    }

    private function init():void
    {
        _viewOptions = new ViewOptions(controller);
        _source.addChild(_viewOptions.source);

        _viewOptions.anchorPoint = new Point(1, 0);
        _viewOptions.position = EViewPosition.EVP_ABSOLUTE;
    }


    override public function placeViews(fullscreen:Boolean):void
    {
        super.placeViews(fullscreen);

        _viewOptions.translate(1, 0);

        _viewProgress.placeViews(fullscreen);
        _viewProgress.translate(0, 0);
    }


    override public function cleanup():void
    {
        _viewOptions.cleanup();
        _viewOptions = null;

        super.cleanup();
    }
}
}
