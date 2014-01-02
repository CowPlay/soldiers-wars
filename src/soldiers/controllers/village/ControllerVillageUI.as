/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/1/13
 * Time: 1:08 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.village
{
import controllers.IController;
import controllers.implementations.Controller;

import views.IView;

import flash.events.MouseEvent;

import soldiers.controllers.village.ui.ControllerAddFriend;
import soldiers.GameInfo;
import soldiers.popups.EPopupType;
import soldiers.views.village.*;

public class ControllerVillageUI extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewVillageUI;


    private var _controllerAddFriend:IController;


    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerVillageUI()
    {
        _view = new ViewVillageUI(this);
        super(_view);

        init();
    }

    private function init():void
    {

        _controllerAddFriend = new ControllerAddFriend();
    }





    /*
     * IActionDelegate
     */


    override public function onViewClicked(view:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewClicked(view, e);

        if (!result)
        {
            switch (view)
            {
                case _view.buttonSingleplayer:
                {
                    GameInfo.instance.managerStates.currentState.showPopup(EPopupType.EPT_VILLAGE_HOUSE_BAKERY);
//
//                    GameInfo.instance.startStubGame();
//
                    result = true;
                    break;
                }
                case _view.buttonMultiplayer:
                {
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

    /*
     * IDisposable
     */

//    public override function cleanup():void
//    {
//        _controlBottomStrip.cleanup();
//        _controlBottomStrip = null;
//
//        _controlBottom.cleanup();
//        _controlBottom = null;
//
//        _controlMultiplayer.cleanup();
//        _controlMultiplayer = null;
//
//        _controlSingleplayer.cleanup();
//        _controlSingleplayer = null;
//
//        _controlAddFriend.cleanup();
//        _controlAddFriend = null;
//
//        _sourceView = null;
//
//        super.cleanup();
//    }
}
}
