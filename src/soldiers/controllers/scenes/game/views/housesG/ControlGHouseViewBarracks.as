/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/23/13
 * Time: 9:43 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.scenes.game.views.housesG
{
import controls.IControlScene;

import soldiers.controllers.scenes.game.views.housesG.base.ControlGHouseView;
import soldiers.models.housesGame.base.EHouseTypeG;
import soldiers.models.housesGame.base.HouseG;

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
    public function ControlGHouseViewBarracks(sceneOwner:IControlScene, entry:HouseG)
    {
        super(sceneOwner, entry);

        Debug.assert(entry.type == EHouseTypeG.EHGT_BARRACKS);

        init();
    }

    private function init():void
    {
        setHouseView(new gHouseBarracks());
    }
}
}
