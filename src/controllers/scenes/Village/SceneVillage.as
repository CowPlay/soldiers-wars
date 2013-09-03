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

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.filters.GlowFilter;

import models.gameInfo.VillageManager.Houses.base.EHouseVillageType;

public class SceneVillage extends SceneBase
{
    /*
     * Fields
     */
    //scene
    private var _sceneView:gSceneVillage;
    private var _rootViewScroll:ScrollContainer;

    //ui
    private var _popup:gPopup;


    protected var _controlBottomStrip:Sprite;

    protected var _controlBottom:gControlBottom;
    protected var _controlMultiplayer:gControlMultiPlayer;
    protected var _controlSingleplayer:gControlSinglePlayer;


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

        _sceneView = new gSceneVillage();

        _rootViewScroll = new ScrollContainer(_sceneView, _appHelper.applicationSize);

        _layerScene.addChild(_rootViewScroll);

        _villageManager.getHouseByType(EHouseVillageType.EHVT_ALTAR).view = _sceneView.buttonHouseAltar;
        _sceneView.buttonHouseAltar.filters = [new GlowFilter(0x00CC00)];

        _villageManager.getHouseByType(EHouseVillageType.EHVT_MINE_GOLD).view = _sceneView.buttonHouseMineGold;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_CASTLE).view = _sceneView.buttonHouseCastle;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_MARKET).view = _sceneView.buttonHouseMarket;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_MILITARY_ACADEMY).view = _sceneView.buttonHouseMilitaryAcademy;
//        GameInfo.Instance.villageManager.getHouseByType(EHouseVillageType.EHVT_TAVERN).view = _sceneView.buttonHouseTavern;

        addEventListener(MouseEvent.CLICK, onClick);


        {//bottom strip

            _controlBottomStrip = new Sprite();

            _controlBottomStrip.graphics.beginFill(0x000000, 0.8);
            _controlBottomStrip.graphics.drawRect(0, 0, _appHelper.screenResolution.x, 45);
            _controlBottomStrip.graphics.endFill();

            _layerUI.addChild(_controlBottomStrip);
        }

        {//controls
            _controlBottom = new gControlBottom();
            _layerUI.addChild(_controlBottom);

            _controlMultiplayer = new gControlMultiPlayer();
            _layerUI.addChild(_controlMultiplayer);

            _controlSingleplayer = new gControlSinglePlayer();
            _layerUI.addChild(_controlSingleplayer);
        }

        _popup = new gPopup();
        _popup.gotoAndStop(0);
        _layerUI.addChild(_popup);
    }

    //! Place all views here
    protected override function placeViews():void
    {
        super.placeViews();

        updateViewsPositions();

        //hide popup
        _popup.visible = false;
        _popup.y = -_popup.height;
    }

    private function updateViewsPositions():void
    {
        _popup.x = _appHelper.applicationSize.x / 2 - _popup.width / 2;


        alignHorizontal(_controlMultiplayer, 0.2, 0.5);
        alignVertical(_controlMultiplayer, 1, 1);

        alignHorizontal(_controlBottom, 0.5, 0.5);
        alignVertical(_controlBottom, 1, 1);

        alignHorizontal(_controlSingleplayer, 0.8, 0.5);
        alignVertical(_controlSingleplayer, 1, 1);

        alignVertical(_controlBottomStrip, 1, 1);
    }

    public function onClick(e:MouseEvent):void
    {
        _appHelper.fullScreenEnable = !_appHelper.fullScreenEnable;

//        _popup.visible = true;
//        TweenLite.to(_popup, 1.25, { y: -_popup.height * 0.1, ease: Back.easeOut});
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
        removeChild(_sceneView);
        _sceneView = null;

        super.cleanup();
    }

    //! Load resources here
    protected override function loadResources():void
    {
    }

    /*
     * Event handlers
     */

    public override function onDisplayStateChanged(isFullScreenNow:Boolean):void
    {
        super.onDisplayStateChanged(isFullScreenNow);

        _rootViewScroll.containerSize = isFullScreenNow ? _appHelper.screenResolution : _appHelper.applicationSize;

        updateViewsPositions();
    }
}
}
