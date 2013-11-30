/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/20/13
 * Time: 7:07 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesGame.base
{
import core.DisposableObject;

import flash.geom.Point;

import flash.utils.Dictionary;

import serialization.ISerializable;

public class HouseGConfig extends DisposableObject implements ISerializable
{
    /*
     * Fields
     */
    private var _levelInfoClass:Class;

    private var _levelMax:uint;

    private var _foundationSize:Point;

    //Contains levels info for game houses
    //key - level number, value - level info
    private var _houseLevelsInfo:Dictionary;

    /*
     * Properties
     */

    public function get levelMax():uint
    {
        return _levelMax;
    }

    public function get houseLevelsInfo():Dictionary
    {
        return _houseLevelsInfo;
    }


    public function get foundationSize():Point
    {
        return _foundationSize;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function HouseGConfig(levelInfoClass:Class)
    {
        super(false);

        Debug.assert(levelInfoClass != null);

        _levelInfoClass = levelInfoClass;
    }

    /*
     * ISerializable
     */


    public function serialize():Object
    {
        return null;
    }

    public function deserialize(data:Object):void
    {
        Debug.assert(data.hasOwnProperty("level_max"));

        Debug.assert(data.hasOwnProperty("levels_info"));
        Debug.assert(data["levels_info"] is Array);

        Debug.assert(data.hasOwnProperty("foundation_width"));
        Debug.assert(data.hasOwnProperty("foundation_height"));

        _foundationSize = new Point(data["foundation_width"], data["foundation_height"]);

        _levelMax = data["level_max"];

        _houseLevelsInfo = new Dictionary(true);

        var levelsInfo:Array = data["levels_info"];

        for each(var barrackLevelData:Object in levelsInfo)
        {
            var levelInfo:HouseGLevelInfo = new _levelInfoClass();
            levelInfo.deserialize(barrackLevelData);

            Debug.assert(_houseLevelsInfo[levelInfo.level] == null, "Level info already defined");

            _houseLevelsInfo[levelInfo.level] = levelInfo;
        }

    }
}
}
