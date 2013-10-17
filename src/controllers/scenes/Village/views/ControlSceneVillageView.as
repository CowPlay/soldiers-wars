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
package controllers.scenes.village.views
{
import controllers.scenes.village.views.housesV.ControlHouseViewAltar;
import controllers.scenes.village.views.housesV.ControlVHouseView;

import controls.IControl;
import controls.IControlButton;

import controls.IControlScene;
import controls.IControlScroll;
import controls.implementations.ControlBase;
import controls.implementations.ControlScrollBase;
import controls.implementations.buttons.ControlButtonBase;

import flash.display.DisplayObjectContainer;

import models.GameInfo;
import models.data.housesV.base.EHouseVType;
import models.data.housesV.base.HouseInfoV;

public class ControlSceneVillageView extends ControlBase
{
    /*
     * Fields
     */
    private var _controlScroll:IControlScroll;
    private var _sourceViewTyped:gSceneVillage;
    private var _housesViews:Array;


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
        _housesViews = [];

        var houses:Array = GameInfo.instance.managerVillage.houses;
        for each(var house:HouseInfoV in houses)
        {
            var houseView:ControlVHouseView;

            switch (house.type)
            {
                case EHouseVType.EHVT_ALTAR:
                {
                    houseView = new ControlHouseViewAltar(sceneOwner, house, _sourceViewTyped.buttonHouseAltar);
                    break;
                }
                default :
                {
                    Debug.assert(false);
                    break;
                }
            }

            _housesViews.push(houseView);
        }
    }

    public override function onDisplayStateChanged(isFullScreenNow:Boolean):void
    {
        super.onDisplayStateChanged(isFullScreenNow);

        _controlScroll.controlSize = GameInfo.instance.managerApp.applicationSize;
    }

    public override function cleanup():void
    {
        for each(var houseView:IControl in _housesViews)
        {
            houseView.cleanup();
        }
        _housesViews.length = 0;

        _controlScroll.cleanup();
        _controlScroll = null;

        _sourceViewTyped = null;

        super.cleanup();
    }
}
}
