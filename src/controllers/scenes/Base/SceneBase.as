/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/21/13
 * Time: 1:44 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.Base
{
import controllers.scenes.Game.SceneGame;
import controllers.scenes.Village.SceneVillage;

import core.Debug;
import core.IDisposable;

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;

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

        _rootView.addChild(_currentScene);

        //TODO: remove loader
    }

    /*
     * Fields
     */

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
    public function SceneBase()
    {
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
        //init background
//        var backgroundClass:Class = ResourceLoader.getClass(ResourceManagerBase.getSceneBackgroundByType(this.type));
//
    }

    //! Place all views here
    protected function placeViews():void
    {
    }
}
}
