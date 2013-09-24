/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 6/14/13
 * Time: 5:42 PM
 * To change this template use File | Settings | File Templates.
 */
package models.Game.base.gameObjects.Houses.Stable
{
import models.data.houses.base.EHouseOwner;
import models.data.houses.base.EHouseType;
import models.data.houses.HouseBase;

public class Stable extends HouseBase
{
    /*
     * Properties
     */

    public override function get type():EHouseType
    {
        return EHouseType.EHT_STABLE;
    }

    /*
     * Methods
     */

    //! If owner type == null -> type = neutral
    public function Stable(soldierCount:int, type:EHouseOwner = null)
    {
        super(soldierCount, type);
    }
}
}

