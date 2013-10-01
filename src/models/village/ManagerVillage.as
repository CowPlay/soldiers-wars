/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/3/13
 * Time: 2:53 PM
 * To change this template use File | Settings | File Templates.
 */
package models.village
{
import models.data.housesV.base.FactoryHousesV;
import models.data.housesV.base.HouseInfoV;

import serialization.ISerializable;

public class ManagerVillage implements ISerializable
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
    public function ManagerVillage()
    {
        init();
    }

    private function init():void
    {

    }

    public function getHouseByType(type:String):HouseInfoV
    {
        Debug.assert(type != null);

        var result:HouseInfoV;

        for each(var house:HouseInfoV in _houses)
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

    public function didHouseBuild(house:HouseInfoV):void
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
        Debug.assert(data["houses"] is Array);


        //load houses
        _houses = [];

        var housesData:Array = data["houses"];
        for each(var houseData:Object in housesData)
        {
            var house:HouseInfoV = FactoryHousesV.getHouse(houseData);
            _houses.push(house);
        }
    }

    /*
     * IDisposable
     */


    public function cleanup():void
    {
    }
}
}
