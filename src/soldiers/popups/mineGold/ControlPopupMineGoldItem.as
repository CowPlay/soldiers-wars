/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 22.10.13
 * Time: 14:08
 * To change this template use File | Settings | File Templates.
 */
package soldiers.popups.mineGold
{
import views.EControllerUpdateBase;
import views.IView;
import views.IViewButton;
import views.implementations.ViewBase;
import controls.implementations.buttons.ViewButtonLabeled;

import flash.events.MouseEvent;

import soldiers.GameInfo;
import soldiers.models.housesVillage.base.EHouseTypeV;
import soldiers.models.housesVillage.mineGold.HouseLevelInfoVMineGold;
import soldiers.models.housesVillage.mineGold.HouseVMineGold;

public class ControlPopupMineGoldItem extends ViewBase
{
    /*
     *Fields
     */
    private var _entry:HouseLevelInfoVMineGold;

    private var _sourceView:gPopupMineGoldItem;

    private var _buttonBuild:IViewButton;

    /*
     *Properties
     */

    /*
     *Methods
     */
    public function ControlPopupMineGoldItem(parent:IView, entry:HouseLevelInfoVMineGold)
    {
        _sourceView = new gPopupMineGoldItem();
        super(parent, _sourceView);

        Debug.assert(entry != null);

        _entry = entry;
        _entry.controller = this;

        init();
    }

    private function init():void
    {
        _buttonBuild = new ViewButtonLabeled(this, _sourceView.buttonBuild);
//        _buttonBuild.actionDelegate = this;
        _buttonBuild.enabled = _entry.isAvailable;

        _sourceView.labelCount.text = _entry.count.toString();
        _sourceView.labelTimer.text = _entry.time.toString();

        _sourceView.iconLock.visible = !_entry.isAvailable;
    }

    /*
     * IActionDelegate
     */
    public override function onControlMouseClick(target:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onControlMouseClick(target, e);

        if (!result)
        {
            switch (target)
            {
                case _buttonBuild:
                {
                    var houseMineGold:HouseVMineGold = GameInfo.instance.managerHousesVillage.getHouseByType(EHouseTypeV.EHTV_MINE_GOLD) as HouseVMineGold;

                    houseMineGold.onBuildConfig(_entry);

                    _buttonBuild.enabled = false;

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
     * IControl
     */
    public override function update(type:String = ""):void
    {
        switch (type)
        {
            case EControllerUpdateBase.ECUT_ENTRY_UPDATED:
            {
                _sourceView.labelTimer.text = _entry.timeLeft.toString();

                _sourceView.iconLock.visible = !_entry.isAvailable;

                if (_entry.timeLeft == _entry.time)
                {
                    _buttonBuild.enabled = _entry.isAvailable;
                }
                else
                {
                    _buttonBuild.enabled = _entry.timeLeft == 0;
                }
                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }
    }

    public override function placeViews():void
    {
        super.placeViews();
    }

    public override function cleanup():void
    {
        _buttonBuild.cleanup();
        _buttonBuild = null;

        _sourceView = null;

        super.cleanup();
    }
}
}
