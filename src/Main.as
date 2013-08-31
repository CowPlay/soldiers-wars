package
{

import Preloader;
import flash.display.MovieClip;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.text.TextField;

public class Main extends Sprite
{
//    [SWF(frameRate="60", width="807", height="730")]
    [Frame(factoryClass="Preloader")]
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

        new Preloader();
    }
}
}
