/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/7/13
 * Time: 2:59 AM
 * To change this template use File | Settings | File Templates.
 */
package core
{
public class Utils
{
    public static function randomFromTo(from:Number, to:Number):Number
    {
        return Math.floor(Math.random() * (1 + to - from)) + from;
    }
}
}
