/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 6/14/13
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
package models.Game.base.gameObjects.Houses.Smithy
{
import models.data.houses.base.EHouseOwner;
import models.data.houses.base.EHouseType;
import models.data.houses.HouseBase;

public class Smithy extends HouseBase
{
    /*
     * Properties
     */

    public override function get type():EHouseType
    {
        return EHouseType.EHT_SMITHY;
    }

    /*
     * Methods
     */

    //! If owner type == null -> type = neutral
    public function Smithy(soldierCount:int, type:EHouseOwner = null)
    {
        super(soldierCount, type);
    }
}
}
