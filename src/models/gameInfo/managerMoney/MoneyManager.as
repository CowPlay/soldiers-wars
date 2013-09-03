/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 8/31/13
 * Time: 2:02 PM
 * To change this template use File | Settings | File Templates.
 */
package models.gameInfo.managerMoney
{
public class MoneyManager
{
    /*
     * Fields
     */

    private var _moneyEnergy:uint;
    private var _moneyGold:uint;
    private var _moneyGems:uint;

    /*
     * Properties
     */

    public function get moneyEnergy():uint
    {
        return  _moneyEnergy;
    }

    public function get moneyGold():uint
    {
        return  _moneyGold;
    }

    public function get moneyGems():uint
    {
        return  _moneyGems;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function MoneyManager()
    {
        _moneyEnergy = 1000;
        _moneyGold = 1000;
        _moneyGems = 1000;
    }
}
}
