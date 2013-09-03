/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/21/13
 * Time: 1:44 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.base
{
import controllers.scenes.game.SceneGame;
import controllers.scenes.village.SceneVillage;

import core.Debug;
import core.IDisposable;
import core.Utils;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;

import models.gameInfo.AppHelper.AppHelper;
import models.gameInfo.GameInfo;
import models.gameInfo.MoneyManager.MoneyManager;
import models.gameInfo.VillageManager.VillageManager;
import models.resources.ResourceLoader;

//! Represents base class of all scenes
public class SceneBase extends MovieClip implements IDisposable
{
    /*
     * Static fields
     */

    private static var _rootView:MovieClip = new MovieClip();
    protected static var _currentScene:SceneBase;

    /*
     * Static properties
     */

    public static function get currentScene():SceneBase
    {
        return _currentScene;
    }

    public static function get rootView():MovieClip
    {
        return _rootView;
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

        var nextScene:SceneBase;

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
    protected var _controlTopStrip:Sprite;
    protected var _controlOptions:gControlOptions;


    protected var _resourceLoaderBase:ResourceLoader;

    //Cache of singletons
    protected var _gameInfo:GameInfo;
    protected var _appHelper:AppHelper;
    protected var _moneyManager:MoneyManager;
    protected var _villageManager:VillageManager;

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

    public function onDisplayStateChanged(isFullScreenNow:Boolean):void
    {
        updateViewsPositions();
    }

    /*
     * Methods
     */

    //! Default constructor
    public function SceneBase()
    {
        Debug.assert(GameInfo.Instance != null, "Please instantiate scenes after initialize game model.")

        _gameInfo = GameInfo.Instance;
        _appHelper = _gameInfo.appHelper;
        _moneyManager = _gameInfo.moneyManager;
        _villageManager = _gameInfo.villageManager;
    }

    //! Destructor
    public function cleanup():void
    {
        _resourceLoaderBase.cleanup();
        _resourceLoaderBase = null;

        super.cleanup();
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

            _controlTopStrip = new Sprite();

            _controlTopStrip.graphics.beginFill(0x000000, 0.8);
            _controlTopStrip.graphics.drawRect(0, 0, _appHelper.screenResolution.x, 45);
            _controlTopStrip.graphics.endFill();

            _layerUI.addChild(_controlTopStrip);

            _controlOptions = new gControlOptions();
            _controlTopStrip.addChild(_controlOptions);
        }

    }

    //! Place all views here
    protected function placeViews():void
    {
        _controlTopStrip.y = _controlGameName.height;

        _controlOptions.y = _controlTopStrip.height / 2 - _controlOptions.height / 2;

        updateViewsPositions();
    }

    private function updateViewsPositions():void
    {
        alignHorizontal(_controlOptions, 0.9, 0.5);
    }


    /*
     * Helper functions
     */

    //@param offset  - vertical offset in percent. 0.0 - align top of application, 1.0 - align bottom of application.
    //@param targetAnchorPoint - vertical target anchor in percent
    protected function alignVertical(target:DisplayObject, offsetAppSize:Number = 0, targetAnchorPoint:Number = 0):void
    {
        Debug.assert(target != null);

        target.y = _appHelper.applicationSize.y * offsetAppSize - target.height * targetAnchorPoint;
    }

    //@param offset  - horizontal offset in percent. 0.0 - align left of application, 1.0 - align right of application.
    //@param targetAnchorPoint - horizontal target anchor in percent
    protected function alignHorizontal(target:DisplayObject, offsetAppSize:Number = 0, targetAnchorPoint:Number = 0):void
    {
        Debug.assert(target != null);

        target.x = _appHelper.applicationSize.x * offsetAppSize - target.width * targetAnchorPoint;
    }


}
}
