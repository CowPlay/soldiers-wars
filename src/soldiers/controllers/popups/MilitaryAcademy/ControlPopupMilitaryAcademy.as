/**
 * Created with IntelliJ IDEA.
 * User: Evgenyi
 * Date: 19.10.13
 * Time: 22:10
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.popups.MilitaryAcademy
{
import controls.IControl;
import controls.IControlButton;
import controls.IControlScene;
import controls.implementations.buttons.ControlButtonBase;
import controls.implementations.buttons.ControlButtonWithLabelsBase;

import flash.events.MouseEvent;

import soldiers.controllers.EPopupType;

import soldiers.controllers.popups.houses.base.ControlPopupHouse;

public class ControlPopupMilitaryAcademy extends ControlPopupHouse
{
    /*
     *Fields
     */
    private var _sourceViewTyped:gPopupMilitaryAcademy;

    private var _buttonImprove:IControlButton;

    private var _buttonTabMerlin:IControlButton;
    private var _buttonTabTavern:IControlButton;
    private var _buttonTabUniversityMM:IControlButton;

    private var _items:Array;


    /*
     *Properties
     */
    public override function get type():String
    {
        return EPopupType.EPT_VILLAGE_HOUSE_MILITARYACADEMY;
    }


    /*
     *Methods
     */
    public function ControlPopupMilitaryAcademy(sceneOwner:IControlScene)
    {
        super(sceneOwner);
        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gPopupMilitaryAcademy();
        setSourceView(_sourceViewTyped);

        var buttonClose:IControl = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonClose)
        setButtonClose(buttonClose);

        _buttonImprove = new ControlButtonWithLabelsBase(sceneOwner, _sourceViewTyped.buttonImprove);
        _buttonImprove.actionDelegate = this;

        _buttonTabMerlin = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonTabMerlin);
        _buttonTabMerlin.actionDelegate = this;

        _buttonTabTavern = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonTabTavern);
        _buttonTabTavern.actionDelegate = this;

        _buttonTabUniversityMM = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonTabUniversityMM);
        _buttonTabUniversityMM.actionDelegate = this;

        _items = [];

        var item0:ControlPopupMilitaryAcademyItem = new ControlPopupMilitaryAcademyItem(sceneOwner);
        _sourceViewTyped.itemsView.placeholder.addChild(item0.sourceView);
        _items.push(item0);

        var item1:ControlPopupMilitaryAcademyItem = new ControlPopupMilitaryAcademyItem(sceneOwner);
        _sourceViewTyped.itemsView.placeholder.addChild(item1.sourceView);
        _items.push(item1);

        var item2:ControlPopupMilitaryAcademyItem = new ControlPopupMilitaryAcademyItem(sceneOwner);
        _sourceViewTyped.itemsView.placeholder.addChild(item2.sourceView);
        _items.push(item2);

        var item3:ControlPopupMilitaryAcademyItem = new ControlPopupMilitaryAcademyItem(sceneOwner);
        _sourceViewTyped.itemsView.placeholder.addChild(item3.sourceView);
        _items.push(item3);

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
                case _buttonImprove:
                {
                    result = true;
                    break;
                }
                case _buttonTabMerlin:
                {
                    result = true;
                    break;
                }
                case _buttonTabTavern:
                {
                    result = true;
                    break;
                }
                case _buttonTabUniversityMM:
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


}

}
