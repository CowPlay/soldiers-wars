/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/6/13
 * Time: 12:24 PM
 * To change this template use File | Settings | File Templates.
 */
package core.controls
{
import flash.display.DisplayObject;
import flash.display.MovieClip;

public interface IControlScene extends IControl
{
    /*
     * Propeties
     */

    //! Returns current scene type
    function get type():String;

    //! Returns scene root view
    function get rootView():DisplayObject;

    function get layerScene():MovieClip;

    function get layerUI():MovieClip;

    function get layerPopups():MovieClip;

    function get currentPopup():IControlPopup;

    /*
     * Methods
     */

    //! Load resources here.
    function loadResources():void;

    //! Initialize all views here.
    function prepareLayerScene():void;

    //! Initialize all UI here
    function prepareLayerUI():void;

    //! Initialize all popups here
    function prepareLayerPopups():void;

    //! Fires when scene already loaded.
    function onLoadingEnd():void;


    //! Show specify popup with delay.
    //! @param onComplete - method with signature: name(value:IControlPopup):void
    function showPopup(popupType:String, onComplete:Function= null, delay:Number = 0.75):void

    //! Hide current popup with delay.
    //! @param onComplete - method with signature: name(value:IControlPopup):void
    function hidePopup(onComplete:Function= null, delay:Number = 0.75):void

    //! Returns popup by type
    function getPopupByType(popupType:String):IControlPopup
}
}
