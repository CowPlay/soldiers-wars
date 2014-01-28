/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/7/13
 * Time: 11:31 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.grid
{
import controllers.IController;

import flash.display.Sprite;

import views.implementations.ViewBase;

public class ViewGridCell extends ViewBase
{
    /*
     * Fields
     */
    private var _source:gGridCell00;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ViewGridCell(controller:IController)
    {
        _source = new gGridCell00();
        super(controller, _source);

        init();
    }

    private function init():void
    {
        _source.alpha = 0.01;
    }

    public function showDebugData(color:uint):void
    {
        var marker:Sprite = new Sprite();

        marker.graphics.beginFill(color, 1);
        marker.graphics.drawCircle(0, 0, 2);
        marker.graphics.endFill();

        _source.addChild(marker);
    }
}
}
