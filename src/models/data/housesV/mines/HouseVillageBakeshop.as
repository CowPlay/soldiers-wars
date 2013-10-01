/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/4/13
 * Time: 1:51 PM
 * To change this template use File | Settings | File Templates.
 */
package models.data.housesV.mines
{
import flash.utils.Timer;

import models.village.housesV.base.EHouseVillageState;
import models.village.housesV.base.EHouseVillageType;
import models.village.housesV.base.HouseInfoV;

public class HouseVillageBakeshop extends HouseInfoV
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    public override function get type():String
    {
        return EHouseVillageType.EHVT_BAKESHOP;
    }


    /*
     * Methods
     */

    //! Default constructor
    public function HouseVillageBakeshop(state:EHouseVillageState, level:int)
    {
        super(state, level);

    }

    protected override function canBuild():Boolean
    {
        Debug.assert(false, "todo:implement");
        return false;
    }
}
}
