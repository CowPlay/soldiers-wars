/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 22.10.13
 * Time: 16:37
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesVillage.mineGold
{
import soldiers.models.housesVillage.base.EHouseTypeV;
import soldiers.models.housesVillage.base.HouseV;

public class HouseVMiniGold extends HouseV
{
    /*
     * Fields
     */

    /*
     * Properties
     */
    public override function get type():String
    {
        return EHouseTypeV.EHVT_MINE_GOLD;
    }

    public function get currentConfig():HouseConfigVMineGold
    {
        return configs[level];
    }

    protected override function get configClass():Class
    {
        return HouseConfigVMineGold;
    }


    /*
     * Methods
     */

    //! Default constructor
    public function HouseVMiniGold()
    {
    }

}
}
