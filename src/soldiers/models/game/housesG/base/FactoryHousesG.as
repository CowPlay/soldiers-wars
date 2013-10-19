/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/7/13
 * Time: 12:31 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.housesG.base
{
import soldiers.models.game.housesG.HouseInfoGBarracks;

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

    public static function getHouse(data:Object):HouseG
    {
        Debug.assert(data.hasOwnProperty("type"));

        var result:HouseG = null;

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
