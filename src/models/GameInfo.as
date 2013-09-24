/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/5/13
 * Time: 8:59 AM
 * To change this template use File | Settings | File Templates.
 */
package models
{
import flash.display.DisplayObjectContainer;
import flash.display.Stage;

import models.data.LevelInfo;
import models.game.ManagerGameSoldiers;
import models.game.managerHouses.ManagerHouses;
import models.implementations.app.ManagerAppBase;
import models.implementations.levels.ManagerLevelsBase;
import models.implementations.resources.ManagerResourceBase;
import models.interfaces.IManagerGame;
import models.string.ManagerString;
import models.viewController.ManagerViewController;
import models.village.ManagerVillage;

public class GameInfo extends GameInfoBase
{
    /*
     * Static fields
     */

    private static var _instanceTyped:GameInfo;

    /*
     * Static methods
     */

    public static function initGameInfo(stageValue:Stage, rootValue:DisplayObjectContainer):void
    {
        Debug.assert(_instance == null, "GameInfoSoldiers already initialized.");
        Debug.assert(_instanceTyped == null, "GameInfoSoldiers already initialized.");

        _instanceTyped = new GameInfo(stageValue, rootValue);
        _instance = _instanceTyped;
    }

    public static function get Instance():GameInfo
    {
        return _instanceTyped;
    }

    /*
     * Fields
     */

    private var _managerVillage:ManagerVillage;
    private var _managerGameSoldiers:ManagerGameSoldiers;
    private var _managerHouses:ManagerHouses;

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

    public function get managerHouses():ManagerHouses
    {
        return _managerHouses;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function GameInfo(stageValue:Stage, rootValue:DisplayObjectContainer)
    {
        super(stageValue, rootValue);

        init(stageValue, rootValue);
    }

    protected function init(stageValue:Stage, rootValue:DisplayObjectContainer):void
    {
//        _managerRemote = new ManagerRemote();
//        _managerPurchases = new ManagerPurchases();

        _managerApp = new ManagerAppBase(stageValue);
        _managerViewController = new ManagerViewController(stageValue, rootValue);
        _managerString = new ManagerString();

        _managerLevels = new ManagerLevelsBase();

        _managerResources = new ManagerResourceBase();
        _managerHouses = new ManagerHouses();
    }

    public override function run(onComplete:Function):void
    {
        deserializeLevels();

        super.run(onComplete);
    }

    public override function onGameStart(value:IManagerGame):void
    {
        _managerGameSoldiers = value as ManagerGameSoldiers;
        super.onGameStart(value);
    }

    /*
     * Serialization
     */

    private function deserializeLevels():void
    {

        var houseData:Object =
        {
            owner: "eho_player",
            type: "eht_barracks",
            level: 0,
            level_max: 5,
            position_x: 4,
            position_y: 4,
            position_exit_x: 1,
            position_exit_y: 1,
            soldiers: 10,
            soldiers_max: 20
        };

        var level0Data:Object =
        {
            number: 0,
            grid_width: 20,
            grid_height: 20,

            houses: [houseData]
        };

        var level0:LevelInfo = new LevelInfo();
        level0.deserialize(level0Data);

        _managerLevels.addLevel(level0);
    }


}
}
