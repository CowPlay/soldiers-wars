/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/3/13
 * Time: 1:59 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.data.housesV
{
import soldiers.models.data.housesV.base.EHouseVType;
import soldiers.models.data.housesV.base.HouseInfoV;

public class HouseInfoVAltar extends HouseInfoV
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    public override function get type():String
    {
        return EHouseVType.EHVT_ALTAR;
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
