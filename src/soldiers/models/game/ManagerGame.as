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
package soldiers.models.game
{

import controls.EControllerUpdateBase;

import flash.geom.Point;
import flash.utils.Dictionary;

import models.GameInfoBase;
import models.implementations.game.ManagerGameBase;
import models.interfaces.levels.ILevelInfo;
import models.interfaces.players.IPlayerInfo;

import soldiers.controllers.EControllerUpdate;
import soldiers.models.GameInfo;
import soldiers.models.game.managerPath.GridCell;
import soldiers.models.game.managerPath.ManagerPath;
import soldiers.models.game.managerSoldiers.ManagerSoldiers;
import soldiers.models.housesGame.barracks.HouseGBarracks;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.housesGame.base.HouseG;
import soldiers.models.levels.LevelInfo;

public class ManagerGame extends ManagerGameBase
{
    /*
     *  Fields
     */

    private var _currentLevel:LevelInfo;

    //key - playerinfo, value - array of selected houses
    private var _selectedHouses:Dictionary;
    private var _gameOwner:IPlayerInfo;
    private var _gameOwnerOpponent:IPlayerInfo;

    private var _managerPath:ManagerPath;
    private var _managerSoldiers:ManagerSoldiers;

    //[ISerializable]
    private var _houses:Array;

    /*
     * Properties
     */

    public function get houses():Array
    {
        return _houses;
    }

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
    public function ManagerGame(currentLevelValue:LevelInfo, gameOwnerValue:IPlayerInfo, gameOwnerOpponentValue:IPlayerInfo)
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
        _managerPath = new ManagerPath(currentLevel.gridSize);
        _managerSoldiers = new ManagerSoldiers();

        _selectedHouses = new Dictionary(true);

        _selectedHouses[_gameOwner] = [];
        _selectedHouses[_gameOwnerOpponent] = [];

        initHouses();
        initFoundations();
    }

    private function initFoundations():void
    {
        for each(var house:HouseG in _houses)
        {
            var rowFrom:int = house.positionCurrent.y;
            var rowTo:int = rowFrom + house.houseConfig.foundationSize.y;

            var columnFrom:int = house.positionCurrent.x;
            var columnTo:int = columnFrom + house.houseConfig.foundationSize.x;

            //make foundations not walkable
            for (var row:uint = rowFrom; row <= rowTo; row++)
            {
                for (var column:uint = columnFrom; column <= columnTo; column++)
                {
                    var foundationCell:GridCell = _managerPath.getCell(new Point(column, row));
                    foundationCell.traversable = false;
                }
            }

            //and make house exit traversable
//            var houseExitCell:GridCell = managerPath.getCell(positionExit);
//            houseExitCell.traversable = true;
//            house.updateFoundation();
        }
    }

    private function initHouses():void
    {
        _houses = [];

        for each(var houseData:Object in _currentLevel.housesData)
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

            //bind houses to players
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

            _houses.push(house);
        }
    }

    public function onPlayerGenerateSoldiers(player:IPlayerInfo, target:HouseG):void
    {
        Debug.assert(player != null);
        Debug.assert(target != null);

        var selectedHouses:Array = _selectedHouses[player];
        Debug.assert(selectedHouses.length > 0);

        for each(var house:HouseG in selectedHouses)
        {
            if (target == house)
            {
                continue;
            }

            _managerSoldiers.generateSoldiers(house, target, house.soldierCount / 2);
        }

        clearHousesSelection(player);
    }

    public function onPlayerSelectHouse(player:IPlayerInfo, value:HouseG):void
    {
        var selectedHouses:Array = _selectedHouses[player];

        value.isSelect = true;

        Debug.assert(selectedHouses.indexOf(value) == ConstantsBase.INDEX_NONE);

        selectedHouses.push(value);

        _selectedHouses[player] = selectedHouses;

        _stateGame.update(EControllerUpdate.ECU_HOUSE_SELECTION_CHANGED);
    }

    public function clearHousesSelection(player:IPlayerInfo):void
    {
        var selectedHouses:Array = _selectedHouses[player];

        for each(var house:HouseG in selectedHouses)
        {
            house.isSelect = false;
        }

        _selectedHouses[player] = [];

        _stateGame.update(EControllerUpdate.ECU_HOUSE_SELECTION_CHANGED);
    }

    public function isAnyHouseSelected(player:IPlayerInfo):Boolean
    {
        return  _selectedHouses[player].length > 0;
    }

    public function onHouseOwnerChanged():void
    {
        //TODO:implement

//        var needFinished:Boolean = true;

//        for each(var house:HouseG in _houses)
//        {
//            if (house.ownerType != EHouseOwner.EHO_PLAYER)
//            {
//                needFinished = false;
//                break;
//            }
//        }

//        if (needFinished)
//        {
//            onGameEnd();
//        }
    }

    //TODO: remove and use base version when complete server side
    protected override function onGameEnd():void
    {
        _isFinished = true;

        GameInfo.instance.managerStates.currentState.update(EControllerUpdateBase.ECUT_GAME_FINISHED);

        {//get level manually because current level possible deserialize from data and not contains in manager branches
            var level:ILevelInfo = GameInfoBase.instance.managerLevels.getLevel(_currentLevelBase.id);
            level.complete = true;
        }
    }

    public override function cleanup():void
    {
        _managerPath.cleanup();
        _managerSoldiers.cleanup();

        for each(var house:IDisposable in _houses)
        {
            house.cleanup();
        }

        super.cleanup();
    }
}
}
