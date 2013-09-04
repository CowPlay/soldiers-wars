/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 8/31/13
 * Time: 4:53 PM
 * To change this template use File | Settings | File Templates.
 */
package core.controls
{
import core.controls.ControlScene;

import core.Debug;

import flash.display.DisplayObjectContainer;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.geom.Rectangle;

//! Represents scroll container for some display object.
//! Container must be less or equal than target.
public class ControlScroll extends ControlBase
{
    /*
     * Fields
     */

    private var _target:DisplayObjectContainer;
    private var _dragging:Boolean;

    private var _containerSize:Point;
    private var _targetSize:Point;

    private var _mouseLastPosition:Point;

    /*
     * Properties
     */

    public function get containerSize():Point
    {
        return _containerSize;
    }

    public function set containerSize(value:Point):void
    {
        if (_containerSize.equals(value))
            return;

        _containerSize = value;

        scrollRect = new Rectangle(0, 0, _containerSize.x, _containerSize.y);

        centerTarget();
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControlScroll(target:DisplayObjectContainer, containerSize:Point, sceneOwner:ControlScene)
    {
        super(sceneOwner);

        Debug.assert(target != null);
        Debug.assert(containerSize != null);

        _target = target;
        _targetSize = new Point(_target.width, _target.height);
        _containerSize = containerSize;

        //check size
        Debug.assert(_targetSize.length >= _containerSize.length);

        addChild(_target);

        scrollRect = new Rectangle(0, 0, _containerSize.x, _containerSize.y);

        addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);

        centerTarget();
    }

    public function centerTarget():void
    {
        scrollRect = new Rectangle(-_targetSize.x / 2, -_targetSize.y / 2, _containerSize.x, _containerSize.y);
    }


    private function onMouseDown(e:MouseEvent):void
    {
        _dragging = true;

        Main.stageValue.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
        Main.stageValue.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);

        _mouseLastPosition = new Point(e.stageX, e.stageY);
    }

    private function onMouseUp(e:MouseEvent):void
    {
        _dragging = false;

        Main.stageValue.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
        Main.stageValue.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
    }

    private function onMouseMove(e:MouseEvent):void
    {
        if (!_dragging)
            return;

        var deltaX:int = _mouseLastPosition.x - e.stageX;
        var deltaY:int = _mouseLastPosition.y - e.stageY;

        var x0:Number = scrollRect.x + deltaX;
        var y0:Number = scrollRect.y + deltaY;

        x0 = x0 > 0 ? 0 : x0;
        x0 = x0 < -_targetSize.x ? -_targetSize.x : x0;


        y0 = y0 > 0 ? 0 : y0;
        y0 = y0 < -_targetSize.y ? -_targetSize.y : y0;

        scrollRect = new Rectangle(x0, y0, _containerSize.x, _containerSize.y);

        var newX:Number = _target.x - deltaX;
        var newY:Number = _target.y - deltaY;

        _mouseLastPosition = new Point(e.stageX, e.stageY);
    }

    /*
     * IDisposable
     */


    public override function cleanup():void
    {
        _containerSize = null;
        _targetSize = null;
        _mouseLastPosition = null;

        _target = null;

        removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
        Main.stageValue.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
        Main.stageValue.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);

        super.cleanup();
    }
}
}
