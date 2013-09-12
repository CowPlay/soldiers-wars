/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/4/13
 * Time: 1:48 PM
 * To change this template use File | Settings | File Templates.
 */
package models.village.Houses.mines
{
import core.Debug;

import models.village.Houses.base.EHouseVillageState;
import models.village.Houses.base.EHouseVillageType;
import models.village.Houses.base.HouseVillageBase;

public class HouseVillageMineGems extends HouseVillageBase
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    public override function get type():EHouseVillageType
    {
        return EHouseVillageType.EHVT_MINE_GEMS;
    }


    /*
     * Methods
     */

    //! Default constructor
    public function HouseVillageMineGems(state:EHouseVillageState, level:int)
    {
        super(state, level);
    }

    protected override function canBuild():Boolean
    {
        Debug.assert(false, "todo: implement");
        return false;
    }

}
}
