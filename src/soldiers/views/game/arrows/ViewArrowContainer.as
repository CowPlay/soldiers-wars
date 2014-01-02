/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/25/13
 * Time: 10:15 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.arrows
{
import controllers.IController;

import views.IView;
import views.implementations.ViewBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

public class ViewArrowContainer extends ViewBase
{
    /*
     * Fields
     */
    private var _sourceView:DisplayObjectContainer;

    private var _viewsArrows:Array;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ViewArrowContainer(controller:IController)
    {
        _sourceView = new Sprite();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
        _sourceView.mouseChildren = false;
        _sourceView.mouseEnabled = false;

        _viewsArrows = [];
    }

    public override function addSubView(view:IView):void
    {
        _sourceView.addChild(view.source);
        _viewsArrows.push(view);
    }

    public override function placeViews(fullscreen:Boolean):void
    {
        super.placeViews(fullscreen);

        for each(var arrowView:IView in _viewsArrows)
        {
            arrowView.placeViews(fullscreen);
        }
    }
}

}
