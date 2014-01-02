/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 18.10.13
 * Time: 15:08
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.popups.houses.tavern
{
import controllers.IController;

import views.IViewButton;
import views.implementations.ViewBase;
import controls.implementations.buttons.ViewButton;

import flash.display.Sprite;

public class ViewPopupTavernItem extends ViewBase
{
    /*
     * Fields
     */
//    TODO: implement
    private var _sourceView:Sprite;

//    private var _sourceView:gPopupTavernItem;

    private var _buttonAccelerate:IViewButton;
    /*
     * Properties
     */


    public function get buttonAccelerate():IViewButton
    {
        return _buttonAccelerate;
    }

    /*
     * Methods
     */

    public function ViewPopupTavernItem(controller:IController)
    {
//        _sourceView = new gPopupTavernItem();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
//        _buttonAccelerate = new ViewButton(controller, _sourceView.buttonAccelerate);
    }


    public override function cleanup():void
    {
        _buttonAccelerate.cleanup();
        _buttonAccelerate = null;

        _sourceView = null;

        super.cleanup();
    }
}
}
