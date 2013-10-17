/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 17.10.13
 * Time: 12:02
 * To change this template use File | Settings | File Templates.
 */
package controllers.popups.bakery
{
import controls.IControlButton;
import controls.IControlScene;
import controls.implementations.ControlPopupBase;
import controls.implementations.buttons.ControlButtonBase;

import flash.display.DisplayObjectContainer;

public class ControlPopupBakery extends ControlPopupBase
{

    /*
     * Fields
     */

    private var _sourceViewTyped:gPopupBakery;


    private var _buttonClose:IControlButton;
    private var _buttonImprove:IControlButton;


    /*
     * Properties
     */


    /*
     * Methods
     */
    public function ControlPopupBakery(sceneOwner:IControlScene)
    {
        super(sceneOwner);
        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gPopupBakery();
        setSourceView(_sourceViewTyped);

        _buttonImprove = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonImprove);

        _buttonClose = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonClose);

    }
}
}
