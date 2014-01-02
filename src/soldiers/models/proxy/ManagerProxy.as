/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/30/13
 * Time: 10:07 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.proxy
{
import bwf.models.proxy.IManagerProxy;

import models.interfaces.social.IManagerSocial;

import soldiers.models.proxy.level0.ProxyLevel0;
import soldiers.models.proxy.level1.ProxyLevel1;
import soldiers.models.proxy.level2.ProxyLevel2;
import soldiers.models.proxy.level3.ProxyLevel3;
import soldiers.models.proxy.level4.ProxyLevel4;

public class ManagerProxy implements IManagerProxy
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ManagerProxy(managerSocial:IManagerSocial)
    {
    }


    public function getAdData(data:Object):Object
    {
        return null;
    }

    public function getTutorialData(data:Object):Object
    {
        return null;
    }


    /*
     * IManagerProxy
     */

    public function toRemoteRequestParams(type:String, data:Object):Object
    {
        return null;
    }

    public function getBonusData(data:Object):Object
    {
        return null;
    }

    public function getPurchasesData(data:Object):Object
    {
        return null;
    }

    public function getLevelsData(data:Object):Object
    {

        var levelContainer:Object =
        {
            id          : "",
            number      : 0,
            name        : "name",
            description : "",
            requirements: [],
            levels      : [ProxyLevel0.getLevelData0(), ProxyLevel1.getLevelData1(), ProxyLevel2.getLevelData2(), ProxyLevel3.getLevelData3(), ProxyLevel4.getLevelData4()]
        };

        var result:Object =
        {
            level_containers  : [levelContainer],
            level_progress    : null,
            level_complete_ids: []
        };

        return result;
    }



    public function getHousesVillage(dataObj:Object):Object
    {
        var bakeryData:Object = getBakeryData();
        var mineGoldData:Object = getMineGoldData();

        var housesData:Object =
        {
            bakery  : bakeryData,
            mineGold: mineGoldData
        };

        var result:Object =
        {
            houses: housesData
        };

        return result;
    }

    private static function getBakeryData():Object
    {
        var bakeryLevel1:Object =
        {
            level: 1,
            time : 5,
            count: 5
        };

        var bakeryLevel2:Object =
        {
            level: 2,
            time : 100,
            count: 20
        };

        var bakeryLevel3:Object =
        {
            level: 3,
            time : 300,
            count: 50
        };

        var result:Object =
        {
            level: 2,

            levels_info: [bakeryLevel1, bakeryLevel2, bakeryLevel3]
        };

        return result;
    }

    private static function getMineGoldData():Object
    {
        var mineGoldConfigLevel1:Object =
        {
            level: 1,
            time : 5,
            count: 5
        };

        var mineGoldConfigLevel2:Object =
        {
            level: 2,
            time : 100,
            count: 20
        };

        var mineGoldConfigLevel3:Object =
        {
            level: 3,
            time : 300,
            count: 50
        };

        var result:Object =
        {
            level      : 1,
            levels_info: [mineGoldConfigLevel1, mineGoldConfigLevel2, mineGoldConfigLevel3]
        };

        return result;
    }


    public function getPlayersData(dataObj:Object):Object
    {
        return null;
    }

    public function getPlayersTopPageData(data:Object):Array
    {
        return null;
    }

    public function getPlayerInfoData(dataObj:Object):Object
    {
        return null;
    }

    public function getPlayerPositionData(data:Object):Object
    {
        return null;
    }
}
}
