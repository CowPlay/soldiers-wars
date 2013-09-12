/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 8/31/13
 * Time: 4:53 PM
 * To change this template use File | Settings | File Templates.
 */
package core.controls.implementations
{
import com.greensock.plugins.ScrollRectPlugin;
import com.greensock.plugins.TweenPlugin;

import core.Debug;
import core.controls.IControlScene;
import core.controls.IControlScroll;

import flash.display.DisplayObjectContainer;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.geom.Rectangle;

//! Represents scroll container for some display object.
//! Container must be less or equal than target.
public class ControlScrollBase extends ControlBase implements IControlScroll
{
    /*
     * Fields
     */

    private var _target:DisplayObjectContainer;
    private var _dragging:Boolean;

    private var _controlSize:Point;
    private var _targetSize:Point;

    private var _mouseLastPosition:Point;

    /*
     * Properties
     */

    public override function get sourceView():DisplayObjectContainer
    {
        return this;
    }

    public function get controlSize():Point
    {
        return _controlSize;
    }

    public function set controlSize(value:Point):void
    {
        if (_controlSize.equals(value))
            return;

        _controlSize = value;

        scrollRect = new Rectangle(0, 0, _controlSize.x, _controlSize.y);

        centerTarget();
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControlScrollBase(sceneOwner:IControlScene, target:DisplayObjectContainer, containerSize:Point)
    {
        super(sceneOwner);

        Debug.assert(target != null);
        Debug.assert(containerSize != null);

        TweenPlugin.activate([ScrollRectPlugin]);

        _target = target;
        _targetSize = new Point(_target.width, _target.height);
        _controlSize = containerSize;

        //check size
        Debug.assert(_targetSize.length >= _controlSize.length);


        addChild(_target);

        scrollRect = new Rectangle(0, 0, _controlSize.x, _controlSize.y);

        addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
    }

    public function centerTarget():void
    {
        scrollRect = new Rectangle(-_targetSize.x / 2, -_targetSize.y / 2, _controlSize.x, _controlSize.y);
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

        var x0:Number = scrollRect.x;
        if (deltaX != 0)
        {
            x0 += deltaX;
            x0 = x0 >= 0 ? x0 : 0;
            x0 = x0 >= _targetSize.x - _controlSize.x ? _targetSize.x - _controlSize.x : x0;
        }

        var y0:Number = scrollRect.y;
        if (deltaY != 0)
        {
            y0 += +deltaY;

            y0 = y0 >= 0 ? y0 : 0;
            y0 = y0 >= _targetSize.y - _controlSize.y ? _targetSize.y - _controlSize.y : y0;
        }

        scrollRect = new Rectangle(x0, y0, _controlSize.x, _controlSize.y);

        var newX:Number = _target.x - deltaX;
        var newY:Number = _target.y - deltaY;

        _mouseLastPosition = new Point(e.stageX, e.stageY);
    }

    /*
     * IDisposable
     */


    public override function cleanup():void
    {
        _controlSize = null;
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
