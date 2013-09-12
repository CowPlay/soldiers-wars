/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/5/13
 * Time: 8:59 AM
 * To change this template use File | Settings | File Templates.
 */
package models
{
import core.Debug;
import core.models.GameInfoBase;
import core.models.implementations.app.ManagerAppBase;
import core.models.implementations.currency.ManagerCurrencyBase;
import core.models.resources.LoaderPicture;

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

    public static function initGameInfo(onComplete:Function, onError:Function):void
    {
        Debug.assert(_instance == null, "GameInfoSoldiers already initialized.");
        Debug.assert(_instanceTyped == null, "GameInfoSoldiers already initialized.");

        _instanceTyped = new GameInfo(onComplete, onError);
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

    /*
     * Properties
     */

    public function get managerVillage():ManagerVillage
    {
        return _managerVillage;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function GameInfo(onComplete:Function, onError:Function)
    {
        Debug.assert(_instance == null, "Class is singleton.");
        Debug.assert(_instanceTyped == null, "Class is singleton.");

        init();

        super(onComplete, onError);
    }

    protected function init():void
    {
        _managerApp = new ManagerAppBase();
        _managerCurrency = new ManagerCurrencyBase();
        _managerViewController = new ManagerViewController();
        _managerString = new ManagerString();

        _loaderPicture = new LoaderPicture();

        _managerVillage = new ManagerVillage();
    }
}
}
