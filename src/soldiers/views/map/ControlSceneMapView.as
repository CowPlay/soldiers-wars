/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 30.10.13
 * Time: 10:35
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.map
{
import controls.IView;
import controls.implementations.ControlBase;

import flash.geom.Point;

public class ControlSceneMapView extends ControlBase
{
    /*
     *Fields
     */
    private var _sourceViewTyped:gSceneMap;

    private var _items:Array;

    /*
     *Properties
     */

    /*
     *Methods
     */

    public function ControlSceneMapView()
    {
        super(this);

        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gSceneMap();
        setSourceView(_sourceViewTyped);

        _items = [];

        var coordinatesArray:Array = [
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

        for (var i:int = 0; i < coordinatesArray.length; i++)
        {
            var positionXY:Array = coordinatesArray[i];

            var position:Point = new Point(positionXY[0], positionXY[1]);

            var flagView:ControlPointFlagItem = new ControlPointFlagItem(this);
            flagView.sourceView.x = position.x;
            flagView.sourceView.y = position.y;

            _sourceViewTyped.addChild(flagView.sourceView);

            _items.push(flagView);
        }
        var star:ControlPointFlagItem = _items[2];
        star.addStars(1);
    }

    public override function cleanup():void
    {
        for each(var item:IView in _items)
        {
            item.cleanup();
            item = null;
        }

        _items = null;

        _sourceViewTyped = null;

        super.cleanup();
    }

}
}
