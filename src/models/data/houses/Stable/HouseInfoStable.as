/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 6/14/13
 * Time: 5:42 PM
 * To change this template use File | Settings | File Templates.
 */
package models.data.houses.stable
{
import models.data.houses.base.EHouseType;
import models.data.houses.base.HouseInfo;

public class HouseInfoStable extends HouseInfo
{
    /*
     * Properties
     */

    public override function get type():String
    {
        return EHouseType.EHT_STABLE;
    }

    /*
     * Methods
     */

    public function HouseInfoStable()
    {
    }
}
}

