/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/19/13
 * Time: 5:07 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesVillage.bakery
{
import soldiers.models.housesVillage.base.EHouseTypeV;
import soldiers.models.housesVillage.base.HouseV;

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

    public function get currentLevelInfo():HouseLevelInfoVBakery
    {
        return levelsInfo[level];
    }

    protected override function get levelInfoClass():Class
    {
        return HouseLevelInfoVBakery;
    }




    /*
     * Methods
     */

    //! Default constructor
    public function HouseVBakery()
    {
    }

    public function onBuild(levelInfo:HouseLevelInfoVBakery):void
    {
        Debug.assert(levelInfo != null);
        Debug.assert(levelInfo.isAvailable);

        levelInfo.timerStart(onBuildComplete)
    }

    private function onBuildComplete(levelInfo:HouseLevelInfoVBakery):void
    {
        Debug.assert(levelInfo != null);

        Debug.log("add bread");
    }
}
}
