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

import controls.IControl;

import controls.implementations.ControlSceneBase;
import controls.implementations.ControlSpriteBase;

import models.GameInfo;
import models.village.ManagerVillage;

import utils.Utils;

public class ControlSceneGameBase extends ControlSceneBase
{
    /*
     * Static fields
     */

    private static var _gameInfoSoldiers:GameInfo;
    private static var _villageManager:ManagerVillage;

    /*
     * Static properties
     */
    public static function get villageManager():ManagerVillage
    {
        return _villageManager;
    }

    /*
     * Fields
     */

    //ui
    private var _controlOptions:IControl;

    protected var _controlGameName:IControl;
    protected var _controlStripTop:IControl;
    protected var _controlPlayerInfo:IControl;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlSceneGameBase()
    {
        if (_gameInfoSoldiers == null)
        {
            _gameInfoSoldiers = GameInfo.Instance;
            _villageManager = _gameInfoSoldiers.managerVillage;
        }
    }


    public override function prepareLayerUI():void
    {
        super.prepareLayerUI();

        {//ui
            _controlGameName = new ControlSpriteBase(this, new gControlGameName());
            registerControlUI(_controlGameName);

            //control strip
            _controlStripTop = new ControlScalableStrip(this);
            registerControlUI(_controlStripTop);

            _controlOptions = new ControlOptions(this);
            registerControlUI(_controlOptions);

            _controlPlayerInfo = new ControlPlayerInfo(this);
            registerControlUI(_controlPlayerInfo);
        }
    }

    /*
     * IControl
     */

    public override function onDisplayStateChanged(isFullScreenNow:Boolean):void
    {
        super.onDisplayStateChanged(isFullScreenNow);

        updateViewsPositions();
    }

    private function updateViewsPositions():void
    {
        Utils.alignHorizontalAbsolute(_controlPlayerInfo.sourceView, 0.1);
        Utils.alignHorizontalAbsolute(_controlOptions.sourceView, 0.9, 0.5);
    }

    public override function placeViews():void
    {
        super.placeViews();

        _controlStripTop.sourceView.y = _controlGameName.sourceView.height;

        _controlPlayerInfo.sourceView.y = _controlStripTop.sourceView.y + _controlStripTop.sourceView.height - _controlPlayerInfo.sourceView.height / 2;

        _controlOptions.sourceView.y = _controlStripTop.sourceView.y + (_controlStripTop.sourceView.height / 2) - _controlOptions.sourceView.height / 2;

        updateViewsPositions();
    }

    /*
     * IDisposable
     */

    public override function cleanup():void
    {
        _controlGameName = null;
        _controlOptions = null;
        _controlPlayerInfo = null;
        _controlStripTop = null;

        super.cleanup();
    }
}
}
