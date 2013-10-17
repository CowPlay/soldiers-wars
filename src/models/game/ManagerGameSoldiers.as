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

import controllers.EControlUpdateType;

import flash.utils.Dictionary;

import models.data.LevelInfo;
import models.data.housesG.base.EHouseOwner;
import models.data.housesG.base.HouseInfoG;
import models.game.managerPath.ManagerPath;
import models.game.managerSoldiers.ManagerSoldiers;
import models.implementations.game.ManagerGameBase;
import models.interfaces.players.IPlayerInfo;

public class ManagerGameSoldiers extends ManagerGameBase
{
    /*
     * Fields
     */

    private var _currentLevel:LevelInfo;

    //key - playerinfo, value - array of selected houses
    private var _selectedHouses:Dictionary;
    private var _gameOwner:IPlayerInfo;
    private var _gameOwnerOpponent:IPlayerInfo;

    private var _managerPath:ManagerPath;
    private var _managerSoldiers:ManagerSoldiers;

    /*
     * Properties
     */

    public function get managerPath():ManagerPath
    {
        return _managerPath;
    }

    public function get managerSoldiers():ManagerSoldiers
    {
        return _managerSoldiers;
    }

    public function get gameOwner():IPlayerInfo
    {
        return _gameOwner;
    }

    public function get gameOwnerOpponent():IPlayerInfo
    {
        return _gameOwnerOpponent;
    }

    public function get currentLevel():LevelInfo
    {
        return _currentLevel;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ManagerGameSoldiers(currentLevelValue:LevelInfo, gameOwnerValue:IPlayerInfo, gameOwnerOpponentValue:IPlayerInfo)
    {
        super(currentLevelValue);

        Debug.assert(gameOwnerValue != null);
        Debug.assert(gameOwnerOpponentValue != null);

        _currentLevel = currentLevelValue;

        _gameOwner = gameOwnerValue;
        _gameOwnerOpponent = gameOwnerOpponentValue;

        init();
    }

    private function init():void
    {
        _managerPath = new ManagerPath(currentLevel);
        _managerPath.generateLevelPaths();
        _managerSoldiers = new ManagerSoldiers();

        _selectedHouses = new Dictionary(true);

        _selectedHouses[_gameOwner] = [];
        _selectedHouses[_gameOwnerOpponent] = [];

        //bind houses to players
        for each(var house:HouseInfoG in _currentLevel.houses)
        {
            switch (house.ownerTypeOnStart)
            {
                case EHouseOwner.EHO_PLAYER:
                {
                    house.owner = _gameOwner;
                    break;
                }
                case EHouseOwner.EHO_ENEMY:
                {
                    house.owner = _gameOwnerOpponent;
                    break;
                }
                default :
                {
                    Debug.assert(false);
                    break;
                }
            }
        }
    }


    public function onPlayerGenerateSoldiers(player:IPlayerInfo, target:HouseInfoG):void
    {
        Debug.assert(player != null);
        Debug.assert(target != null);

        var selectedHouses:Array = _selectedHouses[player];
        Debug.assert(selectedHouses.length > 0);

        for each(var house:HouseInfoG in selectedHouses)
        {
            if (target == house)
            {
                continue;
            }

            _managerSoldiers.generateSoldiers(house, target, house.soldierCount / 2);
        }

        clearHousesSelection(player);
    }

    public function onPlayerSelectHouse(player:IPlayerInfo, value:HouseInfoG):void
    {
        var selectedHouses:Array = _selectedHouses[player];

        value.isSelect = true;

        Debug.assert(selectedHouses.indexOf(value) == ConstantsBase.INDEX_NONE);

        selectedHouses.push(value);

        _selectedHouses[player] = selectedHouses;

        _sceneGame.update(EControlUpdateType.ECUT_HOUSE_SELECTION_CHANGED);
    }

    public function clearHousesSelection(player:IPlayerInfo):void
    {
        var selectedHouses:Array = _selectedHouses[player];

        for each(var house:HouseInfoG in selectedHouses)
        {
            house.isSelect = false;
        }

        _selectedHouses[player] = [];

        _sceneGame.update(EControlUpdateType.ECUT_HOUSE_SELECTION_CHANGED);
    }

    public function isAnyHouseSelected(player:IPlayerInfo):Boolean
    {
        return  _selectedHouses[player].length > 0;
    }
}
}
