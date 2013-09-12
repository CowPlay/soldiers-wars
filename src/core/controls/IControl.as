/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/3/13
 * Time: 12:00 PM
 * To change this template use File | Settings | File Templates.
 */
package core.controls
{
import core.IDisposable;

import flash.display.DisplayObjectContainer;

public interface IControl extends IDisposable
{
    //TODO: add root view
    /*
     * Properties
     */
    //! Returns entry of this control
    function get sourceView():DisplayObjectContainer;

    //! Returns scene which own this control
    function get sceneOwner():IControlScene;

    /*
     * Methods
     */

    //! Fires when display stay was changed
    function onDisplayStateChanged(isFullScreenNow:Boolean):void;

    //! Internal function. Please do not use manually.
    function placeViews():void;

    //! Sync control with it model
    function update(type:String= ""):void;
}
}
