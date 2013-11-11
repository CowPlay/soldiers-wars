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
package soldiers.views.popups.houses.tavern
{
import com.greensock.TweenLite;

import controllers.IControllerPopup;

import controls.IView;
import controls.IViewButton;
import controls.implementations.ViewPopup;
import controls.implementations.buttons.ViewButton;

import flash.events.MouseEvent;
import flash.geom.Point;

public class ViewPopupTavern extends ViewPopup
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



    /*
     * Properties
     */


    public function get buttonTabMilitaryAcademy():IViewButton
    {
        return _buttonTabMilitaryAcademy;
    }

    public function get buttonTabMerlin():IViewButton
    {
        return _buttonTabMerlin;
    }

    public function get buttonTabUniversityMM():IViewButton
    {
        return _buttonTabUniversityMM;
    }

    public function get buttonImprove():IViewButton
    {
        return _buttonImprove;
    }

    public function get buttonLeft():IViewButton
    {
        return _buttonLeft;
    }

    public function get buttonRight():IViewButton
    {
        return _buttonRight;
    }

    /*
     * Methods
     */
    public function ViewPopupTavern(controller:IControllerPopup)
    {
        _sourceView = new gPopupTavern();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
        var buttonClose:IView = new ViewButton(controller, _sourceView.buttonClose);
        setButtonClose(buttonClose);


        _buttonTabMilitaryAcademy = new ViewButton(controller, _sourceView.buttonTabMilitaryAcademy);
        _buttonTabMerlin = new ViewButton(controller, _sourceView.buttonTabMerlin);
        _buttonTabUniversityMM = new ViewButton(controller, _sourceView.buttonTabUniversityMM);

        _buttonLeft = new ViewButton(controller, _sourceView.buttonLeft);
        _buttonRight = new ViewButton(controller, _sourceView.buttonRight);

        _buttonImprove = new ViewButton(controller, _sourceView.buttonImprove);


        _items = [];

        var item0:IView = new ViewPopupTavernItem(controller);
        _sourceView.itemsView.placeholder.addChild(item0.sourceView);
        _items.push(item0);

        var item1:IView = new ViewPopupTavernItem(controller);
        _sourceView.itemsView.placeholder.addChild(item1.sourceView);
        _items.push(item1);

        var item3:IView = new ViewPopupTavernItem(controller);
        _sourceView.itemsView.placeholder.addChild(item3.sourceView);
        _items.push(item3);
    }

    public override function placeViews(isFullscreen:Boolean):void
    {
        super.placeViews(isFullscreen);

        var itemStandard:IView = _items[0];

        var startPosition:Point = new Point(_sourceView.itemsView.width / 2 - itemStandard.sourceView.width / 2,
                _sourceView.itemsView.height / 2 - itemStandard.sourceView.height / 2);

        for each(var item:IView in _items)
        {
            item.placeViews(isFullscreen);

            item.sourceView.x = startPosition.x;
            item.sourceView.y = startPosition.y;

            startPosition.x += item.sourceView.width + 20;
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