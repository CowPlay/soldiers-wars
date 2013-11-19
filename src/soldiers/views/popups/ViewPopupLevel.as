/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 12.11.13
 * Time: 11:05
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.popups
{
import controllers.IControllerPopup;

import controls.IView;
import controls.IViewButton;
import controls.implementations.ViewPopup;
import controls.implementations.buttons.ViewButton;
import controls.implementations.buttons.ViewButtonLabeled;

import soldiers.models.GameInfo;

public class ViewPopupLevel extends ViewPopup
{
    /*
     * Fields
     */
    private var _sourceView:gPopupLevel;

    private var _button:IViewButton;


    /*
     * Properties
     */
    public function get button():IViewButton
    {
        return _button;
    }

    /*
     * Methods
     */
    public function ViewPopupLevel(controller:IControllerPopup)
    {
        _sourceView = new gPopupLevel();

        super(controller, _sourceView);

        init();
    }

    private function init():void
    {

        var buttonClose:IView = new ViewButton(controller, _sourceView.buttonClose);
        setButtonClose(buttonClose);

        _button = new ViewButtonLabeled(controller, _sourceView.buttonStartEnd);
    }

    public override function cleanup():void
    {
        _sourceView = null;

        _button.cleanup();
        _button = null;

        super.cleanup();
    }
}
}
