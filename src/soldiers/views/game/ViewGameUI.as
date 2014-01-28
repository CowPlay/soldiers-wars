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

import soldiers.views.base.ViewUIBase;

import views.EViewPosition;
import views.IView;

public class ViewGameUI extends ViewUIBase
{
    /*
     * Fields
     */
    private var _source:DisplayObjectContainer;

    private var _viewProgress:IView;

    /*
     * Properties
     */

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
    }


    override public function placeViews(fullscreen:Boolean):void
    {
        super.placeViews(fullscreen);

        _viewProgress.placeViews(fullscreen);
        _viewProgress.translate(0, 0);

        _viewProgress.source.y += 70;

    }


    override public function cleanup():void
    {
        super.cleanup();
    }
}
}
