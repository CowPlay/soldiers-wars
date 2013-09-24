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
package models.data
{

import flash.geom.Point;
import models.GameInfo;

import models.data.houses.base.HouseInfo;
import models.game.managerHouses.ManagerHouses;
import models.implementations.levels.LevelInfoBase;

public class LevelInfo extends LevelInfoBase
{
    /*
     * Fields
     */
    private var _number:uint;

    //[ISerializable]
    private var _houses:Array;

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
        _houses = [];
    }

    public function onSelectHouse(player:PlayerInfo, house:HouseInfo):void
    {
//         Player
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
        Debug.assert(data.hasOwnProperty("number"));
        Debug.assert(data.hasOwnProperty("grid_width"));
        Debug.assert(data.hasOwnProperty("grid_height"));
        Debug.assert(data.hasOwnProperty("houses"));

        _number = data["number"];
        _gridSize = new Point(data["grid_width"], data["grid_height"]);

        var housesData:Array = data["houses"] as Array;

        var managerHouses:ManagerHouses = GameInfo.Instance.managerHouses;

        for each(var houseData:Object in housesData)
        {
            var house:HouseInfo = managerHouses.getHouse(houseData);

            _houses.push(house);
        }
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
