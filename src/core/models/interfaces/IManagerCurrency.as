/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/6/13
 * Time: 12:08 PM
 * To change this template use File | Settings | File Templates.
 */
package core.models.interfaces
{
public interface IManagerCurrency
{

    //! Returns currency count by type
    function getMoney(type:String):Number;

    //! Sets currency count by type
    function setMoney(type:String, value:Number):void;
}
}
