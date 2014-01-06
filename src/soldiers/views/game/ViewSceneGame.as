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

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.geom.Point;

import soldiers.GameInfo;
import soldiers.views.game.grid.ViewGrid;

import views.EViewPosition;
import views.IView;
import views.IViewScroll;
import views.implementations.ViewBase;
import views.implementations.ViewScroll;

public class ViewSceneGame extends ViewBase
{
    /*
     * Fields
     */
    private var _sourceView:DisplayObjectContainer;

    private var _viewScrollGrid:IViewScroll;
    private var _viewGrid:ViewGrid;

    private var _subViews:Array;

    private var _needPlaceContainers:Boolean;


    /*
     * Properties
     */


    public function get viewScrollGrid():IViewScroll
    {
        return _viewScrollGrid;
    }

    public function get viewGrid():ViewGrid
    {
        return _viewGrid;
    }

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

        _needPlaceContainers = true;

        _viewGrid = new ViewGrid(controller);
        _viewGrid.handleEvents(false);
    }


    public override function addSubView(view:IView):void
    {
        _sourceView.addChild(view.source);
        _subViews.push(view);
    }

    public override function placeViews(fullscreen:Boolean):void
    {
        super.placeViews(fullscreen);

        if(_needPlaceContainers)
        {
            _needPlaceContainers = false;
            _viewGrid.placeViews(fullscreen);
        }

        for each(var subView:IView in _subViews)
        {
            subView.placeViews(fullscreen);
        }

        var appSize:Point = GameInfo.instance.managerApp.applicationSize;

        _viewGrid.source.x = 0
        _viewGrid.source.y = 0;

        if (_viewScrollGrid != null)
        {
            _sourceView.removeChild(_viewScrollGrid.source);
            _viewScrollGrid.cleanup();
            _viewScrollGrid = null;
        }

        if (_viewGrid.source.width > appSize.x || _viewGrid.source.height > appSize.y)
        {
            _viewScrollGrid = new ViewScroll(controller, _viewGrid.source, appSize);
            _sourceView.addChild(_viewScrollGrid.source);
            _sourceView.setChildIndex(_viewScrollGrid.source, 0);

            _viewScrollGrid.scrollTo(0.5, 0.5);

            trace(_viewGrid.source.width);
            trace(_viewGrid.source.height);
        }
        else
        {
            _sourceView.addChild(_viewGrid.source);

            _viewGrid.position = EViewPosition.EVP_ABSOLUTE;
            _viewGrid.translate(0.5, 0.5);
        }
    }

    public override function cleanup():void
    {
        if (_viewScrollGrid != null)
        {
            _viewScrollGrid.cleanup();
            _viewScrollGrid = null;
        }

        super.cleanup();
    }
}
}
