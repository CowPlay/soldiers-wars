/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/19/13
 * Time: 10:03 PM
 * To change this template use File | Settings | File Templates.
 */
package models.game
{

import models.data.LevelInfo;
import models.data.houses.base.HouseInfo;
import models.game.managerPath.ManagerPath;
import models.implementations.game.ManagerGameBase;

public class ManagerGameSoldiers extends ManagerGameBase
{
    /*
     * Fields
     */
    private var _currentLevel:LevelInfo;

    private var _selectedHouses:Array;

    private var _managerPath:ManagerPath;

    /*
     * Properties
     */

    public function get managerPath():ManagerPath
    {
        return _managerPath;
    }


    public function get currentLevel():LevelInfo
    {
        return _currentLevel;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ManagerGameSoldiers(currentLevelValue:LevelInfo)
    {
        Debug.assert(currentLevelValue != null);

        _currentLevel = currentLevelValue;
        init();

    }

    private function init():void
    {
        _selectedHouses = [];

        _managerPath = new ManagerPath(_currentLevel);
    }

    public function onPlayerSelectHouse(value:HouseInfo):void
    {

    }
}
}
