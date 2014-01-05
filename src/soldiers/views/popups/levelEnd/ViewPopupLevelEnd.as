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
package soldiers.views.popups.levelEnd
{
import controllers.IControllerPopup;

import views.IView;
import views.implementations.ViewPopup;
import views.implementations.buttons.ViewButton;

public class ViewPopupLevelEnd extends ViewPopup
{
    /*
     * Fields
     */
    private var _sourceView:gPopupLevelEnd;



    /*
     * Properties
     */

    /*
     * Methods
     */
    public function ViewPopupLevelEnd(controller:IControllerPopup)
    {
        _sourceView = new gPopupLevelEnd();

        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
        var buttonClose:IView = new ViewButton(controller, _sourceView.buttonClose);
        setButtonClose(buttonClose);
    }

    public override function cleanup():void
    {
        _sourceView = null;

        super.cleanup();
    }
}
}
