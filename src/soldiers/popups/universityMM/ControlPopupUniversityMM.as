/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 17.10.13
 * Time: 15:50
 * To change this template use File | Settings | File Templates.
 */

package soldiers.popups.universityMM
{
import com.greensock.TweenLite;

import controls.IView;
import controls.IViewButton;
import controls.implementations.ViewPopup;
import controls.implementations.buttons.ViewButton;

import flash.events.MouseEvent;
import flash.geom.Point;

import models.interfaces.states.IState;

import soldiers.popups.EPopupType;

public class ControlPopupUniversityMM extends ViewPopup
{
    /*
     * Fields
     */
    private var _sourceView:gPopupUniversityMM;

    private var _buttonTabMilitaryAcademy:IViewButton;
    private var _buttonTabMerlin:IViewButton;
    private var _buttonTabTavern:IViewButton;

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
        return EPopupType.EPT_VILLAGE_HOUSE_UNIVERSITY_MM;
    }


    /*
     * Methods
     */


    public function ControlPopupUniversityMM()
    {
        _sourceView = new gPopupUniversityMM();
        super(_sourceView);

        init();
    }

    private function init():void
    {
        var buttonClose:IView = new ViewButton(this, _sourceView.buttonClose);
        setButtonClose(buttonClose);

        _buttonTabMilitaryAcademy = new ViewButton(this, _sourceView.buttonTabMilitaryAcademy);
//        _buttonTabMilitaryAcademy.actionDelegate = this;

        _buttonTabMerlin = new ViewButton(this, _sourceView.buttonTabMerlin);
//        _buttonTabMerlin.actionDelegate = this;

        _buttonTabTavern = new ViewButton(this, _sourceView.buttonTabTavern);
//        _buttonTabTavern.actionDelegate = this;


        _buttonLeft = new ViewButton(this, _sourceView.buttonLeft);
//        _buttonLeft.actionDelegate = this;

        _buttonRight = new ViewButton(this, _sourceView.buttonRight);
//        _buttonRight.actionDelegate = this;

        _buttonImprove = new ViewButton(this, _sourceView.buttonImprove);
//        _buttonImprove.actionDelegate = this;

        _items = [];

        var item0:IView = new ControlPopupUniversityMMItem(this);
        _sourceView.itemsView.placeholder.addChild(item0.source);
        _items.push(item0);

        var item1:IView = new ControlPopupUniversityMMItem(this);
        _sourceView.itemsView.placeholder.addChild(item1.source);
        _items.push(item1);

        var item3:IView = new ControlPopupUniversityMMItem(this);
        _sourceView.itemsView.placeholder.addChild(item3.source);
        _items.push(item3);

    }

    public override function placeViews():void
    {
        super.placeViews();

        var itemStandard:IView = _items[0];

        var startPosition:Point = new Point(_sourceView.itemsView.placeholder.width / 2 - itemStandard.source.width / 2,
                _sourceView.itemsView.placeholder.height / 2 - itemStandard.source.height / 2);

        for each(var item:IView in _items)
        {
            item.placeViews();

            item.source.x = startPosition.x;
            item.source.y = startPosition.y;

            startPosition.x += item.source.width + 20;
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
                case _buttonTabTavern:
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
            x: _sourceView.itemsView.placeholder.x - itemStandard.source.width - 20,
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
            x: _sourceView.itemsView.placeholder.x + itemStandard.source.width + 20,
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

        _buttonTabTavern.cleanup();
        _buttonTabTavern = null;

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
