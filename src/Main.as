package
{

import controllers.scenes.Base.ESceneType;
import controllers.scenes.Base.SceneBase;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Stage;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.system.Security;

import models.gameInfo.GameInfo;

import mx.utils.StringUtil;

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
            buildConfigurationStr = StringUtil.substitute("build configuration: vk.{0}", CONFIG::DEBUG ? "debug" : "release")
        }

        trace(buildConfigurationStr);
    }

    private function init(e:Event = null):void
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);

        _stage = stage;
        _root = root;

        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;
        stage.color = 0xF5F5F5;

        Security.allowInsecureDomain("*");
        Security.allowDomain('*');

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
        trace("begin Loading");
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
        //add root view of all scenes
        addChild(SceneBase.rootView);

        //init model
        var gi:GameInfo = GameInfo.Instance;

        //init view+controller
        SceneBase.setScene(ESceneType.EST_VILLAGE);
    }
}
}
