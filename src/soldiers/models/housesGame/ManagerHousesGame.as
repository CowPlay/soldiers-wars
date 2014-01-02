/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/19/13
 * Time: 8:43 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesGame
{
import core.DisposableObject;

import flash.utils.Dictionary;

import serialization.ISerializable;

import soldiers.models.housesGame.barracks.HouseGConfigBarracks;

import soldiers.models.housesGame.barracks.HouseGLevelInfoBarracks;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.housesGame.base.HouseGConfig;

public class ManagerHousesGame extends DisposableObject implements ISerializable
{
    /*
     * Fields
     */

    //! key - house type, value - house config
    private var _housesConfigs:Dictionary;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ManagerHousesGame()
    {
        super(false);
    }

    //! Returns array of levels info for specify house
    public function getHouseConfig(type:String):HouseGConfig
    {
        var result:HouseGConfig = _housesConfigs[type];

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

        _housesConfigs = new Dictionary(true);

        Debug.assert(data.hasOwnProperty("barracks"));

        var houseConfigBarracks:HouseGConfig = new HouseGConfigBarracks(HouseGLevelInfoBarracks);
        houseConfigBarracks.deserialize(data["barracks"]);
        _housesConfigs[EHouseTypeG.EHGT_BARRACKS] = houseConfigBarracks;
    }
}
}
