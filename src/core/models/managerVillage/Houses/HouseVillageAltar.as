/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/3/13
 * Time: 1:59 PM
 * To change this template use File | Settings | File Templates.
 */
package core.models.managerVillage.Houses
{
import core.models.GameInfo;
import core.models.managerVillage.Houses.base.EHouseVillageState;
import core.models.managerVillage.Houses.base.EHouseVillageType;
import core.models.managerVillage.Houses.base.HouseVillageBase;

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
