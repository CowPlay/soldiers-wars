/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/13/13
 * Time: 5:29 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game.houses
{
import controllers.implementations.Controller;

import controls.IView;

import flash.events.MouseEvent;

import soldiers.models.GameInfo;
import soldiers.models.game.ManagerGame;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;
import soldiers.views.game.houses.ViewHouseG;

public class ControllerHouseG extends Controller
{
    /*
     * Fields
     */
    private var _entry:HouseG;
    private var _view:ViewHouseG;

    private var _managerGame:ManagerGame;

    /*
     * Properties
     */


    public function get entry():HouseG
    {
        return _entry;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerHouseG(entry:HouseG)
    {
        _entry = entry;
        Debug.assert(_entry != null);

        _view = new ViewHouseG(this, entry);
        super(_view);

        init();
    }

    private function init():void
    {
        _managerGame = GameInfo.instance.managerGame;

    }

    public override function update(type:String):void
    {
        //TODO: implement
//        switch (type)
//        {
//            case EControllerUpdateBase.ECUT_ENTRY_UPDATED:
//            {
//                _labelSoldiers.text = _entry.soldierCount.toString();
//
//                _houseViewPlayer.visible = _entry.ownerType == EHouseOwner.EHO_PLAYER;
//                _houseViewEnemy.visible = !_houseViewPlayer.visible;
////                switch (_entry.ownerType)
////                {
////                    case EHouseOwner.EHO_PLAYER:
////                    {
////                        if (_entry.isSelect)
////                        {
////                            _auraPlayer.visible = true;
////                        }
////                        break;
////                    }
////                    default :
////                    {
////                        //do nothing
////                        break;
////                    }
////                }
//
//                break;
//            }
//            default :
//            {
//                Debug.assert(false);
//                break;
//            }
//        }
    }

    public override function onViewMouseOver(view:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewMouseOver(view, e);

        switch (view)
        {
            case _view:
            {
                if (entry.ownerType == EHouseOwner.EHO_PLAYER && _managerGame.isAnyHouseSelected(_managerGame.gameOwner) && !entry.isSelect)
                {
                    _managerGame.onPlayerSelectHouse(_managerGame.gameOwner, entry);
                }

                result = true;

                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }

        return result;
    }

    public override function onViewMouseDown(view:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewMouseDown(view, e);

        if (!result)
        {
            switch (view)
            {
                case _view:
                {
                    if (entry.ownerType == EHouseOwner.EHO_PLAYER)
                    {
                        _managerGame.onPlayerSelectHouse(_managerGame.gameOwner, entry);
                    }

                    result = true;

                    break;
                }
                default :
                {
                    Debug.assert(false);
                    break;
                }
            }
        }

        return result;
    }

    public override function onViewMouseUp(target:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewMouseUp(target, e);

        if (!result)
        {
            if (!result)
            {
                switch (view)
                {
                    case _view:
                    {
                        if (_managerGame.isAnyHouseSelected(_managerGame.gameOwner))
                        {
                            _managerGame.onPlayerGenerateSoldiers(_managerGame.gameOwner, entry);
                        }

                        result = true;
                        break;
                    }
                    default :
                    {
                        Debug.assert(false);
                        break;
                    }
                }
            }
        }

        return result;
    }

    //onViewMouseOut
    //        _auraPlayer.visible = false;
//        _auraEnemy.visible = false;

}
}
