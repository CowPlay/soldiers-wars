/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/3/13
 * Time: 2:53 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesVillage
{
import core.DisposableObject;

import serialization.ISerializable;

import soldiers.models.housesVillage.bakery.HouseVBakery;
import soldiers.models.housesVillage.base.HouseV;
import soldiers.models.housesVillage.mineGold.HouseVMineGold;

public class ManagerHousesVillage extends DisposableObject implements ISerializable
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
    public function ManagerHousesVillage()
    {
        super(false);

        init();
    }

    private function init():void
    {

    }

    public function getHouseByType(type:String):HouseV
    {
        Debug.assert(type != null);

        var result:HouseV;

        for each(var house:HouseV in _houses)
        {
            if (house.type == type)
            {
                result = house;
                break;
            }
        }

        Debug.assert(result != null);

        return result;
    }

    public function didHouseImprove(house:HouseV):void
    {

    }

    public function didHouseBuild(house:HouseV):void
    {

    }

    /*
     * ISerializable
     */


    public function serialize():Object
    {
        return null;
    }

    public function deserialize(data:Object):void
    {
        Debug.assert(data.hasOwnProperty("houses"));

        var housesData:Object = data["houses"];

        Debug.assert(housesData.hasOwnProperty("bakery"));

        //load houses
        _houses = [];

//        var houseVAltar:HouseV = new HouseInfoVAltar();
//        houseVAltar.deserialize(housesData["altar"]);
//        _houses.push(houseVAltar);

        var houseVBakery:HouseV = new HouseVBakery();
        houseVBakery.deserialize(housesData["bakery"]);
        _houses.push(houseVBakery);

        var houseVMimeGold:HouseV = new HouseVMineGold();
        houseVMimeGold.deserialize(housesData["mineGold"]);
        _houses.push(houseVMimeGold);
    }
}
}
