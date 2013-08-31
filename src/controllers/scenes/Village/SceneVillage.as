/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/21/13
 * Time: 1:48 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.Village
{
import controllers.scenes.Base.ESceneType;
import controllers.scenes.Base.SceneBase;

import core.Debug;

import flash.events.MouseEvent;

import models.gameInfo.GameInfo;
import models.gameInfo.VillageManager.Houses.EHouseVillageType;

import models.resources.ResourceLoader;

import models.resources.managers.ResourceManagerVillage;

public class SceneVillage extends SceneBase
{
    /*
     * Fields
     */
    private var _rootView:gSceneVillage;

    /*
     * Properties
     */

    public override function get type():ESceneType
    {
        return ESceneType.EST_VILLAGE;
    }

    /*
     * Events
     */

    protected override function prepareViews():void
    {
        super.prepareViews();

        _rootView = new gSceneVillage();
        addChild(_rootView);

        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_ALTAR).view = _rootView.buttonHouseAltar;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_CASTLE).view = _rootView.buttonHouseCastle;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_MARKET).view = _rootView.buttonHouseMarket;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_MILITARY_ACADEMY).view = _rootView.buttonHouseMilitaryAcademy;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_TAVERN).view = _rootView.buttonHouseTavern;
    }

    public static function didButtonChangeSceneClicked():void
    {
        SceneBase.setScene(ESceneType.EST_GAME_MAP);
    }

    /*
     * Methods
     */

    //! Default constructor
    public function SceneVillage()
    {
    }

    //! Destructor
    public override function cleanup():void
    {
        removeChild(_rootView);
        _rootView = null;

        super.cleanup();
    }

    //! Load resources here
    protected override function loadResources():void
    {
    }

    /*
     * Event handlers
     */
}
}
