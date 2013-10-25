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

package soldiers.controllers.popups.universityMM
{
import com.greensock.TweenLite;

import controls.IControl;
import controls.IControlButton;
import controls.IControlScene;
import controls.implementations.ControlPopupBase;
import controls.implementations.buttons.ControlButtonBase;

import flash.events.MouseEvent;

import flash.geom.Point;

import soldiers.controllers.EPopupType;

public class ControlPopupUniversityMM  extends ControlPopupBase
{
    /*
     * Fields
     */
    private var _sourceViewTyped:gPopupUniversityMM;

    private var _buttonTabMilitaryAcademy:IControlButton;
    private var _buttonTabMerlin:IControlButton;
    private var _buttonTabTavern:IControlButton;

    private var _buttonImprove:IControlButton;
    private var _buttonLeft:IControlButton;
    private var _buttonRight:IControlButton;

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


    public function ControlPopupUniversityMM(sceneOwner:IControlScene)
    {
        super(sceneOwner);
        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gPopupUniversityMM();
        setSourceView(_sourceViewTyped);

        var buttonClose:IControl = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonClose);
        setButtonClose(buttonClose);

        _buttonTabMilitaryAcademy = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonTabMilitaryAcademy);
        _buttonTabMilitaryAcademy.actionDelegate = this;

        _buttonTabMerlin = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonTabMerlin);
        _buttonTabMerlin.actionDelegate = this;

        _buttonTabTavern = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonTabTavern);
        _buttonTabTavern.actionDelegate = this;


        _buttonLeft = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonLeft);
        _buttonLeft.actionDelegate = this;

        _buttonRight = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonRight);
        _buttonRight.actionDelegate = this;

        _buttonImprove = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonImprove);
        _buttonImprove.actionDelegate = this;

        _items = [];

        var item0:IControl = new ControlPopupUniversityMMItem(sceneOwner);
        _sourceViewTyped.itemsView.placeholder.addChild(item0.sourceView);
        _items.push(item0);

        var item1:IControl = new ControlPopupUniversityMMItem(sceneOwner);
        _sourceViewTyped.itemsView.placeholder.addChild(item1.sourceView);
        _items.push(item1);

        var item3:IControl = new ControlPopupUniversityMMItem(sceneOwner);
        _sourceViewTyped.itemsView.placeholder.addChild(item3.sourceView);
        _items.push(item3);

    }

    public override function placeViews():void
    {
        super.placeViews();

        var itemStandard:IControl = _items[0];

        var startPosition:Point = new Point(_sourceViewTyped.itemsView.placeholder.width / 2 - itemStandard.sourceView.width / 2,
                _sourceViewTyped.itemsView.placeholder.height / 2 - itemStandard.sourceView.height / 2);

        for each(var item:IControl in _items)
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

        var itemStandard:IControl = _items[0];

        var params:Object =
        {
            x: _sourceViewTyped.itemsView.placeholder.x - itemStandard.sourceView.width - 20,
            onComplete: onItemsMoveLeftComplete
        };

        TweenLite.to(_sourceViewTyped.itemsView.placeholder, 2, params);
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

        var itemStandard:IControl = _items[0];

        var params:Object =
        {
            x: _sourceViewTyped.itemsView.placeholder.x + itemStandard.sourceView.width + 20,
            onComplete: onItemsMoveRightComplete
        };

        TweenLite.to(_sourceViewTyped.itemsView.placeholder, 2, params);
    }

    private function onItemsMoveRightComplete():void
    {
        _currentItemIndex--;

        _tweenInProgress = false;
    }
}
}
