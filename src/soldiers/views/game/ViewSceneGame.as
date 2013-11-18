/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/19/13
 * Time: 9:57 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game
{
import controllers.IController;

import controls.EViewAlignment;
import controls.IView;
import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

public class ViewSceneGame extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceView:DisplayObjectContainer;

    private var _viewGrid:IView;

    private var _subViews:Array;


    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ViewSceneGame(controller:IController)
    {
        _sourceView = new Sprite();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
        _subViews = [];

        _viewGrid = new ViewGrid(controller);
        _viewGrid.alignment = EViewAlignment.EVA_ABSOLUTE;
        _viewGrid.handleEvents(false);

        _sourceView.addChild(_viewGrid.source);
    }


    public override function addSubView(view:IView):void
    {
        _sourceView.addChild(view.source);
        _subViews.push(view);
    }

    public override function placeViews(fullscreen:Boolean):void
    {
        super.placeViews(fullscreen);

        _viewGrid.placeViews(fullscreen);
        _viewGrid.translate(0.5, 0.5);

        for each(var subView:IView in _subViews)
        {
            subView.placeViews(fullscreen);

            subView.x = _viewGrid.x;
            subView.y = _viewGrid.y;
        }
    }
}
}
