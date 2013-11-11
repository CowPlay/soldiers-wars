/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/9/13
 * Time: 11:09 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.popups.houses.tavern
{
import com.greensock.TweenLite;

import controllers.implementations.ControllerPopup;

import controls.IView;

import flash.events.MouseEvent;

import soldiers.popups.EPopupType;
import soldiers.views.popups.houses.tavern.ViewPopupTavern;

public class ControllerPopupTavern extends ControllerPopup
{
    /*
     * Fields
     */
    private var _view:ViewPopupTavern;

    private var _currentItemIndex:int;
    private var _scrollInProgress:Boolean;

    private var _items:Array;

    /*
     * Properties
     */


    public override function get type():String
    {
        return EPopupType.EPT_VILLAGE_HOUSE_TAVERN;
    }


    private function get currentItemIndex():int
    {
        return _currentItemIndex;
    }

    private function set currentItemIndex(value:int):void
    {
        _currentItemIndex = value;

        _view.buttonLeft.enabled = _currentItemIndex > 0;
        _view.buttonRight.enabled = _currentItemIndex < _items.length - 1;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerPopupTavern()
    {
        _view = new ViewPopupTavern(this);
        super(_view);
        init();
    }

    private function init():void
    {
    }

    /*
     * IActionDelegate
     */

    public override function onViewClicked(view:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewClicked(view, e);

        if (!result)
        {
            switch (view)
            {
                case _view.buttonImprove:
                {
                    result = true;
                    break;
                }
                case _view.buttonTabMilitaryAcademy:
                {
                    result = true;
                    break;
                }
                case _view.buttonTabMerlin:
                {
                    result = true;
                    break;
                }

                case _view.buttonTabUniversityMM:
                {
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

    /*
     * Callbacks
     */
    private function onButtonRightClicked():void
    {
        //TODO: implement
//        if (_scrollInProgress)
//            return;
//
//        if (_currentItemIndex == _items.length - 1)
//            return;
//
//        _scrollInProgress = true;
//
//        var itemStandard:IView = _items[0];
//
//        var params:Object =
//        {
//            x: _sourceView.itemsView.placeholder.x - itemStandard.sourceView.width - 20,
//            onComplete: onItemsMoveLeftComplete
//        };
//
//        TweenLite.to(_sourceView.itemsView.placeholder, 2, params);
    }

    private function onItemsMoveLeftComplete():void
    {
        _currentItemIndex++;

        _scrollInProgress = false;
    }


    private function onButtonLeftClicked():void
    {
        //TODO:implement
//        if (_scrollInProgress)
//            return;
//
//        if (_currentItemIndex == _items.length - 3)
//            return;
//
//        _scrollInProgress = true;
//
//        var itemStandard:IView = _items[0];
//
//        var params:Object =
//        {
//            x: _sourceView.itemsView.placeholder.x + itemStandard.sourceView.width + 20,
//            onComplete: onItemsMoveRightComplete
//        };
//
//        TweenLite.to(_sourceView.itemsView.placeholder, 2, params);
    }

    private function onItemsMoveRightComplete():void
    {
        _currentItemIndex--;

        _scrollInProgress = false;
    }

}
}
