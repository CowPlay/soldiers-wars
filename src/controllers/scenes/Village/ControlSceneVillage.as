/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/21/13
 * Time: 1:48 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.village
{
import controllers.EPopupType;
import controllers.ESceneType;
import controllers.popups.houseVillage.ControlPopupHouse;
import controllers.scenes.base.ControlSceneGameBase;
import controllers.scenes.base.views.ControlScalableStrip;

import core.controls.IControl;
import core.controls.IControlScroll;
import core.controls.implementations.ControlScrollBase;
import core.controls.implementations.ControlSpriteBase;
import core.utils.Utils;

import flash.events.MouseEvent;
import flash.filters.GlowFilter;

import models.village.Houses.base.EHouseVillageType;

public class ControlSceneVillage extends ControlSceneGameBase
{
    /*
     * Fields
     */
    //scene
    private var _sceneView:IControl;
    private var _rootViewScroll:IControlScroll;

    //ui
    protected var _controlBottomStrip:IControl;

    protected var _controlBottom:IControl;
    protected var _controlMultiplayer:IControl;
    protected var _controlSingleplayer:IControl;
    protected var _controlAddFriend:IControl;


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

    public override function prepareLayerScene():void
    {
        super.prepareLayerScene();

        _sceneView = new ControlSceneVillageView(this);
        registerControlScene(_sceneView);

        _rootViewScroll = new ControlScrollBase(this, _sceneView.sourceView, _managerApp.applicationSize);
        registerControlScene(_rootViewScroll);



        addEventListener(MouseEvent.CLICK, onClick);
    }

    public override function prepareLayerUI():void
    {
        super.prepareLayerUI();

        {//controls

            _controlBottomStrip = new ControlScalableStrip(this);
            registerControlUI(_controlBottomStrip);

            _controlBottom = new ControlSpriteBase(this, new gControlBottom());
            registerControlUI(_controlBottom);

            _controlMultiplayer = new ControlSpriteBase(this, new gControlMultiPlayer());
            registerControlUI(_controlMultiplayer);

            _controlSingleplayer = new ControlSpriteBase(this, new gControlSinglePlayer());
            registerControlUI(_controlSingleplayer);

            _controlAddFriend = new ControlSpriteBase(this, new gControlAddFriend());
            registerControlUI(_controlAddFriend);
        }
    }

    public override function prepareLayerPopups():void
    {
        super.prepareLayerPopups();

        registerControlPopup(new ControlPopupHouse(this));
    }


    private function updateViewsPositions():void
    {
        Utils.alignHorizontalAbsolute(_controlMultiplayer.sourceView, 0.2, 0.5);
        Utils.alignVerticalAbsolute(_controlMultiplayer.sourceView, 1, 1);

        Utils.alignHorizontalAbsolute(_controlBottom.sourceView, 0.5, 0.5);
        Utils.alignVerticalAbsolute(_controlBottom.sourceView, 1, 1);

        Utils.alignHorizontalAbsolute(_controlSingleplayer.sourceView, 0.8, 0.5);
        Utils.alignVerticalAbsolute(_controlSingleplayer.sourceView, 1, 1);

        Utils.alignVerticalAbsolute(_controlBottomStrip.sourceView, 1, 1);

        Utils.alignHorizontalAbsolute(_controlAddFriend.sourceView, 0.05, 0.5);
        Utils.alignVerticalAbsolute(_controlAddFriend.sourceView, 1, 1.2);
    }

    public function onClick(e:MouseEvent):void
    {
        if (sceneOwner.currentPopup == null)
        {
            showPopup(EPopupType.EPT_VILLAGE_HOUSE);
        }
        else
        {
            hidePopup();
        }
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControlSceneVillage()
    {
    }

    //! Destructor
    public override function cleanup():void
    {
        _sceneView = null;

        super.cleanup();
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

        _rootViewScroll.controlSize = _managerApp.applicationSize;

        updateViewsPositions();
    }


}
}
