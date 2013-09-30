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
package controllers.scenes.village
{
import controls.IControlScene;
import controls.implementations.ControlBase;

import flash.filters.GlowFilter;

import models.GameInfo;

import models.village.Houses.base.EHouseVillageType;

public class ControlSceneVillageView extends ControlBase
{
    /*
     * Fields
     */
//    private var _sourceViewTyped:gSceneVillage;
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
//        _sourceViewTyped = new gSceneVillage();
//        setSourceView(_sourceViewTyped);
//
//        GameInfo.Instance.managerVillage.getHouseByType(EHouseVillageType.EHVT_ALTAR).view = _sourceViewTyped.buttonHouseAltar;
//        _sourceViewTyped.buttonHouseAltar.filters = [new GlowFilter(0x00CC00)];
//
//        GameInfo.Instance.managerVillage.getHouseByType(EHouseVillageType.EHVT_MINE_GOLD).view = _sourceViewTyped.buttonHouseMineGold;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_CASTLE).view = _sceneView.buttonHouseCastle;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_MARKET).view = _sceneView.buttonHouseMarket;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_MILITARY_ACADEMY).view = _sceneView.buttonHouseMilitaryAcademy;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_TAVERN).view = _sceneView.buttonHouseTavern;
    }
}
}
