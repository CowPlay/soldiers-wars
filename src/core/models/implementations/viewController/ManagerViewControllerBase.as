/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/6/13
 * Time: 11:44 AM
 * To change this template use File | Settings | File Templates.
 */
package core.models.implementations.viewController
{
import core.Debug;
import core.controls.IControlScene;
import core.models.interfaces.IManagerViewController;
import core.utils.Utils;

import flash.display.MovieClip;

public class ManagerViewControllerBase implements IManagerViewController
{
    /*
     * Fields
     */

    private var _rootView:MovieClip;
    protected var _currentScene:IControlScene;


    /*
     * Properties
     */

    public function get rootView():MovieClip
    {
        return _rootView;
    }

    public function get currentScene():IControlScene
    {
        return _currentScene;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ManagerViewControllerBase()
    {
        init();
    }

    private function init():void
    {
        _rootView = new MovieClip();
    }

    /*
     * IManagerViewController
     */

    public function setScene(type:String):void
    {
        Debug.assert(type != null);
        Debug.assert(_currentScene == null || (_currentScene != null && type != _currentScene.type))

        if (_currentScene != null)
        {
            //TODO: add loader

            _currentScene.cleanup();

            _rootView.removeChild(_currentScene.rootView);
            _currentScene = null;
        }

        _currentScene = createSceneByType(type);

        _currentScene.loadResources();

        _currentScene.prepareLayerScene();

        _currentScene.prepareLayerUI();

        _currentScene.prepareLayerPopups();

        _currentScene.placeViews();

        _currentScene.onLoadingEnd();

        Utils.cacheAsBitmap(_currentScene.rootView);

        _rootView.addChild(_currentScene.rootView);

        //TODO: remove loader
    }

    public function createSceneByType(type:String):IControlScene
    {
        Debug.assert(false, "Please implement this method in derived classes.");
        return null;
    }
}
}
