/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/19/13
 * Time: 5:07 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.village.housesV.bakery
{
import soldiers.models.village.housesV.base.EHouseTypeV;
import soldiers.models.village.housesV.base.HouseV;

public class HouseVBakery extends HouseV
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    public override function get type():String
    {
        return EHouseTypeV.EHTV_BAKERY;
    }

    public function get currentConfig():HouseConfigVBakery
    {
        return config[level];
    }

    protected override function get configClass():Class
    {
        return HouseConfigVBakery;
    }




    /*
     * Methods
     */

    //! Default constructor
    public function HouseVBakery()
    {
    }

    public function onBuildConfig(config:HouseConfigVBakery):void
    {
        Debug.assert(config != null);
        Debug.assert(config.isAvailable);

        config.timerStart(onConfigTimerComplete)
    }

    private function onConfigTimerComplete(config:HouseConfigVBakery):void
    {
        Debug.assert(config != null);

        Debug.log("add bread");
    }
}
}
