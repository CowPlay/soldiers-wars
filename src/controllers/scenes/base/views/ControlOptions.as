/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/3/13
 * Time: 9:38 AM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.base.views
{
import controls.IControlScene;
import controls.implementations.ControlBase;

import flash.events.MouseEvent;

import models.GameInfo;

public class ControlOptions extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceViewTyped:gControlOptions;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlOptions(sceneOwner:IControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gControlOptions();
        setSourceView(_sourceViewTyped);

        _sourceViewTyped.buttonFullscreen.addEventListener(MouseEvent.CLICK, onButtonFullscreenClicked);
    }

    private function onButtonFullscreenClicked(e:MouseEvent):void
    {
        GameInfo.Instance.managerApp.fullScreenEnable = !GameInfo.Instance.managerApp.fullScreenEnable;
    }

    /*
     * IDisposable
     */


    public override function cleanup():void
    {
        _sourceViewTyped = null;

        super.cleanup();
    }
}
}
