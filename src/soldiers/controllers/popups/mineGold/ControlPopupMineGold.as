/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/8/13
 * Time: 1:13 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.popups.mineGold
{
import com.greensock.TweenLite;
import com.greensock.loading.display.ContentDisplay;

import controls.IControl;
import controls.IControlButton;
import controls.IControlScene;
import controls.implementations.ControlPopupBase;
import controls.implementations.buttons.ControlButtonBase;
import controls.implementations.buttons.ControlButtonWithLabelsBase;

import flash.events.MouseEvent;

import flash.geom.Point;

import soldiers.controllers.EPopupType;
import soldiers.models.GameInfo;
import soldiers.models.housesVillage.base.EHouseTypeV;
import soldiers.models.housesVillage.mineGold.HouseLevelInfoVMineGold;
import soldiers.models.housesVillage.mineGold.HouseVMineGold;

public class ControlPopupMineGold extends ControlPopupBase
{
    /*
     * Fields
     */

    private var _entry:HouseVMineGold;
    private var _sourceViewTyped:gPopupMineGold;

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
        return EPopupType.EPT_VILLAGE_HOUSE_MINE_GOLD;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControlPopupMineGold(sceneOwner:IControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _entry = GameInfo.instance.managerHousesVillage.getHouseByType(EHouseTypeV.EHTV_MINE_GOLD) as HouseVMineGold;

        _sourceViewTyped = new gPopupMineGold();
        setSourceView(_sourceViewTyped);


        var buttonClose:IControl = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonClose);
        setButtonClose(buttonClose);

        _buttonImprove = new ControlButtonWithLabelsBase(sceneOwner, _sourceViewTyped.buttonImprove);
        _buttonImprove.actionDelegate = this;

        _buttonLeft = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonLeft);
        _buttonLeft.actionDelegate = this;

        _buttonRight = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonRight);
        _buttonRight.actionDelegate = this;


        _items = [];

        for each(var levelInfo:HouseLevelInfoVMineGold in _entry.levelsInfo)
        {
            var itemView:IControl = new ControlPopupMineGoldItem(sceneOwner, levelInfo);
            _sourceViewTyped.itemsView.placeholder.addChild(itemView.sourceView);
            _items.push(itemView);
        }
    }

    public override function placeViews():void
    {
        super.placeViews();

        var itemStandard:IControl = _items[0];

        var startPosition:Point = new Point(_sourceViewTyped.itemsView.width / 2 - itemStandard.sourceView.width / 2,
                _sourceViewTyped.itemsView.height / 2 - itemStandard.sourceView.height / 2);

        for each(var item:IControl in _items)
        {
            item.placeViews();

            item.sourceView.x = startPosition.x;
            item.sourceView.y = startPosition.y;

            startPosition.x += item.sourceView.width + 20;
        }
    }

    /*
     *ActionDelegate
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
