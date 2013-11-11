/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/8/13
 * Time: 2:20 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.popups.houses.build
{
import controllers.implementations.ControllerPopup;

import controls.IView;

import flash.events.MouseEvent;

import soldiers.popups.EPopupType;
import soldiers.views.popups.houses.build.ViewPopupBuildHouse;

public class ControllerPopupBuildHouse extends ControllerPopup
{
    /*
     * Fields
     */
    private var _view:ViewPopupBuildHouse;

    /*
     * Properties
     */
    public override function get type():String
    {
        return EPopupType.EPT_VILLAGE_HOUSE_BUILD;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerPopupBuildHouse()
    {
        _view = new ViewPopupBuildHouse(this);
        super(_view);
    }

    public override function onViewClicked(target:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewClicked(target, e);

        if (!result)
        {
            switch (target)
            {
                case _view.buttonBuild:
                {
                    Debug.log("build something");

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
