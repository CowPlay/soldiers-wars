/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/4/13
 * Time: 3:36 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.base
{
import controllers.scenes.base.views.ControlPlayerInfo;
import controllers.scenes.base.views.ControlStripTop;

import core.Utils;
import core.controls.ControlScene;
import core.models.resources.LoaderSWF;

import flash.display.MovieClip;

public class ControlSceneBase extends ControlScene
{
    /*
     * Fields
     */

    protected var _layerScene:MovieClip;
    protected var _layerUI:MovieClip;

    //ui
    protected var _controlGameName:gControlGameName;

    protected var _controlStripTop:ControlStripTop;
    protected var _controlPlayerInfo:ControlPlayerInfo;

    protected var _resourceLoaderBase:LoaderSWF;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlSceneBase()
    {
    }


    protected override function prepareViews():void
    {
        _layerScene = new MovieClip();
        addChild(_layerScene);

        _layerUI = new MovieClip();
        addChild(_layerUI);

        {//ui

            _controlGameName = new gControlGameName();
            _layerUI.addChild(_controlGameName);

            //control strip
            _controlStripTop = new ControlStripTop(this);
            _layerUI.addChild(_controlStripTop);


            _controlPlayerInfo = new ControlPlayerInfo(this);
            _layerUI.addChild(_controlPlayerInfo);
        }
    }

    /*
     * IControl
     */

    public override function onDisplayStateChanged(isFullScreenNow:Boolean):void
    {
        super.onDisplayStateChanged(isFullScreenNow);

        onDisplayStateChangedWithChildren(isFullScreenNow, _layerScene);
        onDisplayStateChangedWithChildren(isFullScreenNow, _layerUI);

        updateViewsPositions();
    }

    private function updateViewsPositions():void
    {
        Utils.alignHorizontal(_controlPlayerInfo, 0.1);
    }

    public override function placeViews():void
    {
        super.placeViews();

        placeViewsWithChildren(_layerScene);
        placeViewsWithChildren(_layerUI);

        _controlStripTop.y = _controlGameName.height;

        _controlPlayerInfo.y = _controlStripTop.y + _controlStripTop.height - _controlPlayerInfo.height / 2;

        updateViewsPositions();
    }

    /*
     * IDisposable
     */

    public override function cleanup():void
    {
        _resourceLoaderBase.cleanup();
        _resourceLoaderBase = null;

        cleanupWithChildren(_layerScene);
        _layerScene = null;
        cleanupWithChildren(_layerUI);
        _layerUI = null;

        super.cleanup();
    }
}
}
