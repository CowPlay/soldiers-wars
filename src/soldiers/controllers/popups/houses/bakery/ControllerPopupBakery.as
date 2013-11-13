/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/8/13
 * Time: 9:39 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.popups.houses.bakery
{
import controllers.IController;
import controllers.implementations.ControllerPopup;

import controls.EControllerUpdateBase;

import controls.IView;

import flash.events.MouseEvent;

import soldiers.models.GameInfo;
import soldiers.models.housesVillage.bakery.HouseLevelInfoVBakery;
import soldiers.models.housesVillage.bakery.HouseVBakery;
import soldiers.models.housesVillage.base.EHouseTypeV;
import soldiers.popups.EPopupType;
import soldiers.views.popups.houses.bakery.ViewPopupBakery;

public class ControllerPopupBakery extends ControllerPopup
{
    /*
     * Fields
     */
    private var _entry:HouseVBakery;

    private var _view:ViewPopupBakery;

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

    private function get currentItemIndex():uint
    {
        return _currentItemIndex;
    }

    private function set currentItemIndex(value:uint):void
    {
        _currentItemIndex = value;

        _view.buttonLeft.enabled = _currentItemIndex > 0;
        _view.buttonRight.enabled = _currentItemIndex < _items.length - 1;
    }


    /*
     * Methods
     */

    //! Default constructor
    public function ControllerPopupBakery()
    {
        _view = new ViewPopupBakery(this);
        super(_view);
        init();
    }

    private function init():void
    {
        _items = [];

        _entry = GameInfo.instance.managerHousesVillage.getHouseByType(EHouseTypeV.EHTV_BAKERY) as HouseVBakery;

        for each(var levelInfo:HouseLevelInfoVBakery in _entry.levelsInfo)
        {
            var item:IController = new ControllerPopupBakeryItem(levelInfo);
            _view.addSubView(item.view);
            _items.push(item);
        }

        currentItemIndex = 0;
    }

    public override function onViewClicked(view:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewClicked(view, e);

        if (!result)
        {
            switch (view)
            {
                case _view.buttonImprove:
                {
                    onButtonImproveClicked();
                    result = true;
                    break;
                }
                case _view.buttonLeft:
                {
                   onButtonLeftClicked();

                    result = true;
                    break;
                }
                case _view.buttonRight:
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

    private function onButtonRightClicked():void
    {
        if (_currentItemIndex < _items.length - 1 && !_scrollInProgress)
        {
            _scrollInProgress = true;

            currentItemIndex++;

            _view.scrollRight(
                    function ():void
                    {
                        _scrollInProgress = false;
                    });
        }
    }

    private function onButtonLeftClicked():void
    {
        if (_currentItemIndex > 0 && !_scrollInProgress)
        {
            _scrollInProgress = true;

            currentItemIndex--;

            _view.scrollLeft(
                    function ():void
                    {
                        _scrollInProgress = false;
                    }
            );
        }
    }

    private function onButtonImproveClicked():void
    {
        var params:Object;

        _entry.level++;

        //TODO: change number levelMAX
        if (_entry.level == 3)
        {
            _view.buttonImprove.enabled = false;
        }

        var targetIndex:uint = _entry.level - 1;

        //TODO:update items
        targetIndex < _currentItemIndex ? _view.scrollLeft(null, _currentItemIndex - targetIndex) : _view.scrollRight(null, targetIndex - _currentItemIndex);

        currentItemIndex = targetIndex;
    }

    //TODO: review
    private function updateItems():void
    {
        for each(var item:IController in _items)
        {
            item.update(EControllerUpdateBase.ECUT_ENTRY_UPDATED);
        }
    }

    public override function cleanup():void
    {
        for each(var item:IController in _items)
        {
            item.cleanup();
        }

        _view.cleanup();
        _view = null;

        super.cleanup();
    }
}
}
