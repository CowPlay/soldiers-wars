/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/19/13
 * Time: 5:57 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.village.housesV
{
import views.IView;

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
    public function ControlHouseViewBakery(parent:IView, entry:HouseV, sourceViewValue:DisplayObjectContainer)
    {
        super(parent, entry, sourceViewValue);

        Debug.assert(entry is HouseVBakery);

        init();
    }

    private function init():void
    {

    }

}
}
