/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 6/14/13
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
package models.data.housesG
{
import models.data.housesG.base.EHouseGType;
import models.data.housesG.base.HouseInfoG;

public class HouseInfoGSmithy extends HouseInfoG
{
    /*
     * Properties
     */

    public override function get type():String
    {
        return EHouseGType.EHGT_SMITHY;
    }

    /*
     * Methods
     */

    public function HouseInfoGSmithy()
    {
    }
}
}
