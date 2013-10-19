/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/1/13
 * Time: 12:25 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.scenes.village.views.housesV
{
import controls.IControlScene;
import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;

import soldiers.models.data.housesV.base.HouseInfoV;

public class ControlVHouseView extends ControlBase
{
    /*
     * Fields
     */
    private var _entry:HouseInfoV;

    /*
     * Properties
     */

    public function get entry():HouseInfoV
    {
        return _entry;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControlVHouseView(sceneOwner:IControlScene, entry:HouseInfoV, sourceView:DisplayObjectContainer)
    {
        super(sceneOwner);

        Debug.assert(entry != null);
        Debug.assert(sourceView != null);

        _entry = entry;

        setSourceView(sourceView);

        init();
    }

    private function init():void
    {

    }
}
}
