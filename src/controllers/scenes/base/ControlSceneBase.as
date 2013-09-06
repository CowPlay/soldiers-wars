/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/4/13
 * Time: 3:36 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.base
{
import controllers.scenes.base.views.ControlOptions;
import controllers.scenes.base.views.ControlPlayerInfo;
import controllers.scenes.base.views.ControlScalableStrip;

import core.Utils;
import core.controls.ControlScene;
import core.models.resources.LoaderSWF;

import flash.display.MovieClip;

import models.GameInfoSoldiers;
import models.managerVillage.VillageManager;

public class ControlSceneBase extends ControlScene
{
    /*
     * Static fields
     */

    private static var _gameInfoSoldiers:GameInfoSoldiers;
    private static var _villageManager:VillageManager;

    /*
     * Static properties
     */
    public static function get villageManager():VillageManager
    {
        return _villageManager;
    }


    /*
     * Fields
     */

    //ui
    protected var _controlGameName:gControlGameName;

    protected var _controlStripTop:ControlScalableStrip;

    private var _controlOptions:ControlOptions;
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
        if (_gameInfoSoldiers == null)
        {
            _gameInfoSoldiers = GameInfoSoldiers.Instance;
            _villageManager = _gameInfoSoldiers.villageManager;
        }
    }


    protected override function prepareViews():void
    {
      super.prepareViews();

        {//ui
            _controlGameName = new gControlGameName();
            _layerUI.addChild(_controlGameName);

            //control strip
            _controlStripTop = new ControlScalableStrip(this);
            _layerUI.addChild(_controlStripTop);

            _controlOptions = new ControlOptions(sceneOwner);
            _layerUI.addChild(_controlOptions);

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
        Utils.alignHorizontalAbsolute(_controlPlayerInfo, 0.1);
        Utils.alignHorizontalAbsolute(_controlOptions, 0.9, 0.5);
    }

    public override function placeViews():void
    {
        super.placeViews();

        placeViewsWithChildren(_layerScene);
        placeViewsWithChildren(_layerUI);

        _controlStripTop.y = _controlGameName.height;

        _controlPlayerInfo.y = _controlStripTop.y + _controlStripTop.height - _controlPlayerInfo.height / 2;

        _controlOptions.y = _controlStripTop.y + (_controlStripTop.height / 2) - _controlOptions.height / 2;

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

        _controlGameName = null;
        _controlOptions = null;
        _controlPlayerInfo = null;
        _controlStripTop = null;

        super.cleanup();
    }
}
}
