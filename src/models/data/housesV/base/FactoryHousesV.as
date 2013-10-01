/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/1/13
 * Time: 12:41 AM
 * To change this template use File | Settings | File Templates.
 */
package models.data.housesV.base
{
import models.data.housesV.HouseInfoVAltar;

public class FactoryHousesV
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    /*
     * Methods
     */
    public static function getHouse(data:Object):HouseInfoV
    {
        Debug.assert(data.hasOwnProperty("type"));

        var result:HouseInfoV = null;

        var type:String = data["type"];

        switch (type.toUpperCase())
        {
            case EHouseVType.EHVT_ALTAR:
            {
                result = new HouseInfoVAltar();
                result.deserialize(data);
                break;
            }

            default :
            {
                Debug.assert(false);
                break;
            }
        }

        return result;

    }
}
}
