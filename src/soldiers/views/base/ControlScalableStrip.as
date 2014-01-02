/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/3/13
 * Time: 11:51 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.base
{
import views.IView;
import views.implementations.ViewBase;

import flash.display.Sprite;

import soldiers.GameInfo;

public class ControlScalableStrip extends ViewBase
{
    /*
     * Fields
     */
    private var _sourceView:Sprite;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlScalableStrip(parent:IView)
    {
        _sourceView = new Sprite();
        super(parent, _sourceView);

        init();
    }

    private function init():void
    {
        _sourceView.graphics.beginFill(0x000000, 0.8);
        _sourceView.graphics.drawRect(0, 0, GameInfo.instance.managerApp.applicationSize.x, 45);
        _sourceView.graphics.endFill();
    }

    /*
     * IControl
     */

    //TODO: implement when fullscreen
//    public override function onDisplayStateChanged(isFullScreenNow:Boolean):void
//    {
//        sourceView.width = GameInfo.instance.managerApp.applicationSize.x;
//    }
}
}
