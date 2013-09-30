/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 6/14/13
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
package models.data.houses.smithy
{
import models.data.houses.base.EHouseType;
import models.data.houses.base.HouseInfo;

public class HouseInfoSmithy extends HouseInfo
{
    /*
     * Properties
     */

    public override function get type():String
    {
        return EHouseType.EHT_SMITHY;
    }

    /*
     * Methods
     */

    public function HouseInfoSmithy()
    {
    }
}
}
