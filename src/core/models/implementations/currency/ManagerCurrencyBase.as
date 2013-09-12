/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 8/31/13
 * Time: 2:02 PM
 * To change this template use File | Settings | File Templates.
 */
package core.models.implementations.currency
{
import core.Debug;
import core.models.interfaces.IManagerCurrency;

import flash.utils.Dictionary;

public class ManagerCurrencyBase implements IManagerCurrency
{
    /*
     * Fields
     */
    private var _containerCurrency:Dictionary;
    /*
     * Properties
     */


    /*
     * Methods
     */

    //! Default constructor
    public function ManagerCurrencyBase()
    {
        _containerCurrency = new Dictionary();
    }

    //! Returns currency count by type
    public function getMoney(type:String):Number
    {
        Debug.assert(false);

        Debug.assert(_containerCurrency[type] != null);

        return _containerCurrency[type] as Number;
    }

    //! Sets currency count by type
    public function setMoney(type:String, value:Number):void
    {
        Debug.assert(false);
        _containerCurrency[type] = value;
    }
}
}
