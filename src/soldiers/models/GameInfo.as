/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/5/13
 * Time: 8:59 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models
{
import flash.display.Stage;

import models.GameInfoBase;
import models.implementations.app.ManagerAppBase;
import models.implementations.levels.ManagerLevelsBase;
import models.implementations.players.PlayerInfoBase;
import models.implementations.resources.ManagerResourceBase;
import models.implementations.states.ManagerStatesBase;
import models.interfaces.IManagerGame;
import models.interfaces.levels.ILevelContainer;
import models.interfaces.players.IPlayerInfo;
import models.interfaces.remote.IResponse;

import soldiers.models.game.ManagerGame;
import soldiers.models.housesGame.ManagerHousesGame;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;
import soldiers.models.housesVillage.ManagerHousesVillage;
import soldiers.models.levels.LevelInfo;
import soldiers.models.proxy.ManagerProxy;
import soldiers.models.remote.ManagerRemoteStub;
import soldiers.models.string.ManagerString;
import soldiers.states.EStateType;
import soldiers.states.game.StateGame;
import soldiers.states.map.StateMap;
import soldiers.states.village.StateVillage;

public class GameInfo extends GameInfoBase
{
    /*
     * Static fields
     */

    private static var _instanceTyped:GameInfo;

    /*
     * Static methods
     */

    public static function run(stageValue:Stage):void
    {
        Debug.assert(_instance == null, "GameInfo already initialized.");
        Debug.assert(_instanceTyped == null, "GameInfo already initialized.");

        _instanceTyped = new GameInfo(stageValue);
        _instance = _instanceTyped;
    }

    public static function get instance():GameInfo
    {
        return _instanceTyped;
    }

    /*
     * Fields
     */

    private var _managerHousesVillage:ManagerHousesVillage;
    private var _managerHousesGame:ManagerHousesGame;
    private var _managerGame:ManagerGame;

    /*
     * Properties
     */

    public function get managerHousesVillage():ManagerHousesVillage
    {
        return _managerHousesVillage;
    }

    public function get managerHousesGame():ManagerHousesGame
    {
        return _managerHousesGame;
    }

    public function get managerGame():ManagerGame
    {
        return _managerGame;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function GameInfo(stageValue:Stage)
    {
        super(stageValue);

        initSocialManager();
    }

    protected override function onInitSocialComplete():void
    {
        var managerProxySoldiers:ManagerProxy = new ManagerProxy(_managerSocial);

        _managerProxy = managerProxySoldiers;
        _managerRemote = new ManagerRemoteStub("", _managerProxy);
        _managerApp = new ManagerAppBase(_stage);
        _managerStates = new ManagerStatesBase();
        _managerString = new ManagerString(_managerSocial);

        _managerLevels = new ManagerLevelsBase(LevelInfo);
        _managerLevels.deserialize(_managerProxy.getLevelsData(null));

        _managerResources = new ManagerResourceBase();

        _managerHousesVillage = new ManagerHousesVillage();
        _managerHousesVillage.deserialize(managerProxySoldiers.getHousesVillage(null));

        _managerHousesGame = new ManagerHousesGame();
        _managerHousesGame.deserialize(managerProxySoldiers.getHousesGame(null));

        {//register states

            _managerStates.registerState(EStateType.EST_GAME, StateGame);
            _managerStates.registerState(EStateType.EST_VILLAGE, StateVillage);
            _managerStates.registerState(EStateType.EST_GAME_MAP, StateMap);
        }

        super.onInitSocialComplete();
    }

    protected override function onRemoteGameInitComplete(response:IResponse):void
    {
        startStubGame();
    }

    public function startStubGame():void
    {
        var player0:IPlayerInfo = new PlayerInfoBase();
        var player1:IPlayerInfo = new PlayerInfoBase();

        var container:ILevelContainer = GameInfo.instance.managerLevels.items[0];

        var managerGame:ManagerGame = new ManagerGame(container.items[0], player0, player1);

        GameInfo.instance.onGameStart(managerGame);

        for each(var house:HouseG in managerGame.currentLevel.houses)
        {
            if (house.ownerTypeOnStart == EHouseOwner.EHO_ENEMY)
            {
                house.owner = player1;

            }
            else if (house.ownerTypeOnStart == EHouseOwner.EHO_PLAYER)
            {
                house.owner = player0;
            }
        }

        GameInfo.instance.managerStates.setState(EStateType.EST_GAME);
    }

    public override function onGameStart(value:IManagerGame):void
    {
        _managerGame = value as ManagerGame;
        super.onGameStart(value);
    }

}
}
