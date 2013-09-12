/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/21/13
 * Time: 1:44 PM
 * To change this template use File | Settings | File Templates.
 */
package core.controls.implementations
{
import core.ConstantsBase;
import core.Debug;
import core.controls.*;
import core.models.GameInfoBase;
import core.models.implementations.app.ManagerAppBase;
import core.models.interfaces.IManagerGame;
import core.models.interfaces.IManagerSocial;
import core.models.interfaces.IManagerString;

import flash.display.DisplayObject;
import flash.display.MovieClip;

import mx.utils.StringUtil;

//! Represents base class of all scenes
public class ControlSceneBase extends ControlBase implements IControlScene
{
    /*
     * Fields
     */
    private var _layerScene:MovieClip;
    private var _layerSceneControls:Array;

    private var _layerUI:MovieClip;
    private var _layerUIControls:Array;

    private var _layerPopups:MovieClip;
    private var _layerPopupsControls:Array;

    private var _currentPopup:IControlPopup;
    private var _onShowPopupCallback:Function;
    private var _onHidePopupCallback:Function;

    //Cache of singletons
    private var _gameInfoBase:GameInfoBase;

    //TODO: cache all managers
    protected var _managerApp:ManagerAppBase;
    protected var _managerSocial:IManagerSocial;
    protected var _managerString:IManagerString;
    protected var _managerGame:IManagerGame;


    /*
     * Properties
     */

    public function get type():String
    {
        //Implement in derived classes
        Debug.assert(false);
        return null;
    }

    //! Returns scene root view
    public function get rootView():DisplayObject
    {
        return this;
    }

    public function get layerScene():MovieClip
    {
        return _layerScene;
    }

    public function get layerUI():MovieClip
    {
        return _layerUI;
    }

    public function get layerPopups():MovieClip
    {
        return _layerPopups;
    }

    public function get currentPopup():IControlPopup
    {
        return _currentPopup;
    }


    /*
     * Methods
     */

    //! Default constructor
    function ControlSceneBase()
    {
        super(this);

        if (_gameInfoBase == null)
        {
            _gameInfoBase = GameInfoBase.Instance;
            _managerApp = _gameInfoBase.managerApp;
            _managerSocial = _gameInfoBase.managerSocial;
            _managerString = _gameInfoBase.managerString;
            _managerGame = _gameInfoBase.managerGame;
        }
    }

    /*
     * IControlScene
     */


    //! Load resources here.
    public function loadResources():void
    {
        //TODO: implement
    }

    //! Fires after scene initialize
    public function onLoadingEnd():void
    {
        if (_layerPopups != null)
        {
            for each(var popup:IControlPopup in _layerPopupsControls)
            {
                popup.hide(null, 0);

            }
        }
    }

    //! Initialize all views here.
    public function prepareLayerScene():void
    {
        _layerSceneControls = [];

        _layerScene = new MovieClip();
        addChild(_layerScene);
    }

    protected function registerControlScene(value:IControl):void
    {
        Debug.assert(value != null);
        Debug.assert(_layerSceneControls.indexOf(value) == ConstantsBase.INDEX_NONE);
        Debug.assert(_layerSceneControls != null);

        _layerScene.addChild(value.sourceView);

        _layerSceneControls.push(value);
    }

    //! Initialize all UI here
    public function prepareLayerUI():void
    {
        _layerUIControls = [];

        _layerUI = new MovieClip();
        addChild(_layerUI);
    }

    protected function registerControlUI(value:IControl):void
    {
        Debug.assert(value != null);
        Debug.assert(_layerUIControls.indexOf(value) == ConstantsBase.INDEX_NONE);
        Debug.assert(_layerUIControls != null);

        _layerUI.addChild(value.sourceView);

        _layerUIControls.push(value);
    }

    public function prepareLayerPopups():void
    {
        _layerPopupsControls = [];

        _layerPopups = new MovieClip();
        addChild(_layerPopups);
    }

    protected function registerControlPopup(value:IControlPopup):void
    {
        Debug.assert(value != null);
        Debug.assert(_layerPopupsControls.indexOf(value) == ConstantsBase.INDEX_NONE);
        Debug.assert(_layerPopups != null);

        _layerPopups.addChild(value.sourceView);

        _layerPopupsControls.push(value);
    }

    public function showPopup(popupType:String, onComplete:Function = null, delay:Number = 0.75):void
    {
        Debug.assert(popupType != null && popupType != "");
        Debug.assert(_currentPopup == null);

        _currentPopup = getPopupByType(popupType);

        if (_layerScene != null)
            _layerScene.mouseChildren = false;

        if (_layerUI != null)
            _layerUI.mouseChildren = false;

        _onShowPopupCallback = onComplete;

        _currentPopup.show(onShowPopupComplete, delay);
    }

    protected function onShowPopupComplete(popup:IControlPopup):void
    {
        if (_onShowPopupCallback != null)
            _onShowPopupCallback(popup);
    }

    public function hidePopup(onComplete:Function = null, delay:Number = 0.75):void
    {
        Debug.assert(_currentPopup != null, "Nothing to hide");

        _onHidePopupCallback = onComplete;

        _currentPopup.hide(onHidePopupComplete, delay);
    }

    protected function onHidePopupComplete(popup:IControlPopup):void
    {
        _currentPopup = null;

        if (_layerScene != null)
            _layerScene.mouseChildren = true;

        if (_layerUI != null)
            _layerUI.mouseChildren = true;


        if (_onHidePopupCallback != null)
            _onHidePopupCallback(popup);
    }

    public function getPopupByType(popupType:String):IControlPopup
    {
        Debug.assert(popupType != null && popupType != "");

        var result:IControlPopup = null;

        for each(var item:IControlPopup in _layerPopupsControls)
        {
            if (item.type == popupType)
            {
                result = item;
                break;
            }
        }

        Debug.assert(result != null, StringUtil.substitute("Can't find popup: {0} in scene: {1}", popupType, type));

        return result;
    }



    /*
     * IControl
     */

    public override function onDisplayStateChanged(isFullScreenNow:Boolean):void
    {
        super.onDisplayStateChanged(isFullScreenNow);

        if (_layerScene != null)
        {
            for each(var controlScene:IControl in _layerSceneControls)
            {
                controlScene.onDisplayStateChanged(isFullScreenNow);
            }
        }

        if (_layerUI != null)
        {
            for each(var controlUI:IControl in _layerUIControls)
            {
                controlUI.onDisplayStateChanged(isFullScreenNow);
            }
        }

        if (_layerPopups != null)
        {
            for each(var popup:IControlPopup in _layerPopupsControls)
            {
                popup.onDisplayStateChanged(isFullScreenNow);
            }
        }
    }

    //! Place all views here
    public override function placeViews():void
    {
        super.placeViews();

        if (_layerScene != null)
        {
            for each(var controlScene:IControl in _layerSceneControls)
            {
                controlScene.placeViews();
            }
        }

        if (_layerUI != null)
        {
            for each(var controlUI:IControl in _layerUIControls)
            {
                controlUI.placeViews();
            }
        }

        if (_layerPopups != null)
        {
            for each(var popup:IControlPopup in _layerPopupsControls)
            {
                popup.placeViews();
            }
        }
    }

    /*
     * IDisposable
     */

    //! Destructor
    public override function cleanup():void
    {
        if (_layerScene != null)
        {
            for each(var controlScene:IControl in _layerSceneControls)
            {
                controlScene.cleanup();
            }

            _layerSceneControls = null;
            _layerScene = null;
        }

        if (_layerUI != null)
        {
            for each(var controlUI:IControl in _layerUIControls)
            {
                controlUI.cleanup();
            }

            _layerUIControls = null;
            _layerUI = null;
        }

        if (_layerPopups != null)
        {
            for each(var popup:IControlPopup in _layerPopupsControls)
            {
                popup.cleanup();
            }

            _layerPopupsControls = null;
            _layerPopups = null;

            _onShowPopupCallback = null;
            _onHidePopupCallback = null;
        }

        super.cleanup();
    }
}
}
