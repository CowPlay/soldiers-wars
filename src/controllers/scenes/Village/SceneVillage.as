/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/21/13
 * Time: 1:48 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.village
{
import com.greensock.plugins.ScrollRectPlugin;
import com.greensock.plugins.TweenPlugin;

import controllers.scenes.base.ESceneType;
import controllers.scenes.base.SceneBase;
import controllers.scenes.base.views.ScrollContainer;

import core.Utils;

import flash.filters.GlowFilter;

import flash.geom.Point;

import models.gameInfo.GameInfo;
import models.gameInfo.VillageManager.Houses.EHouseVillageType;

public class SceneVillage extends SceneBase
{
    /*
     * Fields
     */
    private var _rootView:gSceneVillage;
    private var _rootViewScroll:ScrollContainer;

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
        Utils.cacheAsBitmap(_rootView);

        _rootViewScroll = new ScrollContainer(_rootView, new Point(760, 700));

        addChild(_rootViewScroll);

        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_ALTAR).view = _rootView.buttonHouseAltar;

        _rootView.buttonHouseAltar.filters = [new GlowFilter(0x00CC00)];
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
        TweenPlugin.activate([ScrollRectPlugin]);
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
