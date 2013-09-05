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
import core.models.GameInfo;
import models.managerVillage.VillageManager;

public class GameInfoSoldiers extends GameInfo
{
    /*
     * Static fields
     */

    private static var _instanceTyped:GameInfoSoldiers;

    /*
     * Static methods
     */

    public static function initGameInfoSoldiers():void
    {
        Debug.assert(_instance == null, "GameInfoSoldiers already initialized.");
        Debug.assert(_instanceTyped == null, "GameInfoSoldiers already initialized.");

        _instanceTyped = new GameInfoSoldiers();
        _instance = _instanceTyped;
    }

    public static function get Instance():GameInfoSoldiers
    {
        return _instanceTyped;
    }

    /*
     * Fields
     */

    private var _villageManager:VillageManager;

    /*
     * Properties
     */

    public function get villageManager():VillageManager
    {
        return _villageManager;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function GameInfoSoldiers()
    {
        Debug.assert(_instance == null, "Class is singleton.");
        Debug.assert(_instanceTyped == null, "Class is singleton.");
    }

    protected override function init():void
    {
        super.init();

        _villageManager = new VillageManager();
    }
}
}
