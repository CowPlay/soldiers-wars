/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/19/13
 * Time: 8:43 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesGame
{
import flash.utils.Dictionary;

import serialization.ISerializable;

import soldiers.models.housesGame.barracks.HouseConfigGBarracks;
import soldiers.models.housesGame.base.EHouseTypeG;

public class ManagerHousesGame implements ISerializable
{
    /*
     * Fields
     */
    //Contains all default configs for game houses
    private var _configs:Dictionary;
    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ManagerHousesGame()
    {
    }

    //! Returns array of configs for specify house
    public function getConfigsForHouse(type:String):Array
    {
        var result:Array = _configs[type];

        Debug.assert(result != null);

        return result;
    }

    /*
     *  ISerializable
     */


    public function serialize():Object
    {
        return null;
    }

    public function deserialize(data:Object):void
    {
        Debug.assert(data != null);

        _configs = new Dictionary(true);

        Debug.assert(data.hasOwnProperty("barracks"));
        Debug.assert(data["barracks"] is Array);

        var barracksConfigsData:Array = data["barracks"];

        var barracksConfigs:Array = [];

        for each(var barrackLevelConfig:Object in barracksConfigsData)
        {
            var barracksConfig:HouseConfigGBarracks = new HouseConfigGBarracks();
            barracksConfig.deserialize(barrackLevelConfig);
            barracksConfigs.push(barracksConfig);
        }

        _configs[EHouseTypeG.EHGT_BARRACKS] = barracksConfigs;
    }

    /*
     * IDisposable
     */


    public function cleanup():void
    {
    }
}
}
