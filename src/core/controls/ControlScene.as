/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/21/13
 * Time: 1:44 PM
 * To change this template use File | Settings | File Templates.
 */
package core.controls
{
import core.controls.*;

import controllers.scenes.base.*;

import core.controls.ControlBase;
import controllers.scenes.base.views.ControlPlayerInfo;
import controllers.scenes.base.views.ControlStripTop;
import controllers.scenes.game.ControlSceneGame;
import controllers.scenes.village.ControlSceneVillage;

import core.Debug;
import core.Utils;
import core.models.resources.LoaderPicture;
import core.socialApi.ISocialManager;

import flash.display.MovieClip;

import core.models.managerApp.AppHelper;
import core.models.GameInfo;
import core.models.managerMoney.MoneyManager;
import core.models.managerVillage.VillageManager;

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

    public static function get villageManager():VillageManager
    {
        return _villageManager;
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
            _socialManager = _gameInfo.socialManager;
            _loaderPicture = _gameInfo.loaderPicture;
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
