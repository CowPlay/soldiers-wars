/**
 * Created with IntelliJ IDEA.
 * User: Evgenyi
 * Date: 19.10.13
 * Time: 22:10
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.popups.militaryAcademy
{
import controls.IControl;
import controls.IControlButton;
import controls.IControlScene;
import controls.implementations.ControlPopupBase;
import controls.implementations.buttons.ControlButtonBase;
import controls.implementations.buttons.ControlButtonWithLabelsBase;

import flash.events.MouseEvent;
import flash.geom.Point;

import soldiers.controllers.EPopupType;

public class ControlPopupMilitaryAcademy extends ControlPopupBase
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
        return EPopupType.EPT_VILLAGE_HOUSE_MILITARY_ACADEMY;
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

        var buttonClose:IControl = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonClose);
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

        var item0:IControl = new ControlPopupMilitaryAcademyItem(sceneOwner);
        _sourceViewTyped.addChild(item0.sourceView);
        _items.push(item0);

        var item1:IControl = new ControlPopupMilitaryAcademyItem(sceneOwner);
        _sourceViewTyped.addChild(item1.sourceView);
        _items.push(item1);

        var item2:IControl = new ControlPopupMilitaryAcademyItem(sceneOwner);
        _sourceViewTyped.addChild(item2.sourceView);
        _items.push(item2);

        var item3:IControl = new ControlPopupMilitaryAcademyItem(sceneOwner);
        _sourceViewTyped.addChild(item3.sourceView);
        _items.push(item3);

    }

    public override function placeViews():void
    {
        super.placeViews();

        var itemStandard:IControl = _items[0];

        var startPosition:Point = new Point(_sourceViewTyped.width / 7 - itemStandard.sourceView.width / 2,
                _sourceViewTyped.height / 2 - itemStandard.sourceView.height / 12);

        for each(var item:IControl in _items)
        {
            item.placeViews();

            item.sourceView.x = startPosition.x;
            item.sourceView.y = startPosition.y;

            startPosition.x += item.sourceView.width + 20;
        }
    }

    public override function cleanup():void
    {
        _buttonImprove.cleanup();
        _buttonImprove = null;

        _buttonTabMerlin.cleanup();
        _buttonTabMerlin = null;

        _buttonTabTavern.cleanup();
        _buttonTabTavern = null;

        _buttonTabUniversityMM.cleanup();
        _buttonTabUniversityMM = null;

        for each(var item:IControl in _items)
        {
            item.cleanup();
            item = null;
        }

        _items = null;

        _sourceViewTyped = null;

        super.cleanup();
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
