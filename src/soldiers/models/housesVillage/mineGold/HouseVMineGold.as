/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 22.10.13
 * Time: 16:37
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesVillage.mineGold
{
import soldiers.models.housesVillage.base.EHouseTypeV;
import soldiers.models.housesVillage.base.HouseV;

public class HouseVMineGold extends HouseV
{
    /*
     * Fields
     */

    /*
     * Properties
     */
    public override function get type():String
    {
        return EHouseTypeV.EHTV_MINE_GOLD;
    }

    public function get currentConfig():HouseLevelInfoVMineGold
    {
        return levelsInfo[level];
    }

    protected override function get levelInfoClass():Class
    {
        return HouseLevelInfoVMineGold;
    }


    /*
     * Methods
     */

    //! Default constructor
    public function HouseVMineGold()
    {
    }

    public function onBuildConfig(levelInfo:HouseLevelInfoVMineGold):void
    {
        Debug.assert(levelInfo != null);
        Debug.assert(levelInfo.isAvailable);

        levelInfo.timerStart(onConfigTimerComplete)
    }

    private function onConfigTimerComplete(levelInfo:HouseLevelInfoVMineGold):void
    {
        Debug.assert(levelInfo != null);

        Debug.log("add bread");
    }
}
}
