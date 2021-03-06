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

import flash.utils.Dictionary;

import models.implementations.game.ManagerGameBase;
import models.interfaces.players.IPlayerInfo;

import soldiers.GameInfo;
import soldiers.controllers.EControllerUpdate;
import soldiers.models.game.decor.Decor;
import soldiers.models.game.managerAi.ManagerAi;
import soldiers.models.game.managerPath.ManagerPath;
import soldiers.models.game.managerProgress.ManagerProgress;
import soldiers.models.game.managerSoldiers.ManagerSoldiers;
import soldiers.models.game.soldiers.SoldierInfo;
import soldiers.models.housesGame.barracks.HouseGBarracks;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.housesGame.base.HouseG;
import soldiers.models.levels.LevelInfo;

import utils.UtilsArray;

import views.EControllerUpdateBase;

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
    private var _managerProgress:ManagerProgress;
    private var _managerAi:ManagerAi;

    //[ISerializable]
    private var _houses:Array;
    private var _decor:Array;

    //key - house, value - array other houses by distances
    private var _housesByDistances:Dictionary;

    /*
     * Properties
     */


    public function get decor():Array
    {
        return _decor;
    }

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
     * Events
     */

    public function onWaveEnemyDied():void
    {
        _managerAi.onWaveEnemyDied();
    }

    public function onSoldierMoveComplete(soldier:SoldierInfo):void
    {
        if (soldier.houseOwnerPlayer != soldier.houseTarget.owner)
        {
            soldier.houseTarget.soldierCount--;

            if (soldier.houseTarget.soldierCount == -1)
            {
                soldier.houseTarget.owner = soldier.houseOwnerPlayer;
                soldier.houseTarget.soldierCount = 1;
            }
        }
        else
        {
            soldier.houseTarget.soldierCount++;
        }

        if (soldier.isLastOnWave && soldier.houseOwnerPlayer == _gameOwnerOpponent)
        {
            onWaveEnemyDied();
        }

        _managerSoldiers.removeSoldier(soldier);
    }

    public function onHouseOwnerChanged():void
    {
        var isPlayerLose:Boolean = true;

        for each(var house:HouseG in _houses)
        {
            if (house.ownerType == EHouseOwner.EHO_PLAYER)
            {
                isPlayerLose = false;
                break;
            }
        }

        if (isPlayerLose)
        {
            onGameEnd(false);
        }
        else
        {
            _managerProgress.onHouseOwnerChanged();
        }
    }

    public function onTarget1Complete():void
    {
        onGameEnd();
    }

    public override function onGameStart():void
    {
        super.onGameStart();

        _managerAi.onGameStart();

        for each(var house:HouseG in _houses)
        {
            house.onGameStart();
        }

        _managerProgress.onGameStart();
    }

    public function onPlayerLose():void
    {
        onGameEnd(false);
    }

    //TODO: remove and use base version when complete server side
    protected override function onGameEnd(isPlayerWin:Boolean = true):void
    {
        _isFinished = true;

        _managerAi.onGameEnd();

        _managerProgress.onGameEnd();

        GameInfo.instance.managerStates.currentState.update(EControllerUpdateBase.ECUT_GAME_FINISHED);

        {//get level manually because current level possible deserialize from data and not contains in manager branches
            var level:LevelInfo = GameInfoBase.instance.managerLevels.getLevel(_currentLevelBase.id) as LevelInfo;
            level.complete = true;

            if (isPlayerWin)
            {
                var starsCount:uint = 0;

                starsCount = level.target1Complete ? starsCount + 1 : starsCount;
                starsCount = level.target2Complete ? starsCount + 1 : starsCount;
                starsCount = level.target3Complete ? starsCount + 1 : starsCount;

                level.starsCount = starsCount;
            }
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
            if (target == house || house.soldierCount == 0)
            {
                continue;
            }

            var soldiersCount:int = Math.max(1, house.soldierCount / 2);

            _managerSoldiers.generateSoldiers(house, target, soldiersCount);

            if (player == this._gameOwner)
            {
                _managerAi.onWavePlayerGenerate(target);
            }
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

        if (player == _gameOwner)
        {
            _stateGame.update(EControllerUpdate.ECU_HOUSE_SELECTION);
        }
    }

    public function onPlayerDeselectHouse(player:IPlayerInfo, value:HouseG):void
    {
        var selectedHouses:Array = _selectedHouses[player];

        value.isSelect = false;

        UtilsArray.removeValue(selectedHouses, value);

        _selectedHouses[player] = selectedHouses;

        if (player == _gameOwner)
        {
            _stateGame.update(EControllerUpdate.ECU_HOUSE_SELECTION);
        }
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
        _managerPath = new ManagerPath(currentLevel.gridSize, this);
        _managerSoldiers = new ManagerSoldiers(this);
        _managerProgress = new ManagerProgress(this);

        _selectedHouses = new Dictionary(true);

        _selectedHouses[_gameOwner] = [];
        _selectedHouses[_gameOwnerOpponent] = [];

        initHouses();
        initFoundations();
        initDecor();

        _managerPath.generateLevelPaths();

        initHousesByDistances();

        _managerAi = new ManagerAi(this);
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
                case EHouseOwner.EHO_NEUTRAL:
                {
                    //do nothing
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

    private function initFoundations():void
    {
        for each(var house:HouseG in _houses)
        {
            var foundationWidthHalf:int = house.houseConfig.foundationSize.x / 2;
            var foundationHeightHalf:int = house.houseConfig.foundationSize.y / 2;

            var rowFrom:int = house.positionCurrent.y - foundationHeightHalf;
            var rowTo:int = house.positionCurrent.y + foundationHeightHalf;

            var columnFrom:int = house.positionCurrent.x - foundationWidthHalf;
            var columnTo:int = house.positionCurrent.x + foundationWidthHalf;

            _managerPath.makeTraversable(rowFrom, rowTo, columnFrom, columnTo, false);
        }
    }

    private function initDecor():void
    {
        _decor = [];

        for each(var decorData:Object in _currentLevel.decorData)
        {
            var decor:Decor = new Decor();
            decor.deserialize(decorData);
            _decor.push(decor);

            var decorWidthHalf:int = decor.size.x / 2;
            var decorHeightHalf:int = decor.size.y / 2;

            var rowFrom:int = decor.position.y - decorHeightHalf;
            var rowTo:int = decor.position.y + decorHeightHalf;

            var columnFrom:int = decor.position.x - decorWidthHalf;
            var columnTo:int = decor.position.x + decorWidthHalf;

            _managerPath.makeTraversable(rowFrom, rowTo, columnFrom, columnTo, false);
        }
    }

    private function initHousesByDistances():void
    {
        _housesByDistances = new Dictionary(true);

        var propertyDistance:String = "distance";
        var propertyHouse:String = "house";

        for each(var target:HouseG in _houses)
        {
            var housesInfo:Array = [];

            for each(var otherHouse:HouseG in _houses)
            {
                if (target == otherHouse)
                {
                    continue;
                }

                var distance:int = _managerPath.getMinPathDistance(target, otherHouse);

                var distanceInfo:Object = {};

                distanceInfo[propertyDistance] = distance;
                distanceInfo[propertyHouse] = otherHouse;

                housesInfo.push(distanceInfo);
            }

            housesInfo.sortOn(propertyDistance, Array.NUMERIC);

            var houses:Array = [];

            for each(var houseInfo:Object in housesInfo)
            {
                houses.push(houseInfo[propertyHouse]);
            }

            _housesByDistances[target] = houses;
        }
    }


    public function clearHousesSelection(player:IPlayerInfo):void
    {
        var selectedHouses:Array = _selectedHouses[player];

        for each(var house:HouseG in selectedHouses)
        {
            house.isSelect = false;
        }

        _selectedHouses[player] = [];

        if (player == _gameOwner)
        {
            _stateGame.update(EControllerUpdate.ECU_HOUSE_SELECTION);
        }
    }

    public function isAnyHouseSelected(player:IPlayerInfo):Boolean
    {
        return  _selectedHouses[player].length > 0;
    }


    //! Returns nearest house with specify type. If types = [], returns house with any type
    public function getNearestHouse(target:HouseG, types:Array):HouseG
    {
        var result:HouseG = null;

        var otherHouses:Array = _housesByDistances[target];

        for each (var house:HouseG in otherHouses)
        {
            if (types.length > 0 && types.indexOf(house.ownerType) == ConstantsBase.INDEX_NONE)
            {
                continue;
            }

            result = house;
            break;
        }

        return result;
    }

    //! Returns nearest house with specify type. If types = [], returns house with any type
    public function getHousesByDistance(target:HouseG, types:Array):Array
    {
        var result:Array = [];

        var otherHouses:Array = _housesByDistances[target];

        for each (var house:HouseG in otherHouses)
        {
            if (types.length > 0 && types.indexOf(house.ownerType) == ConstantsBase.INDEX_NONE)
            {
                continue;
            }

            result.push(house);
        }

        return result;
    }

    public override function cleanup():void
    {
        _managerPath.cleanup();
        _managerSoldiers.cleanup();
        _managerAi.cleanup();

        for each(var house:IDisposable in _houses)
        {
            house.cleanup();
        }

        super.cleanup();
    }
}
}
