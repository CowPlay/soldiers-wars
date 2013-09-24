package
{

import controllers.ESceneType;

import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.ui.ContextMenu;

import models.GameInfo;
import models.data.PlayerInfo;
import models.game.ManagerGameSoldiers;
import models.interfaces.IManagerGame;

import mx.utils.StringUtil;

public class Main extends MovieClip
{
    /*
     * Static fields
     */

    /*
     * Static properties
     */

    /*
     * Fields
     */
    private var _firstEnterFrame:Boolean;
    private var _preloaderBackground:Shape;
    private var _preloaderPercent:Shape;

    [Frame(factoryClass="models.data.PlayerInfo")]
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
        else if (SOCIAL::OFFLINE)
        {
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
            initGameInfo();
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

    private function initGameInfo():void
    {
        nextFrame();

        //init model
        GameInfo.initGameInfo(stage, this);
        //add root view of all scenes
        addChild(GameInfo.Instance.managerViewController.rootView);

        GameInfo.Instance.initSocialManager(onInitModelComplete, onInitModelError);
    }

    private function onInitModelComplete():void
    {
        GameInfo.Instance.run(
                function ():void
                {
                    var managerGame:IManagerGame = new ManagerGameSoldiers(GameInfo.Instance.managerLevels.levels[0]);
                    GameInfo.Instance.onGameStart(managerGame);

                    GameInfo.Instance.managerViewController.setScene(ESceneType.EST_GAME);
                });
    }

    private static function onInitModelError():void
    {
        Debug.assert(false, "Init model error");
    }
}
}
