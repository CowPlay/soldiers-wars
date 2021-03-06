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

import soldiers.models.game.managerProgress.targets.FactoryTargets;
import soldiers.models.game.managerProgress.targets.base.LTBase;

public class LevelInfo extends LevelInfoBase
{
    /*
     * Fields
     */
    private var _housesData:Array;
    private var _decorData:Array;

    //[ISerializable]
    private var _gridSize:Point;

    private var _housesLevelMax:uint;

    private var _starsCount:uint;

    private var _targets:Array;
    private var _targetsStar1:Array;
    private var _targetsStar2:Array;
    private var _targetsStar3:Array;

    private var _aiActionsData:Array;

    /*
     * Properties
     */


    public function get aiActionsData():Array
    {
        return _aiActionsData;
    }

    public function get starsCount():uint
    {
        return _starsCount;
    }


    public function set starsCount(value:uint):void
    {
        if (_starsCount == value)
            return;

        _starsCount = value;
    }

    public function get targets():Array
    {
        return _targets;
    }

    public function get target1Complete():Boolean
    {
        return isTargetsComplete(_targetsStar1);
    }

    public function get targetsStar1():Array
    {
        return _targetsStar1;
    }

    public function get target2Complete():Boolean
    {
        return isTargetsComplete(_targetsStar2);
    }

    public function get targetsStar2():Array
    {
        return _targetsStar2;
    }

    public function get target3Complete():Boolean
    {
        return isTargetsComplete(_targetsStar3);
    }

    public function get targetsStar3():Array
    {
        return _targetsStar3;
    }

    private static function isTargetsComplete(targets:Array):Boolean
    {
        var result:Boolean = true;

        for each(var target:LTBase in targets)
        {
            if (!target.isComplete())
            {
                result = false;
                break;
            }
        }

        return result;
    }


    public function get gridSize():Point
    {
        return _gridSize;
    }


    public function get decorData():Array
    {
        return _decorData;
    }

    public function get housesData():Array
    {
        return _housesData;
    }

    public function get housesLevelMax():uint
    {
        return _housesLevelMax;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function LevelInfo()
    {
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
        Debug.assert(data["houses"] is Array);

        Debug.assert(data.hasOwnProperty("decor"));
        Debug.assert(data["decor"] is Array);

        Debug.assert(data.hasOwnProperty("stars_count"));

        Debug.assert(data.hasOwnProperty("targets_star_1"));
        Debug.assert(data["targets_star_1"] is Array);
        Debug.assert(data.hasOwnProperty("targets_star_2"));
        Debug.assert(data["targets_star_2"] is Array);
        Debug.assert(data.hasOwnProperty("targets_star_3"));
        Debug.assert(data["targets_star_3"] is Array);

        Debug.assert(data.hasOwnProperty("ai_actions"));
        Debug.assert(data["ai_actions"] is Array);

        _gridSize = new Point(data["grid_width"], data["grid_height"]);

        _housesData = data["houses"] as Array;
        _decorData = data["decor"] as Array;

        _housesLevelMax = data.hasOwnProperty("houses_level_max") ? data["houses_level_max"] : uint.MAX_VALUE;

        _starsCount = data["stars_count"];

        _targets = [];

        _targetsStar1 = [];
        initTargetsStar(_targetsStar1, data["targets_star_1"]);

        _targetsStar2 = [];
        initTargetsStar(_targetsStar2, data["targets_star_2"]);

        _targetsStar3 = [];
        initTargetsStar(_targetsStar3, data["targets_star_3"]);

        _aiActionsData = data["ai_actions"];
    }

    private function initTargetsStar(container:Array, data:Array):void
    {
        for each(var targetData:Object in data)
        {
            var target:Object = FactoryTargets.getTarget(targetData);
            container.push(target);

            _targets.push(target);
        }
    }
}
}
