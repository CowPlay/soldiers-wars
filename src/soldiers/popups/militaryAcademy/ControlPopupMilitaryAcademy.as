/**
 * Created with IntelliJ IDEA.
 * User: Evgenyi
 * Date: 19.10.13
 * Time: 22:10
 * To change this template use File | Settings | File Templates.
 */
package soldiers.popups.militaryAcademy
{
import controls.IView;
import controls.IViewButton;
import controls.implementations.ViewPopup;
import controls.implementations.buttons.ViewButton;
import controls.implementations.buttons.ViewButtonLabeled;

import flash.events.MouseEvent;
import flash.geom.Point;

import models.interfaces.states.IState;

import soldiers.popups.EPopupType;

public class ControlPopupMilitaryAcademy extends ViewPopup
{
    /*
     *Fields
     */
    private var _sourceView:gPopupMilitaryAcademy;

    private var _buttonImprove:IViewButton;

    private var _buttonTabMerlin:IViewButton;
    private var _buttonTabTavern:IViewButton;
    private var _buttonTabUniversityMM:IViewButton;

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
    public function ControlPopupMilitaryAcademy()
    {
        _sourceView = new gPopupMilitaryAcademy();
        super(_sourceView);

        init();
    }

    private function init():void
    {
        var buttonClose:IView = new ViewButton(this, _sourceView.buttonClose);
        setButtonClose(buttonClose);

        _buttonImprove = new ViewButtonLabeled(this, _sourceView.buttonImprove);
//        _buttonImprove.actionDelegate = this;

        _buttonTabMerlin = new ViewButton(this, _sourceView.buttonTabMerlin);
//        _buttonTabMerlin.actionDelegate = this;

        _buttonTabTavern = new ViewButton(this, _sourceView.buttonTabTavern);
//        _buttonTabTavern.actionDelegate = this;

        _buttonTabUniversityMM = new ViewButton(this, _sourceView.buttonTabUniversityMM);
//        _buttonTabUniversityMM.actionDelegate = this;

        _items = [];

        var item0:IView = new ControlPopupMilitaryAcademyItem(this);
        _sourceView.addChild(item0.sourceView);
        _items.push(item0);

        var item1:IView = new ControlPopupMilitaryAcademyItem(this);
        _sourceView.addChild(item1.sourceView);
        _items.push(item1);

        var item2:IView = new ControlPopupMilitaryAcademyItem(this);
        _sourceView.addChild(item2.sourceView);
        _items.push(item2);

        var item3:IView = new ControlPopupMilitaryAcademyItem(this);
        _sourceView.addChild(item3.sourceView);
        _items.push(item3);

    }

    public override function placeViews():void
    {
        super.placeViews();

        var itemStandard:IView = _items[0];

        var startPosition:Point = new Point(_sourceView.width / 7 - itemStandard.sourceView.width / 2,
                _sourceView.height / 2 - itemStandard.sourceView.height / 12);

        for each(var item:IView in _items)
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

        for each(var item:IView in _items)
        {
            item.cleanup();
            item = null;
        }

        _items = null;

        _sourceView = null;

        super.cleanup();
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
