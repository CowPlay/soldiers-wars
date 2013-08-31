package
{

import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.text.TextField;

public class Main extends MovieClip
{
    /*
     * Fields
     */
    private var _firstEnterFrame:Boolean;
    private var _preloaderBackground:Shape;
    private var _preloaderPercent:Shape;


//    [SWF(frameRate="60", width="807", height="730")]
    public function Main()
    {
        if (stage)
            init();
        else
            addEventListener(Event.ADDED_TO_STAGE, init);

        var textField:TextField = new TextField();

        var text:String;

        if (SOCIAL::FACEBOOK)
        {
            text = "facebook";

            if (CONFIG::DEBUG)
            {
                text += ".debug";
            }
        }
        else if (SOCIAL::VK)
        {
            text = "vk";

            if (CONFIG::DEBUG)
            {
                text += ".debug";
            }
        }

        textField.text = text;

        addChild(textField);

    }

    private function init(e:Event = null):void
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);

        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;

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
        trace("dispose preloader");

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

        //TODO: run
    }
}
}
