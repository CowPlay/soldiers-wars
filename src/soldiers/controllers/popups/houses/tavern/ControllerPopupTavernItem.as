/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/9/13
 * Time: 11:09 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.popups.houses.tavern
{
import controllers.implementations.Controller;

import controls.IView;

import flash.events.MouseEvent;

import soldiers.views.popups.houses.tavern.ViewPopupTavernItem;

public class ControllerPopupTavernItem extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewPopupTavernItem;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerPopupTavernItem()
    {
        _view = new ViewPopupTavernItem(this);
        super(_view);
        init();
    }

    private function init():void
    {
    }

    public override function onViewClicked(view:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewClicked(view, e);

        if (!result)
        {
            switch (view)
            {
                case _view.buttonAccelerate:
                {
                    result = true;
                    break;
                }
                default :
                {
                    Debug.assert(false);
                    break;
                }
            }
        }

        return result;
    }
}
}
