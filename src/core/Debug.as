/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 5/30/13
 * Time: 5:44 PM
 * To change this template use File | Settings | File Templates.
 */
package core
{
import flash.utils.getTimer;


public class Debug
{
    /*
     * Debug constants
     */

    public static const SHOW_DEBUG_DATA:Boolean = true;

    public static const SHOW_GRID:Boolean = true;


    //AStar
    public static const SHOW_ASTAR_PATH_RESULT:Boolean = true;
    public static const SHOW_ASTAR_PATH_DEBUG:Boolean = false;

    //Houses
    public static const SHOW_HOUSE:Boolean = false;
    public static const SHOW_HOUSE_POSITION:Boolean = true;
    public static const SHOW_HOUSE_FOUNDATION:Boolean = true;
    public static const SHOW_HOUSE_EXIT:Boolean = true;

    /*
     * Methods
     */

    public static function sleep(ms:int):void
    {
        var init:int = getTimer();
        while (true)
        {
            if (getTimer() - init >= ms)
            {
                break;
            }
        }
    }

    public static function assert(expression:Boolean, warning:String = "Assertion failed!"):void
    {
        //TODO: implement only when debug session
        CONFIG::DEBUG
        {
            if (!expression)
            {
                throw new Error(warning);
            }
        }
    }


}
}
