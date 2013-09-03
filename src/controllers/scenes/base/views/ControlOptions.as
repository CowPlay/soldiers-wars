/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/3/13
 * Time: 9:38 AM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.base.views
{
import core.controls.ControlBase;
import controllers.scenes.base.ControlScene;

import core.Debug;

import flash.events.MouseEvent;

import models.gameInfo.GameInfo;

public class ControlOptions extends ControlBase
{
    /*
     * Fields
     */
    private var _controlOwner:ControlStripTop;
    private var _rootView:gControlOptions;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlOptions(controlOwner:ControlStripTop, sceneOwner:ControlScene)
    {
        super(sceneOwner);

        Debug.assert(controlOwner != null);
        _controlOwner = controlOwner;

        init();
    }

    private function init():void
    {
        _rootView = new gControlOptions();
        addChild(_rootView);

        _rootView.buttonFullscreen.addEventListener(MouseEvent.CLICK, onButtonFullscreenClicked);

    }

    private static function onButtonFullscreenClicked(e:MouseEvent):void
    {
        GameInfo.Instance.appHelper.fullScreenEnable = !GameInfo.Instance.appHelper.fullScreenEnable;
    }

    /*
     * IDisposable
     */


    public override function cleanup():void
    {
        _controlOwner = null;

        removeChild(_rootView);
        _rootView = null;

        super.cleanup();
    }
}
}
