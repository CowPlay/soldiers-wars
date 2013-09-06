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

import controllers.EPopupType;

import controllers.scenes.base.ControlSceneBase;
import controllers.ESceneType;
import controllers.scenes.base.views.ControlScalableStrip;
import controllers.scenes.village.views.ControlPopupHouse;

import core.Utils;
import core.controls.ControlScene;
import core.controls.ControlScroll;

import flash.events.MouseEvent;
import flash.filters.GlowFilter;

import models.managerVillage.Houses.base.EHouseVillageType;

public class ControlSceneVillage extends ControlSceneBase
{
    /*
     * Fields
     */
    //scene
    private var _sceneView:gSceneVillage;
    private var _rootViewScroll:ControlScroll;

    //ui
    private var _popupHouse:ControlPopupHouse;

    protected var _controlBottomStrip:ControlScalableStrip;

    protected var _controlBottom:gControlBottom;
    protected var _controlMultiplayer:gControlMultiPlayer;
    protected var _controlSingleplayer:gControlSinglePlayer;
    protected var _controlAddFriend:gControlAddFriend;


    /*
     * Properties
     */

    public override function get type():String
    {
        return ESceneType.EST_VILLAGE;
    }

    /*
     * Events
     */

    protected override function prepareViews():void
    {
        super.prepareViews();

        _sceneView = new gSceneVillage();

        _rootViewScroll = new ControlScroll(_sceneView, appHelper.applicationSize, this);

        _layerScene.addChild(_rootViewScroll);

        villageManager.getHouseByType(EHouseVillageType.EHVT_ALTAR).view = _sceneView.buttonHouseAltar;
        _sceneView.buttonHouseAltar.filters = [new GlowFilter(0x00CC00)];

        villageManager.getHouseByType(EHouseVillageType.EHVT_MINE_GOLD).view = _sceneView.buttonHouseMineGold;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_CASTLE).view = _sceneView.buttonHouseCastle;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_MARKET).view = _sceneView.buttonHouseMarket;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_MILITARY_ACADEMY).view = _sceneView.buttonHouseMilitaryAcademy;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_TAVERN).view = _sceneView.buttonHouseTavern;

        addEventListener(MouseEvent.CLICK, onClick);

        {//controls

            _controlBottomStrip = new ControlScalableStrip(this);
            _layerUI.addChild(_controlBottomStrip);

            _controlBottom = new gControlBottom();
            _layerUI.addChild(_controlBottom);

            _controlMultiplayer = new gControlMultiPlayer();
            _layerUI.addChild(_controlMultiplayer);

            _controlSingleplayer = new gControlSinglePlayer();
            _layerUI.addChild(_controlSingleplayer);

            _controlAddFriend = new gControlAddFriend();
            _layerUI.addChild(_controlAddFriend);
        }

        _popupHouse = new ControlPopupHouse(this);
        _popupHouse.hide(null, 0);
        _layerPopups.addChild(_popupHouse);
    }


    private function updateViewsPositions():void
    {
        Utils.alignHorizontalAbsolute(_controlMultiplayer, 0.2, 0.5);
        Utils.alignVerticalAbsolute(_controlMultiplayer, 1, 1);

        Utils.alignHorizontalAbsolute(_controlBottom, 0.5, 0.5);
        Utils.alignVerticalAbsolute(_controlBottom, 1, 1);

        Utils.alignHorizontalAbsolute(_controlSingleplayer, 0.8, 0.5);
        Utils.alignVerticalAbsolute(_controlSingleplayer, 1, 1);

        Utils.alignVerticalAbsolute(_controlBottomStrip, 1, 1);

        Utils.alignHorizontalAbsolute(_controlAddFriend, 0.05, 0.5);
        Utils.alignVerticalAbsolute(_controlAddFriend, 1, 1.2);
    }

    public function onClick(e:MouseEvent):void
    {
        if(sceneOwner.currentPopup == null)
        {
            showPopup(EPopupType.EPT_VILLAGE_HOUSE);
        }
    }

    public static function didButtonChangeSceneClicked():void
    {
        ControlScene.setScene(ESceneType.EST_GAME_MAP);
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControlSceneVillage()
    {
        TweenPlugin.activate([ScrollRectPlugin]);
    }

    //! Destructor
    public override function cleanup():void
    {
        removeChild(_sceneView);
        _sceneView = null;

        super.cleanup();
    }

    //! Load resources here
    protected override function loadResources():void
    {
    }

    /*
     * IControl
     */

    //! Place all views here
    public override function placeViews():void
    {
        super.placeViews();

        updateViewsPositions();
    }

    public override function onDisplayStateChanged(isFullScreenNow:Boolean):void
    {
        super.onDisplayStateChanged(isFullScreenNow);

        _rootViewScroll.containerSize = appHelper.applicationSize;

        updateViewsPositions();
    }


}
}
