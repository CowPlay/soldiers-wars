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
import core.controls.ControlScene;

import core.Debug;

import flash.events.MouseEvent;

import core.models.GameInfo;

public class ControlOptions extends ControlBase
{
    /*
     * Fields
     */
    private var _rootView:gControlOptions;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlOptions(sceneOwner:ControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _rootView = new gControlOptions();
        addChild(_rootView);

        _rootView.buttonFullscreen.addEventListener(MouseEvent.CLICK, onButtonFullscreenClicked);


    }

    private function onButtonFullscreenClicked(e:MouseEvent):void
    {
        GameInfo.Instance.appHelper.fullScreenEnable = !GameInfo.Instance.appHelper.fullScreenEnable;
    }

    /*
     * IDisposable
     */


    public override function cleanup():void
    {
        removeChild(_rootView);
        _rootView = null;

        super.cleanup();
    }
}
}
