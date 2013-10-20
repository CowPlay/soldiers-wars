/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/19/13
 * Time: 5:57 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.scenes.village.views.housesV
{
import controls.IControlScene;

import flash.display.DisplayObjectContainer;

import soldiers.models.housesVillage.bakery.HouseVBakery;
import soldiers.models.housesVillage.base.HouseV;

public class ControlHouseViewBakery extends ControlHouseViewV
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlHouseViewBakery(sceneOwner:IControlScene, entry:HouseV, sourceViewValue:DisplayObjectContainer)
    {
        super(sceneOwner, entry, sourceViewValue);

        Debug.assert(entry is HouseVBakery);

        init();
    }

    private function init():void
    {

    }

}
}
