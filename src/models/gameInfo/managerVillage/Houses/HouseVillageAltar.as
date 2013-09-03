/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/3/13
 * Time: 1:59 PM
 * To change this template use File | Settings | File Templates.
 */
package models.gameInfo.managerVillage.Houses
{
import models.gameInfo.GameInfo;
import models.gameInfo.managerVillage.Houses.base.EHouseVillageState;
import models.gameInfo.managerVillage.Houses.base.EHouseVillageType;
import models.gameInfo.managerVillage.Houses.base.HouseVillageBase;

public class HouseVillageAltar extends HouseVillageBase
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    public override function get type():EHouseVillageType
    {
        return EHouseVillageType.EHVT_ALTAR;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function HouseVillageAltar(state:EHouseVillageState, level:int)
    {
        super(state, level);
    }

    protected override function canBuild():Boolean
    {
        return GameInfo.Instance.moneyManager.moneyGems > 5;
    }
}
}
