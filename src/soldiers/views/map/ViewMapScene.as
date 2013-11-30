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

import controls.IView;
import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.geom.Point;

import soldiers.models.GameInfo;

public class ViewMapScene extends ControlBase
{
    /*
     * Fields
     */
    private var _items:Array;

    private var _source:DisplayObjectContainer;

    private var _viewBackground:IView;

    private var _viewMap:IView;

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

        var backgroundSource:Sprite = new Sprite();

        backgroundSource.graphics.beginFill(0x2A476B);
        backgroundSource.graphics.drawRect(0, 0, 100, 100);
        backgroundSource.graphics.endFill();

        _viewBackground = new ControlBase(controller, backgroundSource);
        _source.addChild(_viewBackground.source);


        _viewMap = new ControlBase(controller, new gSceneMap());
        _source.addChild(_viewMap.source);
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

        _viewBackground.source.width = applicationSize.x;
        _viewBackground.source..height = applicationSize.y;

        _viewMap.translate(0.5, 0.5);

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

        for (var i:int = 0; i < _items.length; i++)
        {
            var subView:IView = _items[i];

            subView.source.x = _viewMap.source.x + itemsCoords[i][0];
            subView.source.y = _viewMap.source.y + itemsCoords[i][1];
        }
    }

    public override function cleanup():void
    {
        _source = null;

        _viewMap.cleanup();
        _viewMap = null;

        super.cleanup();
    }
}
}
