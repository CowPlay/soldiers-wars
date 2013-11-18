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

import controls.EViewAlignment;
import controls.IView;
import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.geom.Point;

public class ViewArrowContainer extends ControlBase
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
        alignment = EViewAlignment.EVA_ABSOLUTE;

        anchorPoint = new Point(0.5, 0);

        handleEvents(false);

        _sourceView.mouseEnabled = false;
        _sourceView.mouseChildren = false;

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
