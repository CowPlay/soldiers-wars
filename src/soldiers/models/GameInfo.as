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
import models.implementations.viewController.ManagerViewControllerBase;
import models.interfaces.IManagerGame;
import models.interfaces.levels.ILevelContainer;
import models.interfaces.players.IPlayerInfo;
import models.interfaces.remote.IResponse;

import soldiers.controllers.ESceneType;
import soldiers.controllers.scenes.game.ControlSceneGame;
import soldiers.controllers.scenes.village.ControlSceneVillage;
import soldiers.models.data.LevelInfo;
import soldiers.models.game.ManagerGameSoldiers;
import soldiers.models.proxy.ManagerProxy;
import soldiers.models.remote.ManagerRemoteStub;
import soldiers.models.string.ManagerString;
import soldiers.models.village.ManagerVillage;

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

    private var _managerVillage:ManagerVillage;
    private var _managerGameSoldiers:ManagerGameSoldiers;

    /*
     * Properties
     */

    public function get managerVillage():ManagerVillage
    {
        return _managerVillage;
    }

    public function get managerGameSoldiers():ManagerGameSoldiers
    {
        return _managerGameSoldiers;
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
        _managerViewController = new ManagerViewControllerBase();
        _managerString = new ManagerString(_managerSocial);

        _managerLevels = new ManagerLevelsBase(LevelInfo);
        _managerLevels.deserialize(_managerProxy.getLevelsData(null));

        _managerResources = new ManagerResourceBase();

        _managerVillage = new ManagerVillage();
        _managerVillage.deserialize(managerProxySoldiers.getHousesVillageData(null));

        {//register scenes

            _managerViewController.registerScene(ESceneType.EST_GAME, ControlSceneGame);
            _managerViewController.registerScene(ESceneType.EST_VILLAGE, ControlSceneVillage);
        }

        super.onInitSocialComplete();
    }

    protected override function onRemoteGameInitComplete(response:IResponse):void
    {
        GameInfo.instance.managerViewController.setScene(ESceneType.EST_VILLAGE);
    }

    public function startStubGame():void
    {
        var player0:IPlayerInfo = new PlayerInfoBase();
        var player1:IPlayerInfo = new PlayerInfoBase();

        var container:ILevelContainer = GameInfo.instance.managerLevels.items[0];

        var managerGame:ManagerGameSoldiers = new ManagerGameSoldiers(container.items[0], player0, player1);

        GameInfo.instance.onGameStart(managerGame);

        managerGame.currentLevel.houses[0].owner = player0;
        managerGame.currentLevel.houses[1].owner = player1;

        GameInfo.instance.managerViewController.setScene(ESceneType.EST_GAME);
    }

    public override function onGameStart(value:IManagerGame):void
    {
        _managerGameSoldiers = value as ManagerGameSoldiers;
        super.onGameStart(value);
    }

}
}
