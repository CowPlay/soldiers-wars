/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/5/13
 * Time: 5:15 PM
 * To change this template use File | Settings | File Templates.
 */
package core.controls.popups
{
import core.Debug;
import core.controls.ControlBase;
import core.controls.ControlScene;

import flash.geom.Point;

public class ControlPopupBase extends ControlBase implements IControlPopup
{
    /*
     * Fields
     */

    private var _callbackOnShowComplete:Function;
    private var _callbackOnHideComplete:Function;

    /*
     * Properties
     */

    public function get type():String
    {
        Debug.assert(false, "Please implement it in derived classes");

        return null;
    }

    public function get positionShow():Point
    {
        Debug.assert(false, "Please implement it in derived classes");

        return null;
    }

    public function get positionHide():Point
    {
        Debug.assert(false, "Please implement it in derived classes");

        return null;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControlPopupBase(sceneOwner:ControlScene)
    {
        super(sceneOwner);

        sceneOwner.registerPopup(this);

//        x = positionHide.x;
//        y = positionHide.y;
    }

    /*
     * IControlPopup
     */

    public function show(onComplete:Function, delay:Number):void
    {
        _callbackOnShowComplete = onComplete;
    }


    protected function onShowComplete():void
    {
        if (_callbackOnShowComplete != null)
            _callbackOnShowComplete(this);
    }


    public function hide(onComplete:Function, delay:Number):void
    {
        _callbackOnHideComplete = onComplete;
    }

    protected function onHideComplete():void
    {
        if (_callbackOnHideComplete != null)
            _callbackOnHideComplete(this);
    }

    /*
     * IControl
     */

    public override function onDisplayStateChanged(isFullscreenNow:Boolean):void
    {
        super.onDisplayStateChanged(isFullscreenNow);

        if (ControlScene.currentScene.currentPopup == this)
        {
            x = positionShow.x;
            y = positionShow.y;
        }
        else
        {
            x = positionHide.x;
            y = positionHide.y;
        }
    }

    /*
     * IDisposable
     */

    public override function cleanup():void
    {
        sceneOwner.unregisterPopup(this);
    }

}
}
