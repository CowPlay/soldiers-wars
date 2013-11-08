/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 17.10.13
 * Time: 12:02
 * To change this template use File | Settings | File Templates.
 */
package soldiers.popups.houses.bakery
{
import com.greensock.TweenLite;

import controls.EControllerUpdateBase;
import controls.IView;
import controls.IViewButton;
import controls.implementations.buttons.ViewButton;
import controls.implementations.buttons.ViewButtonLabeled;

import flash.events.MouseEvent;
import flash.geom.Point;

import models.interfaces.states.IState;

import soldiers.models.GameInfo;
import soldiers.models.housesVillage.bakery.HouseLevelInfoVBakery;
import soldiers.models.housesVillage.bakery.HouseVBakery;
import soldiers.models.housesVillage.base.EHouseTypeV;
import soldiers.popups.EPopupType;
import soldiers.popups.houses.base.ControlPopupHouse;

public class ControlPopupBakery extends ControlPopupHouse
{

    /*
     * Fields
     */

    private var _entry:HouseVBakery;

    private var _sourceView:gPopupBakery;

    private var _buttonImprove:IViewButton;
    private var _buttonLeft:IViewButton;
    private var _buttonRight:IViewButton;

    private var _items:Array;

    private var _currentItemIndex:int;
    private var _scrollInProgress:Boolean;
    /*
     * Properties
     */
    public override function get type():String
    {
        return EPopupType.EPT_VILLAGE_HOUSE_BAKERY;
    }


    /*
     * Methods
     */
    public function ControlPopupBakery()
    {
        _sourceView = new gPopupBakery();
        super(_sourceView);
        init();
    }

    private function init():void
    {
        _entry = GameInfo.instance.managerHousesVillage.getHouseByType(EHouseTypeV.EHTV_BAKERY) as HouseVBakery;

        var buttonClose:IView = new ViewButton(this, _sourceView.buttonClose);
        setButtonClose(buttonClose);

        _buttonImprove = new ViewButtonLabeled(this, _sourceView.buttonImprove);
//        _buttonImprove.actionDelegate = this;

        _buttonLeft = new ViewButton(this, _sourceView.buttonLeft);
//        _buttonLeft.actionDelegate = this;

        _buttonRight = new ViewButton(this, _sourceView.buttonRight);
//        _buttonRight.actionDelegate = this;


        _items = [];

        for each(var levelInfo:HouseLevelInfoVBakery in _entry.levelsInfo)
        {
            var itemView:IView = new ControlPopupBakeryItem(this, levelInfo);
            _sourceView.itemsView.placeholder.addChild(itemView.sourceView);
            _items.push(itemView);
        }
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
                    onButtonImproveClicked();
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
        if (_currentItemIndex == _items.length - 1)
            return;

        scrollRight();
    }

    private function onButtonLeftClicked():void
    {
        if (_currentItemIndex == 0)
            return;

        scrollLeft();
    }

    private function onButtonImproveClicked():void
    {
        var params:Object;

        _entry.level++;

        //TODO: change number levelMAX
        if (_entry.level == 3)
        {
            _buttonImprove.enabled = false;
        }

        var itemStandard:IView = _items[0];

        scrollToItem(_entry.level - 1, updateItems);
    }

    private function scrollToItem(itemIndex:uint, onComplete:Function = null):void
    {
        if (itemIndex == _currentItemIndex)
        {
            if (onComplete != null)
                onComplete();

            return;
        }

        Debug.assert(0 <= itemIndex && itemIndex <= _items.length - 1);

        var onCompleteScroll:Function =
                function ():void
                {
                    scrollToItem(itemIndex, onComplete);
                };

        itemIndex < _currentItemIndex ? scrollLeft(onCompleteScroll) : scrollRight(onCompleteScroll);
    }

    private function scrollLeft(onComplete:Function = null):void
    {
        if (_scrollInProgress)
            return;

        _scrollInProgress = true;

        var itemStandard:IView = _items[0];

        var onCompleteWrapper:Function =
                function ():void
                {
                    _currentItemIndex--;

                    _scrollInProgress = false;

                    if (onComplete != null)
                        onComplete();
                };

        var params:Object =
        {
            x: _sourceView.itemsView.placeholder.x + itemStandard.sourceView.width + 20,
            onComplete: onCompleteWrapper
        };

        TweenLite.to(_sourceView.itemsView.placeholder, 2, params);
    }


    private function scrollRight(onComplete:Function = null):void
    {
        if (_scrollInProgress)
            return;

        _scrollInProgress = true;

        var itemStandard:IView = _items[0];

        var onCompleteWrapper:Function =
                function ():void
                {
                    _currentItemIndex++;

                    _scrollInProgress = false;

                    if (onComplete != null)
                        onComplete();
                };

        var params:Object =
        {
            x: _sourceView.itemsView.placeholder.x - itemStandard.sourceView.width - 20,
            onComplete: onCompleteWrapper
        };

        TweenLite.to(_sourceView.itemsView.placeholder, 2, params);
    }

    private function updateItems():void
    {
        for each(var item:IView in _items)
        {
            item.update(EControllerUpdateBase.ECUT_ENTRY_UPDATED);
        }
    }

    public override function cleanup():void
    {
        _buttonImprove.cleanup();
        _buttonImprove = null;

        _buttonLeft.cleanup();
        _buttonLeft = null;

        _buttonRight.cleanup();
        _buttonRight = null;

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
