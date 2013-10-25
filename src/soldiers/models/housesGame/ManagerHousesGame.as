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

import soldiers.models.housesGame.barracks.HouseGConfigBarracks;

import soldiers.models.housesGame.barracks.HouseGLevelInfoBarracks;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.housesGame.base.HouseGConfig;

public class ManagerHousesGame implements ISerializable
{
    /*
     * Fields
     */
    //Contains levels info for game houses
    //key - house type, value - array of levels info
    private var _housesLevelsInfo:Dictionary;

    private var _housesConfigBarracks:HouseGConfigBarracks;
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

    //! Returns array of levels info for specify house
    public function getLevelsInfoForHouse(type:String):Array
    {
        var result:Array = _housesLevelsInfo[type];

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

        _housesLevelsInfo = new Dictionary(true);

        Debug.assert(data.hasOwnProperty("barracks"));
        Debug.assert(data["barracks"] is Array);

        var barracksLevelsData:Array = data["barracks"];

        var barracksLevels:Array = [];

        for each(var barrackLevelData:Object in barracksLevelsData)
        {
            var barracksLevel:HouseGLevelInfoBarracks = new HouseGLevelInfoBarracks();
            barracksLevel.deserialize(barrackLevelData);
            barracksLevels.push(barracksLevel);
        }

        _housesLevelsInfo[EHouseTypeG.EHGT_BARRACKS] = barracksLevels;
    }

    /*
     * IDisposable
     */


    public function cleanup():void
    {
    }
}
}
