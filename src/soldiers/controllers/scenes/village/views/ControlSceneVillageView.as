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
package soldiers.controllers.scenes.village.views
{

import controls.IControl;
import controls.IControlScene;
import controls.IControlScroll;
import controls.implementations.ControlBase;
import controls.implementations.ControlScrollBase;

import flash.display.DisplayObjectContainer;
import flash.events.MouseEvent;

import soldiers.controllers.EPopupType;
import soldiers.controllers.scenes.village.views.housesV.ControlHouseViewAltar;
import soldiers.controllers.scenes.village.views.housesV.ControlHouseViewBakery;
import soldiers.models.GameInfo;
import soldiers.models.housesVillage.base.EHouseTypeV;
import soldiers.models.housesVillage.base.HouseV;

public class ControlSceneVillageView extends ControlBase
{
    /*
     * Fields
     */
    private var _controlScroll:IControlScroll;
    private var _sourceViewTyped:gSceneVillage;

    private var _houseAltar:IControl;
    private var _houseBakery:IControl;


    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlSceneVillageView(sceneOwner:IControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gSceneVillage();
        _controlScroll = new ControlScrollBase(sceneOwner, _sourceViewTyped, GameInfo.instance.managerApp.applicationSize)

        setSourceView(_controlScroll.sourceView as DisplayObjectContainer);

//        GameInfo.Instance.managerVillage.getHouseByType(EHouseVillageType.EHVT_MINE_GOLD).view = _sourceViewTyped.buttonHouseMineGold;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_CASTLE).view = _sceneView.buttonHouseCastle;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_MARKET).view = _sceneView.buttonHouseMarket;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_MILITARY_ACADEMY).view = _sceneView.buttonHouseMilitaryAcademy;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_TAVERN).view = _sceneView.buttonHouseTavern;

        initHouses();
    }

    private function initHouses():void
    {
        var houses:Array = GameInfo.instance.managerHousesVillage.houses;
        for each(var house:HouseV in houses)
        {
            switch (house.type)
            {
                case EHouseTypeV.EHTV_ALTAR:
                {
                    _houseAltar = new ControlHouseViewAltar(sceneOwner, house, _sourceViewTyped.houseAltar);
                    _houseAltar.actionDelegate = this;

                    break;
                }
                case EHouseTypeV.EHTV_BAKERY:
                {
                    _houseBakery = new ControlHouseViewBakery(sceneOwner, house, _sourceViewTyped.houseBakery);
                    _houseBakery.actionDelegate = this;

                    break;
                }
                default :
                {
                    Debug.assert(false);
                    break;
                }
            }
        }
    }

    public override function onDisplayStateChanged(isFullScreenNow:Boolean):void
    {
        super.onDisplayStateChanged(isFullScreenNow);

        _controlScroll.controlSize = GameInfo.instance.managerApp.applicationSize;
    }

    public override function cleanup():void
    {
        _houseAltar.cleanup();
        _houseAltar = null;

        _houseBakery.cleanup();
        _houseBakery = null;

        _controlScroll.cleanup();
        _controlScroll = null;

        _sourceViewTyped = null;

        super.cleanup();
    }

    /*
     * IActionDelegate
     */
    public override function onControlMouseClick(target:IControl, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onControlMouseClick(target, e);

        if (!result)
        {
            switch (target)
            {
                case _houseBakery:
                {
                    sceneOwner.showPopup(EPopupType.EPT_VILLAGE_HOUSE_BAKERY);
                    result = true;
                    break;
                }
                default :
                {
                    Debug.assert(false);
                    break;
                }
            }
        }

        return result;
    }
}
}
