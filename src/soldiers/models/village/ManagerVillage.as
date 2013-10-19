/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/3/13
 * Time: 2:53 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.village
{
import serialization.ISerializable;

import soldiers.models.village.housesV.bakery.HouseVBakery;
import soldiers.models.village.housesV.base.HouseV;

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

        var house:HouseV = new HouseVBakery();
        house.deserialize(housesData["bakery"]);
        _houses.push(house);
    }

    /*
     * IDisposable
     */

    public function cleanup():void
    {
    }
}
}
