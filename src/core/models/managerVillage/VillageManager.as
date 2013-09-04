/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/3/13
 * Time: 2:53 PM
 * To change this template use File | Settings | File Templates.
 */
package core.models.managerVillage
{
import core.Debug;

import core.models.managerVillage.Houses.HouseVillageAltar;
import core.models.managerVillage.Houses.base.EHouseVillageState;
import core.models.managerVillage.Houses.base.EHouseVillageType;
import core.models.managerVillage.Houses.base.HouseVillageBase;
import core.models.managerVillage.Houses.mines.HouseVillageBakeshop;
import core.models.managerVillage.Houses.mines.HouseVillageMineGems;
import core.models.managerVillage.Houses.mines.HouseVillageMineGold;

public class VillageManager
{
    /*
     * Fields
     */

    private var _houses:Array;

    /*
     * Properties
     */

    public function get houses():Array
    {
        return _houses;
    }


    /*
     * Methods
     */

    //! Default constructor
    public function VillageManager()
    {
        init();
    }

    private function init():void
    {
        //load houses
        _houses = [];

        var houseAltar:HouseVillageAltar = new HouseVillageAltar(EHouseVillageState.EHVS_CLOSED, 1);
        _houses.push(houseAltar);

        var houseBakeshop:HouseVillageBakeshop = new HouseVillageBakeshop(EHouseVillageState.EHVS_CLOSED, 1);
        _houses.push(houseBakeshop);

        var houseMineGems:HouseVillageMineGems = new HouseVillageMineGems(EHouseVillageState.EHVS_CLOSED, 1);
        _houses.push(houseMineGems);


        var houseMineGold0:HouseVillageMineGold = new HouseVillageMineGold(EHouseVillageState.EHVS_CLOSED, 1);
        _houses.push(houseMineGold0);
    }

    public function getHouseByType(type:EHouseVillageType):HouseVillageBase
    {
        Debug.assert(type != null);

        var result:HouseVillageBase;

        for each(var house:HouseVillageBase in _houses)
        {
            if (house.type == type)
            {
                result = house;
                break;
            }
        }

        return result;
    }

    public function didHouseBuild(house:HouseVillageBase):void
    {

    }


}
}
