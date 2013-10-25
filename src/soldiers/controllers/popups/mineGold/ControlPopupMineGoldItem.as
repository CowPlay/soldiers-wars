/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 22.10.13
 * Time: 14:08
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.popups.mineGold
{
import controls.EControlUpdateTypeBase;
import controls.IControl;
import controls.IControlButton;
import controls.IControlScene;
import controls.implementations.ControlPopupBase;
import controls.implementations.buttons.ControlButtonWithLabelsBase;

import flash.events.MouseEvent;

import soldiers.models.GameInfo;
import soldiers.models.housesVillage.base.EHouseTypeV;

import soldiers.models.housesVillage.mineGold.HouseLevelInfoVMineGold;
import soldiers.models.housesVillage.mineGold.HouseVMineGold;

public class ControlPopupMineGoldItem extends ControlPopupBase
{
    /*
     *Fields
     */
    private var _entry:HouseLevelInfoVMineGold;

    private var _sourceViewTyped:gPopupMineGoldItem;

    private var _buttonBuild:IControlButton;

    /*
     *Properties
     */

    /*
     *Methods
     */
    public function ControlPopupMineGoldItem(sceneOwner:IControlScene, entry:HouseLevelInfoVMineGold)
    {
        super(sceneOwner);

        Debug.assert(entry != null);

        _entry = entry;
        _entry.view = this;

        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gPopupMineGoldItem();
        setSourceView(_sourceViewTyped);

        _buttonBuild = new ControlButtonWithLabelsBase(sceneOwner, _sourceViewTyped.buttonBuild);
        _buttonBuild.actionDelegate = this;
        _buttonBuild.enabled = _entry.isAvailable;

        _sourceViewTyped.labelCount.text = _entry.count.toString();
        _sourceViewTyped.labelTimer.text = _entry.time.toString();

        _sourceViewTyped.iconLock.visible = !_entry.isAvailable;
    }

    /*
     * IActionDelegate
     */
    public override function onControlMouseClick(target:IControl, e:MouseEvent):Boolean
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
            case EControlUpdateTypeBase.ECUT_ENTRY_UPDATED:
            {
                _sourceViewTyped.labelTimer.text = _entry.timeLeft.toString();

                if (_entry.timeLeft == 0)
                {
                    _buttonBuild.enabled = true;
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

}
}
