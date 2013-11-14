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

import soldiers.models.housesGame.base.HouseG;
import soldiers.views.game.houses.ViewHouseG;

public class ControllerHouseG extends Controller
{
    /*
     * Fields
     */
    private var _entry:HouseG;
    private var _view:ViewHouseG;

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
}
}
