/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/3/13
 * Time: 11:51 AM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.base.views
{
import core.controls.ControlBase;
import controllers.scenes.base.ControlScene;

import core.Debug;
import core.Utils;

import flash.display.Sprite;

public class ControlStripTop extends ControlBase
{
    /*
     * Fields
     */
    private var _rootView:Sprite;
    private var _controlOptions:ControlOptions;


    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlStripTop(sceneOwner:ControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _rootView = new Sprite();
        addChild(_rootView);

        _rootView.graphics.beginFill(0x000000, 0.8);
        _rootView.graphics.drawRect(0, 0, ControlScene.appHelper.screenResolution.x, 45);
        _rootView.graphics.endFill();

        _controlOptions = new ControlOptions(this, sceneOwner);
        _rootView.addChild(_controlOptions);
    }

    /*
     * IControl
     */


    public override function onDisplayStateChanged(isFullScreenNow:Boolean):void
    {
        super.onDisplayStateChanged(isFullScreenNow);

        Utils.alignHorizontal(_controlOptions, 0.9, 0.5);
    }

    public override function placeViews():void
    {
        super.placeViews();

        _controlOptions.y = _rootView.height / 2 - _controlOptions.height / 2;

        onDisplayStateChanged(false);
    }

    /*
     * IDisposable
     */

    public override function cleanup():void
    {
        Debug.assert(false, "TODO: implement");

        super.cleanup();
    }
}
}
