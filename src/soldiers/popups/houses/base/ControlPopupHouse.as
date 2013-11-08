/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/5/13
 * Time: 1:20 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.popups.houses.base
{
import controls.IView;
import controls.implementations.ViewPopup;

import flash.display.DisplayObjectContainer;

import models.interfaces.states.IState;

import soldiers.models.housesVillage.base.HouseV;

//TODO: mb need remove
public class ControlPopupHouse extends ViewPopup
{
    /*
     * Fields
     */
    private var _entry:HouseV;

    /*
     * Properties
     */


    /*
     * Methods
     */

    //! Default constructor
    public function ControlPopupHouse(sourceView:DisplayObjectContainer)
    {
        super(sourceView);
        init();
    }

    private function init():void
    {
//        _sourceViewTyped = new gPopupHouse();
//        setSourceView(_sourceViewTyped);

//        _sourceViewTyped.buttonClose.addEventListener(MouseEvent.CLICK, onButtonCloseClicked);

//        _contentMilitary = new ControlPopupHouseContentMilitary(this);
//        _sourceViewTyped.addChild(_contentMilitary);

//        _controlHeaderRow0 = new ControlHousePopupHeaderRow(_sceneOwner);
//        addChild(_controlHeaderRow0);
    }
}
}
