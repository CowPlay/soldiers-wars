/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 17.10.13
 * Time: 15:42
 * To change this template use File | Settings | File Templates.
 */
package soldiers.popups.tavern
{
import com.greensock.TweenLite;

import controls.IView;
import controls.IViewButton;
import controls.implementations.ViewPopup;
import controls.implementations.buttons.ViewButton;

import flash.events.MouseEvent;
import flash.geom.Point;

import soldiers.popups.EPopupType;

public class ControlPopupTavern extends ViewPopup
{
    /*
     * Fields
     */
    private var _sourceView:gPopupTavern;

    private var _buttonTabMilitaryAcademy:IViewButton;
    private var _buttonTabMerlin:IViewButton;
    private var _buttonTabUniversityMM:IViewButton;

    private var _buttonImprove:IViewButton;
    private var _buttonLeft:IViewButton;
    private var _buttonRight:IViewButton;

    private var _items:Array;

    private var _currentItemIndex:int;
    private var _tweenInProgress:Boolean;

    /*
     * Properties
     */
    public override function get type():String
    {
        return EPopupType.EPT_VILLAGE_HOUSE_TAVERN;
    }


    /*
     * Methods
     */
    public function ControlPopupTavern()
    {
        _sourceView = new gPopupTavern();
        super(_sourceView);

        init();
    }

    private function init():void
    {
        var buttonClose:IView = new ViewButton(this, _sourceView.buttonClose);
        setButtonClose(buttonClose);


        _buttonTabMilitaryAcademy = new ViewButton(this, _sourceView.buttonTabMilitaryAcademy);
        //TODO: implement
//        _buttonTabMilitaryAcademy.actionDelegate = this;

        _buttonTabMerlin = new ViewButton(this, _sourceView.buttonTabMerlin);
        //TODO: implement
//        _buttonTabMerlin.actionDelegate = this;


        _buttonTabUniversityMM = new ViewButton(this, _sourceView.buttonTabUniversityMM);
        //TODO: implement
//        _buttonTabUniversityMM.actionDelegate = this;


        _buttonLeft = new ViewButton(this, _sourceView.buttonLeft);
        //TODO: implement
//        _buttonLeft.actionDelegate = this;

        _buttonRight = new ViewButton(this, _sourceView.buttonRight);
        //TODO: implement
//        _buttonRight.actionDelegate = this;

        _buttonImprove = new ViewButton(this, _sourceView.buttonImprove);
        //TODO: implement
//        _buttonImprove.actionDelegate = this;


        _items = [];

        var item0:IView = new ControlPopupTavernItem(this);
        _sourceView.itemsView.placeholder.addChild(item0.sourceView);
        _items.push(item0);

        var item1:IView = new ControlPopupTavernItem(this);
        _sourceView.itemsView.placeholder.addChild(item1.sourceView);
        _items.push(item1);

        var item3:IView = new ControlPopupTavernItem(this);
        _sourceView.itemsView.placeholder.addChild(item3.sourceView);
        _items.push(item3);
    }

    public override function placeViews():void
    {
        super.placeViews();

        var itemStandard:IView = _items[0];

        var startPosition:Point = new Point(_sourceView.itemsView.width / 2 - itemStandard.sourceView.width / 2,
                _sourceView.itemsView.height / 2 - itemStandard.sourceView.height / 2);

        for each(var item:IView in _items)
        {
            item.placeViews();

            item.sourceView.x = startPosition.x;
            item.sourceView.y = startPosition.y;

            startPosition.x += item.sourceView.width + 20;
        }
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
                case _buttonTabMilitaryAcademy:
                {
                    result = true;
                    break;
                }
                case _buttonTabMerlin:
                {
                    result = true;
                    break;
                }

                case _buttonTabUniversityMM:
                {
                    result = true;
                    break;
                }
                case _buttonLeft:
                {
                    onButtonLeftClicked();
                    result = true;
                    break;
                }
                case _buttonRight:
                {
                    onButtonRightClicked();
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
     * Callbacks
     */
    private function onButtonRightClicked():void
    {
        if (_tweenInProgress)
            return;

        if (_currentItemIndex == _items.length - 1)
            return;

        _tweenInProgress = true;

        var itemStandard:IView = _items[0];

        var params:Object =
        {
            x: _sourceView.itemsView.placeholder.x - itemStandard.sourceView.width - 20,
            onComplete: onItemsMoveLeftComplete
        };

        TweenLite.to(_sourceView.itemsView.placeholder, 2, params);
    }

    private function onItemsMoveLeftComplete():void
    {
        _currentItemIndex++;

        _tweenInProgress = false;
    }


    private function onButtonLeftClicked():void
    {
        if (_tweenInProgress)
            return;

        if (_currentItemIndex == _items.length - 3)
            return;

        _tweenInProgress = true;

        var itemStandard:IView = _items[0];

        var params:Object =
        {
            x: _sourceView.itemsView.placeholder.x + itemStandard.sourceView.width + 20,
            onComplete: onItemsMoveRightComplete
        };

        TweenLite.to(_sourceView.itemsView.placeholder, 2, params);
    }

    private function onItemsMoveRightComplete():void
    {
        _currentItemIndex--;

        _tweenInProgress = false;
    }


    public override function cleanup():void
    {
        _buttonImprove.cleanup();
        _buttonImprove = null;

        _buttonLeft.cleanup();
        _buttonLeft = null;

        _buttonRight.cleanup();
        _buttonRight = null;

        _buttonTabMerlin.cleanup();
        _buttonTabMerlin = null;

        _buttonTabMilitaryAcademy.cleanup();
        _buttonTabMilitaryAcademy = null;

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
