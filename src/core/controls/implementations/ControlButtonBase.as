/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/9/13
 * Time: 9:49 AM
 * To change this template use File | Settings | File Templates.
 */
package core.controls.implementations
{
import core.Debug;
import core.controls.IControlButton;
import core.controls.IControlScene;

import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.events.Event;
import flash.events.MouseEvent;

public class ControlButtonBase extends ControlBase implements IControlButton
{
    /*
     * Fields
     */
    private var _sourceViewMovieClip:MovieClip;

    protected var _isMouseDown:Boolean;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! @param entry - MovieClip with 3 frames (1 - up state, 2 - over state, 3 - down state)
    //! Default constructor
    public function ControlButtonBase(sceneOwner:IControlScene, sourceViewValue:DisplayObjectContainer)
    {
        Debug.assert(sourceViewValue != null);
        Debug.assert(sourceViewValue is MovieClip);

        var sourceViewValueMC:MovieClip = sourceViewValue as MovieClip;
        Debug.assert(sourceViewValueMC.totalFrames == 3, "Invalid frames count");

        _sourceViewMovieClip = sourceViewValueMC;

        super(sceneOwner);

        setSourceView(sourceViewValue);

        init();
    }

    private function init():void
    {
        _sourceViewMovieClip.gotoAndStop(1);
        _sourceViewMovieClip.mouseChildren = false;

        _sourceViewMovieClip.addEventListener(MouseEvent.MOUSE_UP, onMouseUpOver);
        _sourceViewMovieClip.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
        _sourceViewMovieClip.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
        _sourceViewMovieClip.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
    }

    /*
     * IDisposable
     */

    public override function cleanup():void
    {
        _sourceViewMovieClip = null;

        super.cleanup();
    }

    /*
     * Handlers
     */

    protected function onMouseUpOver(e:MouseEvent):void
    {
        _sourceViewMovieClip.gotoAndStop(2);

        //clicked
        resetToDefault();
    }

    protected function onMouseUpOut(e:Event):void
    {
        _sourceViewMovieClip.gotoAndStop(1);

        //not clicked
        resetToDefault();
    }

    private function resetToDefault():void
    {
        _isMouseDown = false;

        Main.stageValue.removeEventListener(MouseEvent.MOUSE_UP, onMouseUpOut);
        Main.stageValue.removeEventListener(Event.MOUSE_LEAVE, onMouseUpOut);
    }


    protected function onMouseOut(e:MouseEvent):void
    {
        if (_isMouseDown)
            return;

        _sourceViewMovieClip.gotoAndStop(1);
    }

    protected function onMouseOver(e:MouseEvent):void
    {
        if (_isMouseDown)
            return;

        _sourceViewMovieClip.gotoAndStop(2);
    }

    protected function onMouseDown(e:MouseEvent):void
    {
        _sourceViewMovieClip.gotoAndStop(3);

        _isMouseDown = true;

        Main.stageValue.addEventListener(MouseEvent.MOUSE_UP, onMouseUpOut);
        Main.stageValue.addEventListener(Event.MOUSE_LEAVE, onMouseUpOut);
    }


}
}
