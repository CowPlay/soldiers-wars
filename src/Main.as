package
{

import core.controls.ControlScene;

import core.Debug;
import controllers.scenes.base.ESceneType;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Stage;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.external.ExternalInterface;
import flash.system.Security;
import flash.ui.ContextMenu;

import core.models.GameInfo;

import models.GameInfoSoldiers;

import mx.utils.StringUtil;

import core.socialApi.vk.APIConnection;

public class Main extends MovieClip
{
    /*
     * Static fields
     */
    private static var _stage:Stage;
    private static var _root:DisplayObject;

    /*
     * Static properties
     */

    public static function get stageValue():Stage
    {
        return _stage;
    }

    public static function get rootValue():DisplayObject
    {
        return _root;
    }

    /*
     * Fields
     */
    private var _firstEnterFrame:Boolean;
    private var _preloaderBackground:Shape;
    private var _preloaderPercent:Shape;


    public function Main()
    {
        if (stage)
            init();
        else
            addEventListener(Event.ADDED_TO_STAGE, init);

        var buildConfigurationStr:String;

        if (SOCIAL::FACEBOOK)
        {
            buildConfigurationStr = StringUtil.substitute("build configuration: facebook.{0}", CONFIG::DEBUG ? "debug" : "release")
        }
        else if (SOCIAL::VK)
        {
            Security.allowInsecureDomain("vk.com");
            Security.allowDomain('vk.com');

            buildConfigurationStr = StringUtil.substitute("build configuration: vk.{0}", CONFIG::DEBUG ? "debug" : "release")
        }
        else if (SOCIAL::OFFLINE)
        {
            Security.allowInsecureDomain("*");
            Security.allowDomain('*');

            buildConfigurationStr = StringUtil.substitute("build configuration: offline.{0}", CONFIG::DEBUG ? "debug" : "release")
        }
        else
        {
            Debug.assert(false, "Can't detect social network");
        }

        Debug.log(buildConfigurationStr);

    }

    private function init(e:Event = null):void
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);

        _stage = stage;
        _root = root;

        //edit context menu
        var contextMenuSimple:ContextMenu = new ContextMenu();
        contextMenuSimple.hideBuiltInItems();
        contextMenu = contextMenuSimple;

        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;
        stage.color = 0xF5F5F5;

        start();
    }

    public function start():void
    {
        _firstEnterFrame = true;

        addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(event:Event):void
    {

        if (root.loaderInfo.bytesLoaded >= root.loaderInfo.bytesTotal)
        {
            dispose();
            run();
        }
        else
        {
            if (_firstEnterFrame)
            {
                _firstEnterFrame = false;

                beginLoading();
            }
            else
            {
                var percent:Number = root.loaderInfo.bytesLoaded / root.loaderInfo.bytesTotal;
                updateLoading(percent);
            }
        }
    }

    // this function may never be called if the load is instant
    private function updateLoading(a_percent:Number):void
    {
        _preloaderPercent.scaleX = a_percent
    }

    // this function may never be called if the load is instant
    private function beginLoading():void
    {
        _preloaderBackground = new Shape();
        _preloaderBackground.graphics.beginFill(0x333333);
        _preloaderBackground.graphics.lineStyle(2, 0x000000);
        _preloaderBackground.graphics.drawRect(0, 0, 200, 20);
        _preloaderBackground.graphics.endFill();

        //
        _preloaderPercent = new Shape();
        _preloaderPercent.graphics.beginFill(0xFFFFFFF);
        _preloaderPercent.graphics.drawRect(0, 0, 200, 20);
        _preloaderPercent.graphics.endFill();
        //
        addChild(_preloaderBackground);
        addChild(_preloaderPercent);
        _preloaderBackground.x = _preloaderBackground.y = 10;
        _preloaderPercent.x = _preloaderPercent.y = 10;
        _preloaderPercent.scaleX = 0;
    }


    private function dispose():void
    {
        removeEventListener(Event.ENTER_FRAME, onEnterFrame);
        if (_preloaderBackground)
        {
            removeChild(_preloaderBackground);
        }
        if (_preloaderPercent)
        {
            removeChild(_preloaderPercent);
        }
        _preloaderBackground = null;
        _preloaderPercent = null;
    }

    private function run():void
    {
        nextFrame();

        //init model
        GameInfoSoldiers.initGameInfoSoldiers();

        //init social network connection
        GameInfoSoldiers.Instance.initSocialManager(onInitSocialComplete, onInitSocialError);
    }

    private function onInitSocialComplete():void
    {
        Debug.log("Init model complete. Start the game.");

        //add root view of all scenes
        addChild(ControlScene.rootView);

        //init view+controller
        ControlScene.setScene(ESceneType.EST_VILLAGE);
    }

    private static function onInitSocialError():void
    {
        Debug.assert(false, "Can't login to social network");
    }
}
}
