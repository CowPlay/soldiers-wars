/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/13/13
 * Time: 5:00 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game.soldiers
{
import controllers.implementations.Controller;

import soldiers.models.GameInfo;
import soldiers.models.game.soldiers.ESoldierState;
import soldiers.models.game.soldiers.SoldierInfo;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.views.game.soldiers.ViewSoldier;

public class ControllerSoldier extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewSoldier;

    private var _entry:SoldierInfo;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerSoldier(entry:SoldierInfo)
    {
        Debug.assert(entry != null);
        _entry = entry;

        _view = new ViewSoldier(this, _entry);
        super(_view);

        init();
    }

    private function init():void
    {
        _entry.state = ESoldierState.ESS_IN_MOVE;
        _view.moveToTarget(onSoldierMoveComplete);
    }

    private function onSoldierMoveComplete():void
    {
        if (_entry.isCleanuped)
        {
//            trace("");
            //TODO:remove this hack
            return;
        }

        if (_entry.houseTarget.ownerType == EHouseOwner.EHO_NEUTRAL)
        {
            _entry.houseTarget.soldierCount++;
            _entry.houseTarget.owner = _entry.houseOwnerPlayer;
        }
        else if (_entry.houseOwnerPlayer != _entry.houseTarget.owner)
        {
            _entry.houseTarget.soldierCount--;

            if (_entry.houseTarget.soldierCount == 0)
            {
                _entry.houseTarget.owner = _entry.houseOwnerPlayer;
            }
        }
        else
        {
            _entry.houseTarget.soldierCount++;
        }

        GameInfo.instance.managerGame.managerSoldiers.removeSoldier(_entry);
    }

    public override function cleanup():void
    {
        //TODO:remove this hack
        if (isCleanuped)
            return;

        _entry = null;

        super.cleanup();
    }
}
}
