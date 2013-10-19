/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/3/13
 * Time: 1:59 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.village.housesV
{
import soldiers.models.village.housesV.base.EHouseTypeV;
import soldiers.models.village.housesV.base.HouseV;

public class HouseInfoVAltar extends HouseV
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    public override function get type():String
    {
        return EHouseTypeV.EHTV_ALTAR;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function HouseInfoVAltar()
    {
        super();
    }

    protected override function canBuild():Boolean
    {
        Debug.assert(false, "todo:implement");
        return false;
    }
}
}
