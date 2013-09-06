/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/21/13
 * Time: 1:44 PM
 * To change this template use File | Settings | File Templates.
 */
package core.controls
{
import controllers.ESceneType;
import controllers.scenes.game.ControlSceneGame;
import controllers.scenes.village.ControlSceneVillage;

import core.Constants;
import core.Debug;
import core.Utils;
import core.controls.popups.IControlPopup;
import core.models.GameInfo;
import core.models.managerApp.AppHelper;
import core.models.managerMoney.MoneyManager;
import core.models.resources.LoaderPicture;
import core.socialApi.managers.ISocialManager;

import flash.display.MovieClip;

import mx.utils.StringUtil;

//! Represents base class of all scenes
public class ControlScene extends ControlBase
{
    /*
     * Static fields
     */

    private static var _rootView:MovieClip = new MovieClip();
    protected static var _currentScene:ControlScene;

    //Cache of singletons
    private static var _gameInfo:GameInfo;
    private static var _appHelper:AppHelper;
    private static var _moneyManager:MoneyManager;
    private static var _socialManager:ISocialManager;
    private static var _loaderPicture:LoaderPicture;


    /*
     * Static properties
     */

    public static function get currentScene():ControlScene
    {
        return _currentScene;
    }

    public static function get rootView():MovieClip
    {
        return _rootView;
    }

    public static function get gameInfo():GameInfo
    {
        return _gameInfo;
    }

    public static function get appHelper():AppHelper
    {
        return _appHelper;
    }

    public static function get moneyManager():MoneyManager
    {
        return _moneyManager;
    }

    public static function get socialManager():ISocialManager
    {
        return _socialManager;
    }

    public static function get loaderPicture():LoaderPicture
    {
        return _loaderPicture;
    }

    /*
     * Static methods
     */

    public static function setScene(type:String):void
    {
        Debug.assert(type != null);
        Debug.assert(_currentScene == null || (_currentScene != null && type != _currentScene.type))

        if (_currentScene)
        {
            //TODO: add loader

            _currentScene.cleanup();

            _rootView.removeChild(_currentScene);
            _currentScene = null;
        }
        else //first setScene
        {
            Debug.assert(GameInfo.Instance != null, "Please instantiate scenes after initialize game model.")
        }

        var nextScene:ControlScene;

        switch (type)
        {
            case ESceneType.EST_VILLAGE:
            {
                nextScene = new ControlSceneVillage();
                break;
            }
            case ESceneType.EST_GAME:
            {
                nextScene = new ControlSceneGame();
                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }

        _currentScene = nextScene;

        _currentScene.loadResources();

        _currentScene.prepareViews();

        _currentScene.placeViews();

        _currentScene.onLoadingEnd();

        Utils.cacheAsBitmap(_currentScene);

        _rootView.addChild(_currentScene);

        //TODO: remove loader
    }

    /*
     * Fields
     */
    protected var _layerScene:MovieClip;
    protected var _layerUI:MovieClip;
    protected var _layerPopups:MovieClip;

    private var _popups:Array;
    private var _currentPopup:IControlPopup;
    /*
     * Properties
     */

    public function get type():String
    {
        //Implement in derived classes
        Debug.assert(false);
        return null;
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
     * Events
     */

    //! Fires after scene initialize
    protected function onLoadingEnd():void
    {
    }


    /*
     * Methods
     */

    //! Default constructor
    public function ControlScene()
    {
        super(this);

        _popups = [];

        if (_gameInfo == null)
        {
            _gameInfo = GameInfo.Instance;
            _appHelper = _gameInfo.appHelper;
            _moneyManager = _gameInfo.moneyManager;
            _socialManager = _gameInfo.socialManager;
            _loaderPicture = _gameInfo.loaderPicture;
        }
    }


    //! Load resources here. Call it at last turn
    protected function loadResources():void
    {
        //TODO: implement
    }

    //! Initialize all views here.
    protected function prepareViews():void
    {
        _layerScene = new MovieClip();
        addChild(_layerScene);

        _layerUI = new MovieClip();
        addChild(_layerUI);

        _layerPopups = new MovieClip();
        addChild(_layerPopups);
    }

    public function showPopup(popupType:String, delay:Number = 1.25):void
    {
        Debug.assert(popupType != null && popupType != "");
        Debug.assert(_currentPopup == null);

        _currentPopup = getPopupByType(popupType);

        _layerUI.mouseChildren = false;
        _layerScene.mouseChildren = false;

        _currentPopup.show(onShowPopupComplete, delay);
    }

    protected function onShowPopupComplete(popup:IControlPopup):void
    {
    }


    public function hidePopup(delay:Number = 1.25):void
    {
        Debug.assert(_currentPopup != null, "Nothing to hide");

        _currentPopup.hide(onHidePopupComplete, delay);
    }

    protected function onHidePopupComplete(popup:IControlPopup):void
    {
        _currentPopup = null;

        _layerUI.mouseChildren = true;
        _layerScene.mouseChildren = true;
    }


    protected function getPopupByType(popupType:String):IControlPopup
    {
        Debug.assert(popupType != null && popupType != "");

        var result:IControlPopup = null;

        for each(var item:IControlPopup in _popups)
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

    //! Please do not call manually
    public function registerPopup(value:IControlPopup):void
    {
        Debug.assert(value != null);
        Debug.assert(_popups.indexOf(value) == Constants.INDEX_NONE);

        _popups.push(value);
    }

    //! Please do not call manually
    public function unregisterPopup(value:IControlPopup):void
    {
        Utils.removeValue(_popups, value);
    }

    /*
     * IControl
     */

    public override function onDisplayStateChanged(isFullScreenNow:Boolean):void
    {
        super.onDisplayStateChanged(isFullScreenNow);
    }

    //! Place all views here
    public override function placeViews():void
    {
        super.placeViews();
    }

    /*
     * IDisposable
     */

    //! Destructor
    public override function cleanup():void
    {
        super.cleanup();
    }


}
}
