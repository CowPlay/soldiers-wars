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
//TODO:finish class
package controllers.popups.universityMM
{
import controllers.EPopupType;

import controls.IControl;

import controls.IControlButton;

import controls.IControlScene;
import controls.implementations.ControlPopupBase;
import controls.implementations.buttons.ControlButtonBase;

import models.GameInfo;

public class ControlPopupUniversityMM  extends ControlPopupBase
{
    /*
     * Fields
     */
    private var _sourceViewTyped:gPopupUniversityMM;

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
        return EPopupType.EPT_VILLAGE_HOUSE_UNIVERSITETMM;
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

        _buttonLeft = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonLeft);
        _buttonLeft.actionDelegate = this;

        _buttonRight = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonRight);
        _buttonRight.actionDelegate = this;

        _buttonImprove = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonImprove);
        _buttonImprove.actionDelegate = this;

        _items = [];

        var item0:ControlPopupUniversityMMItem = new ControlPopupUniversityMMItem(sceneOwner);
        _sourceViewTyped.itemsView.placeholder.addChild(item0.sourceView);
        _items.push(item0);

//        var item1:ControlPopupUniversityMMItem = new ControlPopupUniversityMMItem(sceneOwner);
//        _sourceViewTyped.itemsView.placeholder.addChild(item1.sourceView);
//        _items.push(item1);
//
//        var item3:ControlPopupUniversityMMItem = new ControlPopupUniversityMMItem(sceneOwner);
//        _sourceViewTyped.itemsView.placeholder.addChild(item3.sourceView);
//        _items.push(item3);

    }
}
}
