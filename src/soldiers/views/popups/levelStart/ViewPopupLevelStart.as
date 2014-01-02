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
package soldiers.views.popups.levelStart
{
import controllers.IControllerPopup;

import views.IView;
import views.IViewButton;
import views.implementations.ViewPopup;
import views.implementations.buttons.ViewButton;

public class ViewPopupLevelStart extends ViewPopup
{
    /*
     * Fields
     */
    private var _sourceView:gPopupLevelStart;

    private var _buttonStart:IViewButton;


    /*
     * Properties
     */
    public function get buttonStart():IViewButton
    {
        return _buttonStart;
    }

    /*
     * Methods
     */
    public function ViewPopupLevelStart(controller:IControllerPopup)
    {
        _sourceView = new gPopupLevelStart();

        super(controller, _sourceView);

        init();
    }

    private function init():void
    {

        var buttonClose:IView = new ViewButton(controller, _sourceView.buttonClose);
        setButtonClose(buttonClose);

        _buttonStart = new ViewButton(controller, _sourceView.buttonStart);
    }

    public override function cleanup():void
    {
        _sourceView = null;

        _buttonStart.cleanup();
        _buttonStart = null;

        super.cleanup();
    }
}
}
