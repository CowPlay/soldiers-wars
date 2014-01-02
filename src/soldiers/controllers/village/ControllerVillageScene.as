/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/12/13
 * Time: 9:47 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.village
{

import controllers.implementations.Controller;

import views.IView;

import flash.events.MouseEvent;

import soldiers.GameInfo;
import soldiers.popups.EPopupType;
import soldiers.views.village.ViewVillageScene;

public class ControllerVillageScene extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewVillageScene;


    private var _houseAltar:IView;
    private var _houseBakery:IView;
    private var _houseMineGold:IView;


    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerVillageScene()
    {
        _view = new ViewVillageScene(this);
        super(_view);

        init();
    }

    private function init():void
    {

//        GameInfo.Instance.managerVillage.getHouseByType(EHouseVillageType.EHTV_MINE_GOLD).view = _sourceView.buttonHouseMineGold;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHTV_CASTLE).view = _sceneView.buttonHouseCastle;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHTV_MARKET).view = _sceneView.buttonHouseMarket;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHTV_MILITARY_ACADEMY).view = _sceneView.buttonHouseMilitaryAcademy;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHTV_TAVERN).view = _sceneView.buttonHouseTavern;

        //TODO: implement
//        initHouses();
    }

//    private function initHouses():void
//    {
//        var houses:Array = GameInfo.instance.managerHousesVillage.houses;
//        for each(var house:HouseV in houses)
//        {
//            switch (house.type)
//            {
//                case EHouseTypeV.EHTV_ALTAR:
//                {
//                    _houseAltar = new ControlHouseViewAltar(this, house, _sourceView.houseAltar);
////                    _houseAltar. actionDelegate = this;
//
//                    break;
//                }
//                case EHouseTypeV.EHTV_BAKERY:
//                {
//                    _houseBakery = new ControlHouseViewBakery(this, house, _sourceView.houseBakery);
////                    _houseBakery.actionDelegate = this;
//
//                    break;
//                }
//                case EHouseTypeV.EHTV_MINE_GOLD:
//                {
//                    _houseMineGold = new ControlHouseViewMineGold(this, house, _sourceView.houseMineGold);
////                    _houseMineGold.actionDelegate = this;
//
//                    break;
//                }
//                default :
//                {
//                    Debug.assert(false);
//                    break;
//                }
//            }
//        }
//    }

    public override function cleanup():void
    {
//        _houseAltar.cleanup();
//        _houseAltar = null;

        _houseBakery.cleanup();
        _houseBakery = null;

        _houseMineGold.cleanup();
        _houseMineGold = null;


        super.cleanup();
    }

    /*
     * IActionDelegate
     */
//    public override function onViewClicked(target:IView, e:MouseEvent):Boolean
//    {
//        var result:Boolean = super.onViewClicked(target, e);
//
//        if (!result)
//        {
//            switch (target)
//            {
//                case _houseBakery:
//                {
//
//                    GameInfo.instance.managerStates.currentState..showPopup(EPopupType.EPT_VILLAGE_HOUSE_BAKERY);
//                    result = true;
//                    break;
//                }
//                case _houseMineGold:
//                {
//                    GameInfo.instance.managerStates.currentState..showPopup(EPopupType.EPT_VILLAGE_HOUSE_MINE_GOLD);
//                    result = true;
//                    break;
//                }
//                default :
//                {
//                    Debug.assert(false);
//                    break;
//                }
//            }
//        }
//
//        return result;
//    }
}
}
