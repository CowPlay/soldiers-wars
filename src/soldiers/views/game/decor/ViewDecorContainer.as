/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/5/14
 * Time: 11:39 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.decor
{
import controllers.IController;

import flash.display.DisplayObjectContainer;

import views.IView;
import views.implementations.ViewBase;

public class ViewDecorContainer extends ViewBase
{
    /*
     * Fields
     */

    private var _sourceView:DisplayObjectContainer;

    private var _items:Array;
    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ViewDecorContainer(controller:IController, sourceView:DisplayObjectContainer)
    {
        _sourceView = sourceView;
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
        _items = [];
    }

    public override function addSubView(view:IView):void
    {
        _sourceView.addChild(view.source);
        _items.push(view);
    }

    public override function placeViews(fullscreen:Boolean):void
    {
        super.placeViews(fullscreen);

        for each(var view:IView in _items)
        {
            view.placeViews(fullscreen);
        }
    }
}
}
