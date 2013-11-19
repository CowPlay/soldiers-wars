/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/13/13
 * Time: 5:00 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game.soldiers
{
import com.greensock.TweenMax;

import controllers.implementations.Controller;

import controls.EControllerUpdateBase;

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
        _view.moveToTarget(onSoldierMoveComplete);

//        var paramsLastTween:Object =
//        {
//            onComplete: onSoldierMoveComplete
//        };
//
//        TweenMax.to(this, _entry.path.length * (1 / _entry.speed), paramsLastTween);
    }

    private function onSoldierMoveComplete():void
    {
        if (_entry.houseTarget.ownerType == EHouseOwner.EHO_NEUTRAL)
        {
            _entry.houseTarget.soldierCount++;
            _entry.houseTarget.owner = _entry.houseOwnerPlayer;
        }
        else if (_entry.houseOwnerPlayer != _entry.houseTarget.owner)
        {
            if (_entry.houseTarget.soldierCount == 0)
            {
                _entry.houseTarget.owner = _entry.houseOwnerPlayer;
                _entry.houseTarget.soldierCount = 1;
            }
            else
            {
                _entry.houseTarget.soldierCount--;

                if (_entry.houseTarget.soldierCount == 0)
                {
                    _entry.houseTarget.owner = _entry.houseOwnerPlayer;
                    _entry.houseTarget.soldierCount = 1;
                }
            }
        }
        else
        {
            _entry.houseTarget.soldierCount++;
        }

        _entry.houseTarget.controller.update(EControllerUpdateBase.ECUT_ENTRY_UPDATED);

        _entry.controller.view.source.parent.removeChild(_entry.controller.view.source);
        _entry.controller.cleanup();
    }

    public override function cleanup():void
    {
//        TweenMax.killTweensOf(this);

        super.cleanup();
    }
}
}
