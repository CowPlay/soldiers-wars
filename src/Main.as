package
{

import com.junkbyte.console.Cc;

import flash.display.Sprite;
import flash.events.Event;

import soldiers.GameInfo;

[Frame(factoryClass="Preloader")]
[SWF(backgroundColor="#000000", width="1000", height="750", frameRate="60")]
public class Main extends Sprite
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

    public function Main()
    {
        addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

//        Cc.startOnStage(this, "");
    }

    private function onAddedToStage(e:Event):void
    {
        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        //init model
        GameInfo.run(stage);
    }
}
}
