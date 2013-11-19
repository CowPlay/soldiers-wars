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

import soldiers.models.GameInfo;

import soldiers.models.housesGame.barracks.HouseGBarracks;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.housesGame.base.HouseG;

public class LevelInfo extends LevelInfoBase
{
    /*
     * Fields
     */
    private var _housesData:Array;

    //[ISerializable]
    private var _gridSize:Point;


    /*
     * Properties
     */

    public function get gridSize():Point
    {
        return _gridSize;
    }


    public function get housesData():Array
    {
        return _housesData;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function LevelInfo()
    {
    }

    public override function onGameStart():void
    {
        for each(var house:HouseG in GameInfo.instance.managerGame.houses)
        {
            house.updateFoundation();
        }

        GameInfo.instance.managerGame.managerPath.generateLevelPaths();

        super.onGameStart();
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
