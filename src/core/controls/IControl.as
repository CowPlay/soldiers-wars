/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/3/13
 * Time: 12:00 PM
 * To change this template use File | Settings | File Templates.
 */
package core.controls
{
import core.controls.ControlScene;

import core.IDisposable;

public interface IControl extends IDisposable
{
    //! Returns scene which own this control
    function get sceneOwner():ControlScene;

    //! Fires when display stay was changed
    function onDisplayStateChanged(isFullScreenNow:Boolean):void;

    //! Internal function. Please do not use manually.
    function placeViews():void;
}
}
