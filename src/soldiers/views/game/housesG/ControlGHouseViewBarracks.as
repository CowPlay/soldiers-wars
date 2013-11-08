/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/23/13
 * Time: 9:43 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.housesG
{
import controls.IView;

import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.housesGame.base.HouseG;
import soldiers.views.game.housesG.base.ControlGHouseView;

public class ControlGHouseViewBarracks extends ControlGHouseView
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
    public function ControlGHouseViewBarracks(parent:IView, entry:HouseG)
    {
        super(parent, entry);

        Debug.assert(entry.type == EHouseTypeG.EHGT_BARRACKS);

        init();
    }

    private function init():void
    {
        setHouseView(new gHouseBarracks());
    }
}
}
