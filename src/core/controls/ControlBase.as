/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/3/13
 * Time: 12:31 PM
 * To change this template use File | Settings | File Templates.
 */
package core.controls
{
import core.controls.ControlScene;

import core.Debug;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.display.Sprite;

//! Base class for most controls
public class ControlBase extends Sprite implements IControl
{
    /*
     * Fields
     */

    private var _sceneOwner:ControlScene;

    private var _layerScene:MovieClip;
    private var _layerUI:MovieClip;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlBase(sceneOwner:ControlScene)
    {
        Debug.assert(sceneOwner != null, "Scene owner can't be null");

        _sceneOwner = sceneOwner;
    }

    public function get sceneOwner():ControlScene
    {
        return _sceneOwner;
    }

    public function onDisplayStateChanged(isFullScreenNow:Boolean):void
    {
        onDisplayStateChangedWithChildren(isFullScreenNow, this);
    }

    protected static function onDisplayStateChangedWithChildren(isFullScreenNow:Boolean, target:DisplayObjectContainer):void
    {
        Debug.assert(target != null);

        for (var i:uint; i < target.numChildren; i++)
        {
            var childObj:DisplayObject = target.getChildAt(i);

            if (childObj is IControl)
            {
                var childControl:IControl = childObj as IControl;
                childControl.onDisplayStateChanged(isFullScreenNow);
            }
        }

    }

    public function placeViews():void
    {
        placeViewsWithChildren(this);
    }

    protected static function placeViewsWithChildren(target:DisplayObjectContainer):void
    {
        Debug.assert(target != null);

        for (var i:uint; i < target.numChildren; i++)
        {
            var childObj:DisplayObject = target.getChildAt(i);

            if (childObj is IControl)
            {
                var childControl:IControl = childObj as IControl;
                childControl.placeViews();
            }
        }

    }

    public function cleanup():void
    {
        cleanupWithChildren(this);
    }

    protected static function cleanupWithChildren(target:DisplayObjectContainer):void
    {
        Debug.assert(target != null);

        for (var i:uint; i < target.numChildren; i++)
        {
            var childObj:DisplayObject = target.getChildAt(i);

            if (childObj is IControl)
            {
                var childControl:IControl = childObj as IControl;
                childControl.cleanup();
            }
        }

    }
}
}
