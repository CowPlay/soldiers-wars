/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/7/13
 * Time: 12:31 AM
 * To change this template use File | Settings | File Templates.
 */
package models.game.managerHouses
{
import models.data.houses.barracks.HouseInfoBarracks;
import models.data.houses.base.EHouseType;
import models.data.houses.base.HouseInfo;

public class ManagerHouses
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
    public function ManagerHouses()
    {
        init();
    }

    private function init():void
    {
    }

    public function getHouse(data:Object):HouseInfo
    {
        Debug.assert(data.hasOwnProperty("type"));

        var result:HouseInfo = null;

        var type:String = data["type"];

        switch (type.toUpperCase())
        {
            case EHouseType.EHT_BARRACKS:
            {
                result = new HouseInfoBarracks();
                result.deserialize(data);
                break;
            }

            default :
            {
                Debug.assert(false);
                break;
            }
        }

        return result;

    }

    public function initLevelHouses():void
    {
//        _houses = [];
//
//        {//house 1
//            var _house1:HouseInfoBarracks = new HouseInfoBarracks(10, EHouseOwner.EHO_PLAYER);
//
//            _house1.setPosition(5, 5);
//
//            _houses.push(_house1);
//        }
//
//        {//house 2
//            var _house2:HouseInfoBarracks = new HouseInfoBarracks(9, EHouseOwner.EHO_ENEMY);
//
//            _house2.setPosition(20, 8);
//            _house2.rotateLeftToRight = false;
//
//            _houses.push(_house2);
//        }
////
////        {//house 3
////            var _house3:Tower = new Tower(10);
////
////            _house3.setPosition(5, 0);
////
////            _houses.push(_house3);
////        }
////
////        {//house 4
////            var _house4:Barracks = new Barracks(9, EHouseOwner.EHO_ENEMY);
////
////            _house4.setPosition(8, 8);
////
////            _houses.push(_house4);
////        }
////
////        {//house 5
////            var _house5:Barracks = new Barracks(9, EHouseOwner.EHO_ENEMY);
////
////            _house5.setPosition(5, 0);
////
////            _houses.push(_house5);
////        }
////
////
////        {//forge 6
////            var forge:Smithy = new Smithy(9);
////
////            forge.setPosition(0, 5);
////
////            _houses.push(forge);
////        }
////
////        {//stable 1
////            var stable:Stable = new Stable(9);
////
////            stable.setPosition(5, 10);
////
////            _houses.push(stable);
////        }
    }
}
}
