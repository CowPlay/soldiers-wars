/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/22/13
 * Time: 4:15 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.levels
{

import flash.geom.Point;

import models.implementations.levels.LevelInfoBase;
import models.implementations.players.PlayerInfoBase;

import soldiers.models.housesGame.barracks.HouseGBarracks;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.housesGame.base.HouseG;

public class LevelInfo extends LevelInfoBase
{
    /*
     * Fields
     */
    //[ISerializable]
    private var _houses:Array;
    private var _housesData:Array;

    //[ISerializable]
    private var _gridSize:Point;


    /*
     * Properties
     */

    public function get houses():Array
    {
        return _houses;
    }

    public function get gridSize():Point
    {
        return _gridSize;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function LevelInfo()
    {
    }

    public function onSelectHouse(player:PlayerInfoBase, house:HouseG):void
    {
//         Player
    }

    public override function onGameStart():void
    {
        super.onGameStart();

        for each(var houseData:Object in _housesData)
        {
            houseData.hasOwnProperty("type");

            var house:HouseG;

            switch (houseData["type"])
            {
                case EHouseTypeG.EHGT_BARRACKS:
                {
                    house = new HouseGBarracks();
                    house.deserialize(houseData);

                    break;
                }
                default :
                {
                    Debug.assert(false);
                    break;
                }
            }

            _houses.push(house);
        }
    }

    /*
     * ISerializable
     */

    public override function serialize():Object
    {
        return null;
    }

    public override function deserialize(data:Object):void
    {
        super.deserialize(data);
        Debug.assert(data.hasOwnProperty("grid_width"));
        Debug.assert(data.hasOwnProperty("grid_height"));
        Debug.assert(data.hasOwnProperty("houses"));

        _houses = [];

        _gridSize = new Point(data["grid_width"], data["grid_height"]);

        _housesData = data["houses"] as Array;
    }

    /*
     * IDisposable
     */

    public override function cleanup():void
    {
        super.cleanup();
    }


}
}
