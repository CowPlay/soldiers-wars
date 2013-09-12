/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/27/13
 * Time: 7:41 PM
 * To change this template use File | Settings | File Templates.
 */
package core.models.implementations.app
{
import core.Debug;
import core.models.GameInfoBase;

import flash.display.Sprite;
import flash.display.StageDisplayState;
import flash.events.Event;
import flash.events.FullScreenEvent;
import flash.geom.Point;
import flash.system.Capabilities;

import mx.utils.StringUtil;

public class ManagerAppBase extends Sprite
{
    /*
     * Fields
     */
    private var _applicationSize:Point;
    private var _screenResolution:Point;
    private var _fullScreenEnable:Boolean;

    private var _screenAspectRatio:Number;
    private var _currentDirectory:String;
    private var _applicationName:String;
    /*
     * Properties
     */

    public function get applicationSize():Point
    {
        return _applicationSize;
    }

    public function get screenResolution():Point
    {
        return _screenResolution;
    }

    public function get screenAspectRatio():Number
    {
        return _screenAspectRatio;
    }

    public function get currentDirectory():String
    {
        return _currentDirectory;
    }

    public function get applicationName():String
    {
        return _applicationName;
    }

    public function get fullScreenEnable():Boolean
    {
        return _fullScreenEnable;
    }

    public function set fullScreenEnable(value:Boolean):void
    {
        if (_fullScreenEnable == value)
            return;

        _fullScreenEnable = value;

        Main.stageValue.displayState = _fullScreenEnable ? StageDisplayState.FULL_SCREEN_INTERACTIVE : StageDisplayState.NORMAL;

        _applicationSize = _fullScreenEnable ? _screenResolution : new Point(Main.stageValue.stageWidth, Main.stageValue.stageHeight);
        Debug.log(StringUtil.substitute("Application size: {0}x{1}", _applicationSize.x, _applicationSize.y));


        GameInfoBase.Instance.managerViewController.currentScene.onDisplayStateChanged(_fullScreenEnable);
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ManagerAppBase()
    {
        init();
    }

    private function init(e:Event = null):void
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);

        _applicationSize = new Point(Main.stageValue.stageWidth, Main.stageValue.stageHeight);
        Debug.log(StringUtil.substitute("Application size: {0}x{1}", _applicationSize.x, _applicationSize.y));

        _screenResolution = new Point(Capabilities.screenResolutionX, Capabilities.screenResolutionY);
        Debug.log(StringUtil.substitute("Screen resolution: {0}x{1}", _screenResolution.x, _screenResolution.y));

        _screenAspectRatio = this.screenResolution.x / this.screenResolution.y;
        Debug.log(StringUtil.substitute("Screen aspect ratio: {0}", _screenAspectRatio));

        var fullPath:String = unescape(Main.rootValue.loaderInfo.url);

        _currentDirectory = fullPath.substring(0, fullPath.lastIndexOf("/") + 1);
        Debug.log(StringUtil.substitute("Current directory: {0}", _currentDirectory));

        _applicationName = fullPath.substring(fullPath.lastIndexOf("/") + 1, fullPath.length);
        Debug.log(StringUtil.substitute("Application name: {0}", _applicationName));

        //detect "ESC" key
        Main.stageValue.addEventListener(FullScreenEvent.FULL_SCREEN, onFullscreenModeChanged);
    }

    private function onFullscreenModeChanged(e:FullScreenEvent):void
    {
        fullScreenEnable = e.fullScreen;
    }
}
}
