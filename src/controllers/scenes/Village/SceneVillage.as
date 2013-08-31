/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/21/13
 * Time: 1:48 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.village
{
import com.greensock.TweenLite;
import com.greensock.plugins.ScrollRectPlugin;
import com.greensock.plugins.TweenPlugin;

import controllers.scenes.base.ESceneType;
import controllers.scenes.base.SceneBase;
import controllers.scenes.base.views.ScrollContainer;

import flash.display.StageDisplayState;

import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Rectangle;
import flash.ui.Multitouch;

import models.gameInfo.GameInfo;
import models.gameInfo.VillageManager.Houses.EHouseVillageType;

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
//        _rootView.scrollRect = new Rectangle(0, 0, 500, 500);


        var sc:ScrollContainer = new ScrollContainer(_rootView);

        addChild(sc);

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
