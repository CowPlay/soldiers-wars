/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 8/31/13
 * Time: 4:53 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.base.views
{
import com.greensock.TweenLite;

import core.Debug;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.geom.Rectangle;

import mx.utils.StringUtil;

public class ScrollContainer extends Sprite
{
    /*
     * Fields
     */

    private var _target:DisplayObjectContainer;
    private var _dragging:Boolean;

    private var _mouseLastPosition:Point;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ScrollContainer(target:DisplayObjectContainer)
    {
        Debug.assert(target != null);

        _target = target;

        _target.scrollRect = new Rectangle(0, 0, 500, 500);

        addChild(_target);

        addEventListener(MouseEvent.MOUSE_DOWN, startScroll);
        Main.stageValue.addEventListener(MouseEvent.MOUSE_UP, stopScroll);

//        restriction  = Main.stageValue.stageWidth - _rootView.width;
    }


    private function startScroll(e:MouseEvent):void
    {
        _dragging = true;
        Main.stageValue..addEventListener(MouseEvent.MOUSE_MOVE, scroll);

        _mouseLastPosition = new Point(e.stageX, e.stageY);

//        _rootView.removeEventListener(MouseEvent.MOUSE_DOWN, startScroll);
//        _rootView.addEventListener(Event.ENTER_FRAME, updateMovement);
    }

    private function stopScroll(e:MouseEvent):void
    {
        _dragging = false;
        Main.stageValue..removeEventListener(MouseEvent.MOUSE_MOVE, scroll);

//        _rootView.addEventListener(MouseEvent.MOUSE_DOWN, startScroll);
//        _rootView.removeEventListener(Event.ENTER_FRAME, updateMovement);
    }

    private function scroll(e:MouseEvent):void
    {
        if (!_dragging)
            return;

        var deltaX:int = _mouseLastPosition.x - e.stageX;
        var deltaY:int = _mouseLastPosition.y - e.stageY;

        trace(StringUtil.substitute("x: {0}          y: {1}"), deltaX, deltaY);


        _target.scrollRect = new Rectangle(_target.scrollRect.x + deltaX, _target.scrollRect.y + deltaY, _target.scrollRect.width, _target.scrollRect.height);

        _mouseLastPosition = new Point(e.stageX, e.stageY);
    }

//    private function updateMovement(e:Event):void
//    {
//        _rootView.scrollRect.x += 2 * ((Math.max(Math.min(restriction, this.mouseX), 0)) - _rootView.scrollRect.x);
//    }
}
}
