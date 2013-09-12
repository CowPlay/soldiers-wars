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
import core.models.implementations.app.ManagerAppBase;
import core.models.implementations.currency.ManagerCurrencyBase;
import core.models.implementations.social.managers.SocialManagerFB;
import core.models.implementations.social.managers.SocialManagerOffline;
import core.models.implementations.social.managers.SocialManagerVK;
import core.models.interfaces.IManagerGame;
import core.models.interfaces.IManagerSocial;
import core.models.interfaces.IManagerString;
import core.models.interfaces.IManagerViewController;
import core.models.resources.LoaderPicture;

public class GameInfoBase
{
    /*
     * Singleton realization
     */

    protected static var _instance:GameInfoBase;

    public static function initGameInfoBase(onComplete:Function, onError:Function):void
    {
        Debug.assert(_instance == null, "GameInfo already initialized.");

        _instance = new GameInfoBase(onComplete, onError);
    }

    public static function get Instance():GameInfoBase
    {
        return _instance;
    }

    /*
     * Fields
     */

    protected var _managerApp:ManagerAppBase;

    protected var _managerCurrency:ManagerCurrencyBase;
    protected var _managerSocial:IManagerSocial;
    protected var _managerString:IManagerString;
    protected var _managerViewController:IManagerViewController;
    protected var _managerGame:IManagerGame;

    protected var _loaderPicture:LoaderPicture;

    /*
     * Properties
     */

    public function get managerApp():ManagerAppBase
    {
        return _managerApp;
    }

    public function get managerCurrency():ManagerCurrencyBase
    {
        return _managerCurrency;
    }

    public function get managerSocial():IManagerSocial
    {
        return _managerSocial;
    }

    public function get managerString():IManagerString
    {
        return _managerString;
    }

    public function get managerViewController():IManagerViewController
    {
        return _managerViewController;
    }

    public function get loaderPicture():LoaderPicture
    {
        return _loaderPicture;
    }

    public function get managerGame():IManagerGame
    {
        return _managerGame;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function GameInfoBase(onComplete:Function, onError:Function)
    {
        Debug.assert(_instance == null, "Class is singleton.");

        initSocialManager(onComplete, onError);
    }


    protected function initSocialManager(onComplete:Function, onError:Function):void
    {
        Debug.assert(_managerSocial == null, "Social manager already initialized.");

        SOCIAL::VK
        {
            _managerSocial = new SocialManagerVK(onComplete, onError);
        }

        SOCIAL::FACEBOOK
        {
            _managerSocial = new SocialManagerFB(onComplete, onError);
        }

        SOCIAL::OK
        {
            _managerSocial = null;//new OKMediator();
        }

        SOCIAL::MM
        {
            _managerSocial = null;//new MMMediator();
        }

        SOCIAL::OFFLINE
        {
            _managerSocial = new SocialManagerOffline(onComplete, onError);
        }
    }


    public function onGameStart(value:IManagerGame):void
    {
        Debug.assert(value != null);
        Debug.assert(_managerGame == null, "Game already started");

        _managerGame = value;
    }

    public function onGameEnd():void
    {
        Debug.assert(_managerGame != null, "Game already ended");

        _managerGame = null;
    }
}
}
