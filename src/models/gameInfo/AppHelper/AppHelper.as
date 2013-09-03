/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/27/13
 * Time: 7:41 PM
 * To change this template use File | Settings | File Templates.
 */
package models.gameInfo.AppHelper
{
import controllers.scenes.base.SceneBase;

import core.Debug;

import flash.display.Sprite;
import flash.display.StageDisplayState;
import flash.events.Event;
import flash.geom.Point;
import flash.system.Capabilities;

import mx.utils.StringUtil;

public class AppHelper extends Sprite
{
    /*
     * Fields
     */
    private var _applicationSize:Point;
    private var _screenResolution:Point;
    private var _fullScreenEnable:Boolean;

    private var _screenAspectRatio:Number;
    private var _socialNetwork:ESocialNetworkType;
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

    public function get socialNetwork():ESocialNetworkType
    {
        return _socialNetwork;
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
        trace(StringUtil.substitute("Application size: {0}x{1}", _applicationSize.x, _applicationSize.y));

        SceneBase.currentScene.onDisplayStateChanged(_fullScreenEnable);
    }

    /*
     * Methods
     */

    //! Default constructor
    public function AppHelper()
    {
        init();
    }

    private function init(e:Event = null):void
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);

        _applicationSize = new Point(Main.stageValue.stageWidth, Main.stageValue.stageHeight);
        trace(StringUtil.substitute("Application size: {0}x{1}", _applicationSize.x, _applicationSize.y));

        _screenResolution = new Point(Capabilities.screenResolutionX, Capabilities.screenResolutionY);
        trace(StringUtil.substitute("Screen resolution: {0}x{1}", _screenResolution.x, _screenResolution.y));

        _screenAspectRatio = this.screenResolution.x / this.screenResolution.y;
        trace(StringUtil.substitute("Screen aspect ratio: {0}", _screenAspectRatio));

        var fullPath:String = unescape(Main.rootValue.loaderInfo.url);

        _currentDirectory = fullPath.substring(0, fullPath.lastIndexOf("/") + 1);
        trace(StringUtil.substitute("Current directory: {0}", _currentDirectory));

        _applicationName = fullPath.substring(fullPath.lastIndexOf("/") + 1, fullPath.length);
        trace(StringUtil.substitute("Application name: {0}", _applicationName));

        if (SOCIAL::FACEBOOK)
        {
            _socialNetwork = ESocialNetworkType.ESNT_FACEBOOK;
        }
        else if (SOCIAL::VK)
        {
            _socialNetwork = ESocialNetworkType.ESNT_VK;
        }
        else
        {
            Debug.assert(false, "can't detect social network");
        }
    }
}
}
