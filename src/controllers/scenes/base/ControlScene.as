/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/21/13
 * Time: 1:44 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.base
{
import core.controls.*;

import controllers.scenes.base.*;

import core.controls.ControlBase;
import controllers.scenes.base.views.ControlPlayerInfo;
import controllers.scenes.base.views.ControlStripTop;
import controllers.scenes.game.SceneGame;
import controllers.scenes.village.SceneVillage;

import core.Debug;
import core.Utils;

import flash.display.MovieClip;

import models.gameInfo.managerApp.AppHelper;
import models.gameInfo.GameInfo;
import models.gameInfo.managerMoney.MoneyManager;
import models.gameInfo.managerVillage.VillageManager;
import models.resources.ResourceLoader;

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
    private static var _villageManager:VillageManager;

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

    public static function get villageManager():VillageManager
    {
        return _villageManager;
    }

    /*
     * Static methods
     */

    public static function setScene(type:ESceneType):void
    {
        Debug.assert(type != null);
        Debug.assert(_currentScene == null || (_currentScene != null && type != _currentScene.type))

        if (_currentScene)
        {
            //TODO: add loader

            _currentScene.cleanup();

            _rootView.removeChild(_currentScene);
        }
        else //first setScene
        {
            Debug.assert(GameInfo.Instance != null, "Please instantiate scenes after initialize game model.")

            _gameInfo = GameInfo.Instance;
            _appHelper = _gameInfo.appHelper;
            _moneyManager = _gameInfo.moneyManager;
            _villageManager = _gameInfo.villageManager;
        }

        var nextScene:ControlScene;

        switch (type)
        {
            case ESceneType.EST_VILLAGE:
            {
                nextScene = new SceneVillage();
                break;
            }
            case ESceneType.EST_GAME:
            {
                nextScene = new SceneGame();
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

    //ui
    protected var _controlGameName:gControlGameName;

    protected var _controlStripTop:ControlStripTop;
    protected var _controlPlayerInfo:ControlPlayerInfo;

    protected var _resourceLoaderBase:ResourceLoader;


    /*
     * Properties
     */

    public function get type():ESceneType
    {
        //Implement in derived classes
        Debug.assert(false);
        return null;
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

        {//ui

            _controlGameName = new gControlGameName();
            _layerUI.addChild(_controlGameName);

            //control strip
            _controlStripTop = new ControlStripTop(this);
            _layerUI.addChild(_controlStripTop);


            _controlPlayerInfo = new ControlPlayerInfo(this);
            _layerUI.addChild(_controlPlayerInfo);
        }

    }


    private function updateViewsPositions():void
    {
        Utils.alignHorizontal(_controlPlayerInfo, 0.1);
    }

    /*
     * IControl
     */

    public override function onDisplayStateChanged(isFullScreenNow:Boolean):void
    {
        super.onDisplayStateChanged(isFullScreenNow);

        onDisplayStateChangedWithChildren(isFullScreenNow, _layerScene);
        onDisplayStateChangedWithChildren(isFullScreenNow, _layerUI);

        updateViewsPositions();
    }

    //! Place all views here
    public override function placeViews():void
    {
        super.placeViews();

        placeViewsWithChildren(_layerScene);
        placeViewsWithChildren(_layerUI);

        _controlStripTop.y = _controlGameName.height;

        _controlPlayerInfo.y = _controlStripTop.y + _controlStripTop.height - _controlPlayerInfo.height / 2;

        updateViewsPositions();
    }

    /*
     * IDisposable
     */

    //! Destructor
    public override function cleanup():void
    {
        _resourceLoaderBase.cleanup();
        _resourceLoaderBase = null;

        cleanupWithChildren(_layerScene);
        _layerScene = null;
        cleanupWithChildren(_layerUI);
        _layerUI = null;

        super.cleanup();
    }


}
}
