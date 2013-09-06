/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/3/13
 * Time: 11:51 AM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.base.views
{
import core.Utils;
import core.controls.ControlBase;
import core.controls.ControlScene;
import core.models.GameInfo;

import flash.display.Sprite;

public class ControlScalableStrip extends ControlBase
{
    /*
     * Fields
     */
    private var _background:Sprite;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlScalableStrip(sceneOwner:ControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _background = new Sprite();
        _background.graphics.beginFill(0x000000, 0.8);
        _background.graphics.drawRect(0, 0, GameInfo.Instance.appHelper.applicationSize.x, 45);
        _background.graphics.endFill();

        addChild(_background);
    }

    /*
     * IControl
     */


    public override function onDisplayStateChanged(isFullScreenNow:Boolean):void
    {
        super.onDisplayStateChanged(isFullScreenNow);

        _background.width = GameInfo.Instance.appHelper.applicationSize.x;
    }



    /*
     * IDisposable
     */

    public override function cleanup():void
    {

        removeChild(_background);
        _background = null;

        super.cleanup();
    }
}
}
