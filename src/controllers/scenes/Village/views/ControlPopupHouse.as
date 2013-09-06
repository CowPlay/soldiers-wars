/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/5/13
 * Time: 1:20 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.village.views
{
import controllers.EPopupType;
import controllers.scenes.village.views.popupHouse.ControlHousePopupHeaderRow;
import controllers.scenes.village.views.popupHouse.content.ControlPopupHouseContentMilitary;

import core.Debug;
import core.controls.ControlScene;
import core.controls.popups.ControlPopupUpDown;
import core.models.GameInfo;

import flash.events.MouseEvent;
import flash.geom.Point;

public class ControlPopupHouse extends ControlPopupUpDown
{
    /*
     * Fields
     */

    private var _rootView:gPopupHouse;
    private var _controlHeaderRow0:ControlHousePopupHeaderRow;
    private var _controlHeaderRow1:ControlHousePopupHeaderRow;

    private var _contentMilitary:ControlPopupHouseContentMilitary;

    /*
     * Properties
     */

    public override function get type():String
    {
        return EPopupType.EPT_VILLAGE_HOUSE;
    }

    public override function get positionShow():Point
    {
        return new Point(GameInfo.Instance.appHelper.applicationSize.x / 2 - width / 2, -height * 0.1);
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControlPopupHouse(sceneOwner:ControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _rootView = new gPopupHouse();
        _rootView.buttonClose.addEventListener(MouseEvent.CLICK, onButtonCloseClicked);
        addChild(_rootView);

        _contentMilitary = new ControlPopupHouseContentMilitary(sceneOwner);
        _rootView.addChild(_contentMilitary);

//        _controlHeaderRow0 = new ControlHousePopupHeaderRow(_sceneOwner);
//        addChild(_controlHeaderRow0);
    }

    private function onButtonCloseClicked(e:MouseEvent):void
    {
        Debug.assert(sceneOwner.currentPopup == this);

        sceneOwner.hidePopup();
    }
}
}
