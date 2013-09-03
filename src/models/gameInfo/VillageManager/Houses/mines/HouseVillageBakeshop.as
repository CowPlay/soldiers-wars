/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/4/13
 * Time: 1:51 PM
 * To change this template use File | Settings | File Templates.
 */
package models.gameInfo.VillageManager.Houses.mines
{
import core.Debug;

import flash.utils.Timer;

import models.gameInfo.GameInfo;

import models.gameInfo.VillageManager.Houses.*;
import models.gameInfo.VillageManager.Houses.base.EHouseVillageState;
import models.gameInfo.VillageManager.Houses.base.EHouseVillageType;
import models.gameInfo.VillageManager.Houses.base.HouseVillageBase;

public class HouseVillageBakeshop extends HouseVillageBase
{
    /*
     * Fields
     */

    private var _timer:Timer;

    /*
     * Properties
     */

    public override function get type():EHouseVillageType
    {
        return EHouseVillageType.EHVT_BAKESHOP;
    }


    /*
     * Methods
     */

    //! Default constructor
    public function HouseVillageBakeshop(state:EHouseVillageState, level:int)
    {
        super(state, level);

        _timer = new Timer(0);
    }

    protected override function canBuild():Boolean
    {
        return GameInfo.Instance.moneyManager.moneyGems > 5;
    }
}
}
