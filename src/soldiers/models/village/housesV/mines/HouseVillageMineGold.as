/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/4/13
 * Time: 2:12 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.village.housesV.mines
{
public class HouseVillageMineGold extends HouseInfoV
{
    /*
     * Fields
     */


    /*
     * Properties
     */

    public override function get type():EHouseVillageType
    {
        return EHouseVillageType.EHVT_MINE_GOLD;
    }

//    public override function set view(value:MovieClip):void
//    {
//
//        Debug.assert(value == null || value is gHouseMineGold);
//
//        super.view = value;
//
//        _viewHouse = value as gHouseMineGold;
//
//        updateView();
//    }


    public override function set state(value:EHouseVillageState):void
    {
        super.state = value;

//        updateView();
    }


    /*
     * Methods
     */

    //! Default constructor
    public function HouseVillageMineGold(state:EHouseVillageState, level:int)
    {
        super(state, level);
    }

    protected override function canBuild():Boolean
    {
        Debug.assert(false, "todo:implement");
        return false;
    }


//    private function updateView():void
//    {
//        if (_viewHouse == null)
//            return;
//
//        _viewHouse.buttonClosed.visible = false;
//        _viewHouse.buttonOpen.visible = false;
//        _viewHouse.buttonUnderway.visible = false;
//
//        switch (state)
//        {
//            case EHouseVillageState.EHVS_CLOSED:
//            {
//                _viewHouse.buttonClosed.visible = true;
//
//                _viewHouse.gotoAndStop(0);
//
//                break;
//            }
//            case EHouseVillageState.EHVS_BUILD:
//            {
//                _viewHouse.gotoAndStop(level);
//
//                break;
//            }
//            case EHouseVillageState.EHVS_OPEN:
//            {
//                _viewHouse.buttonOpen.visible = true;
//
//                _viewHouse.gotoAndStop(level);
//
//                break;
//            }
//            case EHouseVillageState.EHVS_UNDERWWAY:
//            {
//                _viewHouse.buttonUnderway.visible = true;
//
//                _viewHouse.gotoAndStop(level);
//
//                break;
//            }
//        }
//    }
}
}
