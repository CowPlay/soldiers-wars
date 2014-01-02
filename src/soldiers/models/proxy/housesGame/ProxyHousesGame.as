/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/30/13
 * Time: 3:55 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.proxy.housesGame
{
public class ProxyHousesGame
{

    public static function getHousesGame(dataObj:Object):Object
    {
        var result:Object =
        {
            barracks: getBarracksData()
        };

        return result;
    }

    private static function getBarracksData():Object
    {
        var housesData:Array = [];

        var barracksLevel1:Object =
        {
            level: 1,

            soldiers_max       : 10
        };

        housesData.push(barracksLevel1);

        var barracksLevel2:Object =
        {
            level: 2,

            soldiers_max       : 20
        };

        housesData.push(barracksLevel2);

        var barracksLevel3:Object =
        {
            level: 3,

            soldiers_max       : 30
        };

        housesData.push(barracksLevel3);

        var barracksLevel4:Object =
        {
            level: 4,

            soldiers_max       : 40
        };

        housesData.push(barracksLevel4);


        var barracksLevel5:Object =
        {
            level: 5,

            soldiers_max       : 50
        };

        housesData.push(barracksLevel5);

        var result:Object =
        {
            soldiers_generation_speed: 1.2,
            foundation_width         : 4,
            foundation_height        : 4,
            levels_info              : housesData,
            level_max                : 5
        };

        return result;
    }
}
}
