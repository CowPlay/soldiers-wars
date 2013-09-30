package
{

import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;

import models.GameInfo;

[Frame(factoryClass="Preloader")]
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
    }

    private function onAddedToStage(e:Event):void
    {
        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

        //init model
        GameInfo.run(stage);
    }
}
}
