/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/7/13
 * Time: 12:31 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.data.housesG.base
{
import soldiers.models.data.housesG.HouseInfoGBarracks;

public class FactoryHousesG
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

    public static function getHouse(data:Object):HouseInfoG
    {
        Debug.assert(data.hasOwnProperty("type"));

        var result:HouseInfoG = null;

        var type:String = data["type"];

        switch (type.toUpperCase())
        {
            case EHouseGType.EHGT_BARRACKS:
            {
                result = new HouseInfoGBarracks();
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
