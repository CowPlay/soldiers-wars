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

import data.implementations.PlayerInfoBase;

import flash.geom.Point;

import models.data.houses.base.HouseInfo;
import models.data.houses.base.FactoryHouses;
import models.implementations.levels.LevelInfoBase;

public class LevelInfo extends LevelInfoBase
{
    /*
     * Fields
     */
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
    }

    public function onSelectHouse(player:PlayerInfoBase, house:HouseInfo):void
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
        super.deserialize(data);
        Debug.assert(data.hasOwnProperty("grid_width"));
        Debug.assert(data.hasOwnProperty("grid_height"));
        Debug.assert(data.hasOwnProperty("houses"));

        _houses = [];

        _gridSize = new Point(data["grid_width"], data["grid_height"]);

        var housesData:Array = data["houses"] as Array;

        for each(var houseData:Object in housesData)
        {
            var house:HouseInfo = FactoryHouses.getHouse(houseData);

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
