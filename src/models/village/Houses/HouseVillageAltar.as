/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/3/13
 * Time: 1:59 PM
 * To change this template use File | Settings | File Templates.
 */
package models.village.Houses
{
import core.Debug;

import models.village.Houses.base.EHouseVillageState;
import models.village.Houses.base.EHouseVillageType;
import models.village.Houses.base.HouseVillageBase;

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
        Debug.assert(false, "todo:implement")
        return false;
    }
}
}
