/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/8/13
 * Time: 9:51 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.popups.houses.bakery
{
import controllers.implementations.Controller;

import views.EControllerUpdateBase;
import views.IView;

import flash.events.MouseEvent;

import soldiers.GameInfo;
import soldiers.models.housesVillage.bakery.HouseLevelInfoVBakery;
import soldiers.models.housesVillage.bakery.HouseVBakery;
import soldiers.models.housesVillage.base.EHouseTypeV;
import soldiers.views.popups.houses.bakery.ViewPopupBakeryItem;

public class ControllerPopupBakeryItem extends Controller
{
    /*
     * Fields
     */
    private var _entry:HouseLevelInfoVBakery;

    private var _view:ViewPopupBakeryItem;
    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerPopupBakeryItem(entry:HouseLevelInfoVBakery)
    {
        _view = new ViewPopupBakeryItem(this);
        super(_view);

        _entry = entry;
        _entry.controller = this;

        init();
    }

    private function init():void
    {
        _view.buttonBuild.enabled = _entry.isAvailable;
        _view.iconLock.visible = !_entry.isAvailable;

        _view.labelCount.text = _entry.count.toString();
        _view.labelTimer.text = _entry.time.toString();
    }

    public override function update(type:String):void
    {
        switch (type)
        {
            case EControllerUpdateBase.ECUT_ENTRY_UPDATED:
            {
                _view.labelTimer.text = _entry.timeLeft.toString();

                _view.iconLock.visible = !_entry.isAvailable;

                _view.buttonBuild.enabled = _entry.timeLeft == _entry.time ? _entry.isAvailable : _entry.timeLeft == 0;

                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }
    }

    /*
     * IActionDelegate
     */
    public override function onViewClicked(view:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewClicked(view, e);

        if (!result)
        {
            switch (view)
            {
                case _view.buttonBuild:
                {
                    var houseBakery:HouseVBakery = GameInfo.instance.managerHousesVillage.getHouseByType(EHouseTypeV.EHTV_BAKERY) as HouseVBakery;

                    houseBakery.onBuild(_entry);

                    _view.buttonBuild.enabled = false;

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


    override public function cleanup():void
    {
        _entry.controller = null;
        _entry = null;

        _view.cleanup();

        super.cleanup();
    }
}
}
