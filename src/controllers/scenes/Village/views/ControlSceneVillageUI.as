/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/1/13
 * Time: 1:08 AM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.village.views
{
import controllers.scenes.base.views.ControlScalableStrip;

import controls.IControl;
import controls.IControlScene;
import controls.implementations.ControlBase;
import controls.implementations.ControlSpriteBase;
import controls.implementations.buttons.ControlButtonBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.MouseEvent;

import models.GameInfo;

import utils.Utils;

public class ControlSceneVillageUI extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceViewTyped:DisplayObjectContainer;

    //ui
    protected var _controlBottomStrip:IControl;

    protected var _controlBottom:IControl;
    protected var _controlMultiplayer:IControl;
    protected var _controlSingleplayer:IControl;
    protected var _controlAddFriend:IControl;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlSceneVillageUI(sceneOwner:IControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _sourceViewTyped = new Sprite();
        setSourceView(_sourceViewTyped);

        _controlBottomStrip = new ControlScalableStrip(sceneOwner);
        _sourceViewTyped.addChild(_controlBottomStrip.sourceView);

        _controlBottom = new ControlSpriteBase(sceneOwner, new gControlBottom());
        _sourceViewTyped.addChild(_controlBottom.sourceView);

        _controlMultiplayer = new ControlMultiplayer(sceneOwner);
        _sourceViewTyped.addChild(_controlMultiplayer.sourceView);

        _controlSingleplayer = new ControlSpriteBase(sceneOwner, new gControlSinglePlayer());
        _controlSingleplayer.actionDelegate = this;
        _sourceViewTyped.addChild(_controlSingleplayer.sourceView);

        _controlAddFriend = new ControlSpriteBase(sceneOwner, new gControlAddFriend());
        _sourceViewTyped.addChild(_controlAddFriend.sourceView);

    }

    public override function onDisplayStateChanged(isFullScreenNow:Boolean):void
    {
        super.onDisplayStateChanged(isFullScreenNow);

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

    public override function placeViews():void
    {
        super.placeViews();

        onDisplayStateChanged(false);
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
                case _controlSingleplayer:
                {
                    GameInfo.instance.startStubGame();

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

    /*
     * IDisposable
     */

    public override function cleanup():void
    {
        _controlBottomStrip.cleanup();
        _controlBottomStrip = null;

        _controlBottom.cleanup();
        _controlBottom = null;

        _controlMultiplayer.cleanup();
        _controlMultiplayer = null;

        _controlSingleplayer.cleanup();
        _controlSingleplayer = null;

        _controlAddFriend.cleanup();
        _controlAddFriend = null;

        _sourceViewTyped = null;

        super.cleanup();
    }
}
}
