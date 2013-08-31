/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/4/13
 * Time: 2:12 PM
 * To change this template use File | Settings | File Templates.
 */
package models.gameInfo.VillageManager.Houses.mines
{
import models.gameInfo.GameInfo;
import models.gameInfo.VillageManager.Houses.EHouseVillageState;
import models.gameInfo.VillageManager.Houses.EHouseVillageType;
import models.gameInfo.VillageManager.Houses.HouseVillageBase;

public class HouseVillageMineGold extends HouseVillageBase
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    public override function get type():EHouseVillageType
    {
        return EHouseVillageType.EHVT_MINE_GOLD;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function HouseVillageMineGold(state:EHouseVillageState, level:int)
    {
        super(state, level);
    }

    protected override function canBuild():Boolean
    {
        return GameInfo.Instance.moneyManager.moneyGems > 5;
    }
}
}
