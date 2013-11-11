/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 17.10.13
 * Time: 15:33
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.popups.houses.build
{
import controllers.IControllerPopup;

import controls.IView;
import controls.IViewButton;
import controls.implementations.ViewPopup;
import controls.implementations.buttons.ViewButton;

public class ViewPopupBuildHouse extends ViewPopup
{
    /*
     * Fields
     */
    private var _sourceView:gPopupBuildHouse;

    private var _buttonBuild:IViewButton;

    /*
     * Properties
     */

    public function get buttonBuild():IViewButton
    {
        return _buttonBuild;
    }

    /*
     * Methods
     */
    public function ViewPopupBuildHouse(controller:IControllerPopup)
    {
        _sourceView = new gPopupBuildHouse();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
        var buttonClose:IView = new ViewButton(controller, _sourceView.buttonClose);
        setButtonClose(buttonClose);

        _buttonBuild = new ViewButton(controller, _sourceView.buttonBuild);
    }

    public override function cleanup():void
    {
        _buttonBuild.cleanup();
        _buttonBuild = null;

        _sourceView = null;

        super.cleanup();
    }
}
}
