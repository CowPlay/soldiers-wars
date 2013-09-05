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
import core.models.managerApp.AppHelper;
import core.models.managerMoney.MoneyManager;
import core.models.resources.LoaderPicture;
import core.socialApi.managers.ISocialManager;
import core.socialApi.managers.SocialManagerFB;
import core.socialApi.managers.SocialManagerOffline;
import core.socialApi.managers.SocialManagerVK;

public class GameInfo
{
    /*
     * Singleton realization
     */

    protected static var _instance:GameInfo;

    public static function initGameInfo():void
    {
        Debug.assert(_instance == null, "GameInfo already initialized.");

        _instance = new GameInfo();
    }

    public static function get Instance():GameInfo
    {
        return _instance;
    }

    /*
     * Fields
     */

    private var _appHelper:AppHelper;

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

    //! Default constructor
    public function GameInfo()
    {
        Debug.assert(_instance == null, "Class is singleton.");

        init();
    }

    protected function init():void
    {
        _appHelper = new AppHelper();
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
            _socialManager = new SocialManagerOffline(onComplete, onError);
        }
    }
}
}
