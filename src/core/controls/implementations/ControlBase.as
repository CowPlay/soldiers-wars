/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/3/13
 * Time: 12:31 PM
 * To change this template use File | Settings | File Templates.
 */
package core.controls.implementations
{
import core.Debug;
import core.controls.*;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

//! Base class for most controls
public class ControlBase extends Sprite implements IControl
{
    /*
     * Fields
     */

    private var _sceneOwner:IControlScene;
    private var _sourceView:DisplayObjectContainer;

    /*
     * Properties
     */

    public function get sourceView():DisplayObjectContainer
    {
        return _sourceView;
    }

    protected function setSourceView(value:DisplayObjectContainer):void
    {
        if (_sourceView == value)
            return;

        _sourceView = value;
    }

    public function get sceneOwner():IControlScene
    {
        return _sceneOwner;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControlBase(sceneOwner:IControlScene)
    {
        Debug.assert(sceneOwner != null, "Scene owner can't be null");

        _sceneOwner = sceneOwner;
    }

    public function update(type:String = ""):void
    {
        Debug.assert(false, "Please implement it in derived classes.");
    }

    public function onDisplayStateChanged(isFullScreenNow:Boolean):void
    {
    }

    public function placeViews():void
    {
    }

    public function cleanup():void
    {
    }
}
}
