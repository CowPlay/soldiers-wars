/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 8/29/13
 * Time: 9:59 AM
 * To change this template use File | Settings | File Templates.
 */

package {
import flash.display.MovieClip;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;

public class Preloader extends MovieClip
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function Preloader()
    {
        if (stage)
            init();
        else
            addEventListener(Event.ADDED_TO_STAGE, init);
    }

    private function init(e:Event = null):void
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);

        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;
    }
}
}
