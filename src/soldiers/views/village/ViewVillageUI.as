/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/7/13
 * Time: 4:17 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.village
{
import controllers.IController;

import views.EViewPosition;

import views.IView;
import views.IViewButton;
import views.implementations.ViewBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.geom.Point;

public class ViewVillageUI extends ViewBase
{
    /*
     * Fields
     */
    private var _sourceView:DisplayObjectContainer;


    private var _viewBottom:IView;
    private var _viewMultiplayer:IView;
    private var _controlBottomStrip:IView;

    private var _buttonSingleplayer:IViewButton;
    private var _viewSingleplayer:IView;
    /*
     * Properties
     */

    public function get buttonMultiplayer():IView
    {
        return null;
    }

    public function get buttonSingleplayer():IViewButton
    {
        return _buttonSingleplayer;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ViewVillageUI(controller:IController)
    {
        _sourceView = new Sprite();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
//        TODO: implement
//        var sourceSingleplayer:gViewSinglePlayer = new gViewSinglePlayer();
//        _buttonSingleplayer = new ViewButton(controller, sourceSingleplayer.buttonSinglePlayer);

//        _viewSingleplayer = new ControlBase(controller, sourceSingleplayer);

        _sourceView.addChild(_viewSingleplayer.source);

        //TODO: implement
//        _controlBottomStrip = new ControlScalableStrip(this);
//        _sourceView.addChild(_controlBottomStrip.sourceView);
//
//        _controlBottom = new ControlSprite(this, new gControlBottom());
//        _sourceView.addChild(_controlBottom.sourceView);
//
//        _controlMultiplayer = new ControlMultiplayer(this);
////        _controlMultiplayer.actionDelegate = this;
//        _sourceView.addChild(_controlMultiplayer.sourceView);
//

//
//        _controlAddFriend = new ControlSprite(this, new gControlAddFriend());
//        _sourceView.addChild(_controlAddFriend.sourceView);

    }


    //TODO: implement when fullscreen
//    public override function onDisplayStateChanged(isFullScreenNow:Boolean):void
//    {
//        Utils.alignHorizontalAbsolute(_controlMultiplayer.sourceView, 0.2, 0.5);
//        Utils.alignVerticalAbsolute(_controlMultiplayer.sourceView, 1, 1);
//
//        Utils.alignHorizontalAbsolute(_controlBottom.sourceView, 0.5, 0.5);
//        Utils.alignVerticalAbsolute(_controlBottom.sourceView, 1, 1);
//

//
//        Utils.alignVerticalAbsolute(_controlBottomStrip.sourceView, 1, 1);
//
//        Utils.alignHorizontalAbsolute(_controlAddFriend.sourceView, 0.05, 0.5);
//        Utils.alignVerticalAbsolute(_controlAddFriend.sourceView, 1, 1.2);
//    }


    public override function placeViews(isFullscreen:Boolean):void
    {
        _viewSingleplayer.anchorPoint = new Point(0.5, 1);
        _viewSingleplayer.position = EViewPosition.EVP_ABSOLUTE;
        _viewSingleplayer.translate(0.66, 1);


        super.placeViews(isFullscreen);
    }
}
}
