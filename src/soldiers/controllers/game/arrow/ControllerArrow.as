/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/13/13
 * Time: 4:04 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game.arrow
{
import controllers.implementations.Controller;

import flash.events.MouseEvent;
import flash.geom.Point;

import soldiers.controllers.EControllerUpdate;
import soldiers.GameInfo;
import soldiers.models.housesGame.base.HouseG;
import soldiers.views.game.arrows.ViewArrow;

import utils.memory.UtilsMemory;

public class ControllerArrow extends Controller
{
    /*
     * Fields
     */
    private var _entry:HouseG;

    private var _view:ViewArrow;


    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerArrow(entry:HouseG, sizeLimit:Point)
    {
        _view = new ViewArrow(this, entry, sizeLimit);
        super(_view);

        _entry = entry;

        init();
    }

    private function init():void
    {
        UtilsMemory.registerEventListener(GameInfo.instance.managerApp.applicationStage, MouseEvent.MOUSE_MOVE, this, onMouseMove);

        _view.hide();
    }

    private function onMouseMove(e:MouseEvent):void
    {
        _view.updateArrowSize(e);
    }


    public override function update(type:String):void
    {
        switch (type)
        {
            case EControllerUpdate.ECU_HOUSE_SELECTION:
            {
                _entry.isSelect ? _view.show() : _view.hide();

                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }
    }

    public override function cleanup():void
    {
        UtilsMemory.unregisterEventListener(GameInfo.instance.managerApp.applicationStage, MouseEvent.MOUSE_MOVE, this, onMouseMove);

        super.cleanup();
    }
}
}
