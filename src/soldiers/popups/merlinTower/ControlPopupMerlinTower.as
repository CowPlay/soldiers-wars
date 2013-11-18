/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 21.10.13
 * Time: 10:54
 * To change this template use File | Settings | File Templates.
 */
package soldiers.popups.merlinTower
{
import controls.IView;
import controls.IViewButton;
import controls.implementations.ViewPopup;
import controls.implementations.buttons.ViewButton;
import controls.implementations.buttons.ViewButtonLabeled;

import flash.events.MouseEvent;
import flash.geom.Point;

import soldiers.popups.EPopupType;

public class ControlPopupMerlinTower extends ViewPopup
{
    /*
     *Fields
     */
    private var _sourceView:gPopupMerlinTower;

    private var _buttonImprove:IViewButton;

    private var _buttonTabMilitaryAcademy:IViewButton;
    private var _buttonTabTavern:IViewButton;
    private var _buttonTabUniversityMM:IViewButton;

    private var _items:Array;
    /*
     *Properties
     */
    public override function get type():String
    {
        return EPopupType.EPT_VILLAGE_HOUSE_MERLIN_TOWER
    }

    /*
     *Methods
     */
    public function ControlPopupMerlinTower()
    {
        _sourceView = new gPopupMerlinTower();
        super(_sourceView);

        init();
    }

    private function init():void
    {
        var buttonClose:IView = new ViewButton(this, _sourceView.buttonClose);
        setButtonClose(buttonClose);

        _buttonImprove = new ViewButtonLabeled(this, _sourceView.buttonImprove);
//        _buttonImprove.actionDelegate = this;

        _buttonTabMilitaryAcademy = new ViewButton(this, _sourceView.buttonTabMilitaryAcademy);
//        _buttonTabMilitaryAcademy.actionDelegate = this;

        _buttonTabTavern = new ViewButton(this, _sourceView.buttonTabTavern);
//        _buttonTabTavern.actionDelegate = this;

        _buttonTabUniversityMM = new ViewButton(this, _sourceView.buttonTabUniversityMM);
//        _buttonTabUniversityMM.actionDelegate = this;

        _items = [];

        var item0:IView = new ControlPopupMerlinTowerItem(this);
        _sourceView.addChild(item0.source);
        _items.push(item0);

        var item1:IView = new ControlPopupMerlinTowerItem(this);
        _sourceView.addChild(item1.source);
        _items.push(item1);

        var item2:IView = new ControlPopupMerlinTowerItem(this);
        _sourceView.addChild(item2.source);
        _items.push(item2);

        var item3:IView = new ControlPopupMerlinTowerItem(this);
        _sourceView.addChild(item3.source);
        _items.push(item3);
    }

    public override function placeViews():void
    {
        super.placeViews();

        var itemStandard:IView = _items[0];

        var startPosition:Point = new Point(_sourceView.width / 4 - itemStandard.source.width / 2,
                _sourceView.height - itemStandard.source.height - 110);

        for each(var item:IView in _items)
        {
            item.placeViews();

            item.source.x = startPosition.x;
            item.source.y = startPosition.y;

            startPosition.x += item.source.width - 45;
        }
    }

    /*
     *IActionDelegate
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
                case _buttonTabMilitaryAcademy:
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

    public override function cleanup():void
    {
        _buttonImprove.cleanup();
        _buttonImprove = null;

        _buttonTabMilitaryAcademy.cleanup();
        _buttonTabMilitaryAcademy = null;

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
}
}
