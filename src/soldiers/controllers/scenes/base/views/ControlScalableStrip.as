/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/3/13
 * Time: 11:51 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.scenes.base.views
{
import controls.IControlScene;
import controls.implementations.ControlBase;

import flash.display.Sprite;

import soldiers.models.GameInfo;

public class ControlScalableStrip extends ControlBase
{
    /*
     * Fields
     */
    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlScalableStrip(sceneOwner:IControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        var background:Sprite = new Sprite();
        background.graphics.beginFill(0x000000, 0.8);
        background.graphics.drawRect(0, 0, GameInfo.instance.managerApp.applicationSize.x, 45);
        background.graphics.endFill();

        setSourceView(background);
    }

    /*
     * IControl
     */


    public override function onDisplayStateChanged(isFullScreenNow:Boolean):void
    {
        super.onDisplayStateChanged(isFullScreenNow);

        sourceView.width = GameInfo.instance.managerApp.applicationSize.x;
    }
}
}
