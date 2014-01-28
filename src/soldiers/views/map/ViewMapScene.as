/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 11.11.13
 * Time: 14:07
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.map
{
import controllers.IController;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.geom.Point;

import soldiers.GameInfo;
import soldiers.views.base.ViewPlayerInfo;

import views.IView;
import views.implementations.ViewBase;

public class ViewMapScene extends ViewBase
{
    /*
     * Fields
     */
    private var _items:Array;

    private var _source:DisplayObjectContainer;

    private var _viewMap:IView;

    private var _viewPlayerInfo:ViewPlayerInfo;


    /*
     * Properties
     */

    /*
     * Methods
     */
    public function ViewMapScene(controller:IController)
    {
        _source = new Sprite();
        super(controller, _source);

        init();
    }

    private function init():void
    {
        _items = [];

        _viewMap = new ViewBase(controller, new gSceneMap());
        _source.addChild(_viewMap.source);

        _viewPlayerInfo = new ViewPlayerInfo(controller);
        _source.addChild(_viewPlayerInfo.source);


    }

    override public function addSubView(view:IView):void
    {
        _source.addChild(view.source);
        _items.push(view);
    }

    public override function placeViews(isFullscreen:Boolean):void
    {
        super.placeViews(isFullscreen);

        var applicationSize:Point = GameInfo.instance.managerApp.applicationSize;

        var itemsCoords:Array =
                [
                    [80, 172],
                    [150, 220],
                    [250, 210],
                    [325, 180],
                    [290, 130],
                    [380, 130],
                    [460, 170],
                    [565, 155],
                    [625, 195],
                    [585, 245],
                    [515, 290],
                    [568, 330],
                    [594, 388],
                    [535, 430],
                    [445, 412],
                    [420, 350],
                    [330, 312],
                    [243, 314],
                    [174, 355],
                    [140, 408]
                ];


//        TODO: remove
        var offsetX:Number = 138;
        var offsetY:Number = 189;

        for (var i:int = 0; i < _items.length; i++)
        {
            var subView:IView = _items[i];

            subView.source.x = _viewMap.source.x + itemsCoords[i][0] + offsetX;
            subView.source.y = _viewMap.source.y + itemsCoords[i][1] + offsetY;
        }

        _viewPlayerInfo.source.x = 50;
        _viewPlayerInfo.source.y = 150;
    }

    public override function cleanup():void
    {
        _source = null;

        _viewPlayerInfo.cleanup();
        _viewPlayerInfo = null;

        _viewMap.cleanup();
        _viewMap = null;

        super.cleanup();
    }
}
}
