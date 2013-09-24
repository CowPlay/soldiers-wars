/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/23/13
 * Time: 9:43 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.game.views.Houses
{
import controls.IControlScene;

import models.data.houses.base.EHouseType;
import models.data.houses.base.HouseInfo;

public class ControlHouseViewBarracks extends ControlHouseView
{
    /*
     * Fields
     */


    private var houseView:gHouseBarracks;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlHouseViewBarracks(sceneOwner:IControlScene, entry:HouseInfo)
    {
        super(sceneOwner, entry);

        Debug.assert(entry.type == EHouseType.EHT_BARRACKS);

        init();
    }

    private function init():void
    {

        houseView = new gHouseBarracks();
        sourceView.addChild(houseView);
    }

    public override function placeViews():void
    {
        super.placeViews();


    }


}
}
