/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/6/13
 * Time: 11:43 PM
 * To change this template use File | Settings | File Templates.
 */
package core.models
{
import core.Debug;
import core.models.resources.LoaderPicture;
import core.socialApi.ISocialManager;
import core.socialApi.SocialManagerFB;
import core.socialApi.SocialManagerVK;

import core.models.managerApp.AppHelper;
import core.models.managerMoney.MoneyManager;
import core.models.managerVillage.VillageManager;

public class GameInfo
{
    /*
     * Singleton realization
     */

    private static const _instance:GameInfo = new GameInfo();

    //! Default constructor
    public function GameInfo()
    {
        Debug.assert(!_instance, "Class is singleton.");

        init();
    }

    public static function get Instance():GameInfo
    {
        return _instance;
    }

    /*
     * Fields
     */

    private var _appHelper:AppHelper;
    //TODO: move to GameInfoSoldiers
    private var _villageManager:VillageManager;
    private var _moneyManager:MoneyManager;
    private var _socialManager:ISocialManager;
    private var _loaderPicture:LoaderPicture;


    //game
//    private var _currentGame:GameBase;
//    private var _houseManager:HouseManager;
//    private var _pathfinder:Pathfinder;
//    private var _soldierGenerator:SoldierGenerator;

    /*
     * Properties
     */

    public function get appHelper():AppHelper
    {
        return _appHelper;
    }

    public function get villageManager():VillageManager
    {
        return _villageManager;
    }

    public function get moneyManager():MoneyManager
    {
        return _moneyManager;
    }

    public function get socialManager():ISocialManager
    {
        return _socialManager;
    }

    public function get loaderPicture():LoaderPicture
    {
        return _loaderPicture;
    }


//
//    public function get currentGame():GameBase
//    {
//        return _currentGame;
//    }
//
//    public function get houseManager():HouseManager
//    {
//        return _houseManager;
//    }
//
//    public function get pathfinder():Pathfinder
//    {
//        return _pathfinder;
//    }
//
//    public function get soldierGenerator():SoldierGenerator
//    {
//        return _soldierGenerator;
//    }
//
//    public function didGameStart(value:GameBase):void
//    {
//        Debug.assert(value != null && _currentGame == null);
//
//        _currentGame = value;
//
//        _houseManager = new HouseManager();
//        _pathfinder = new Pathfinder();
//        _soldierGenerator = new SoldierGenerator();
//
//        _houseManager.initLevelHouses();
////        _pathfinder.generateLevelPaths();
//    }
//
//    public function didGameEnd():void
//    {
//        Debug.assert(_currentGame != null);
//
//        //TODO: implement
//        Debug.assert(false);
//    }

    /*
     * Methods
     */

    private function init():void
    {
        _appHelper = new AppHelper();
        _villageManager = new VillageManager();
        _moneyManager = new MoneyManager();
        _loaderPicture = new LoaderPicture();

    }

    public function initSocialManager(onComplete:Function, onError:Function):void
    {
        SOCIAL::VK
        {
            _socialManager = new SocialManagerVK(onComplete, onError);
        }

        SOCIAL::FACEBOOK
        {
            _socialManager = new SocialManagerFB(onComplete, onError);
        }

        SOCIAL::OK
        {
            _socialManager = null;//new OKMediator();
        }

        SOCIAL::MM
        {
            _socialManager = null;//new MMMediator();
        }

        SOCIAL::OFFLINE
        {
            _socialManager = null;//new VKMediator();
        }
    }


}
}
