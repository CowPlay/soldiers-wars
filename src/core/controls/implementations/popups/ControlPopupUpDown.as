/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/5/13
 * Time: 5:02 PM
 * To change this template use File | Settings | File Templates.
 */
package core.controls.implementations.popups
{
import com.greensock.TweenLite;
import com.greensock.easing.Back;

import core.controls.IControlScene;
import core.controls.implementations.ControlPopupBase;
import core.models.GameInfoBase;

import flash.filters.BlurFilter;
import flash.geom.Point;

public class ControlPopupUpDown extends ControlPopupBase
{
    /*
     * Fields
     */


    /*
     * Properties
     */

    public override function get positionShow():Point
    {
        return new Point(GameInfoBase.Instance.managerApp.applicationSize.x / 2 - sourceView.width / 2,
                GameInfoBase.Instance.managerApp.applicationSize.y / 2 - sourceView.height / 2);
    }

    public override function get positionHide():Point
    {
        return new Point(GameInfoBase.Instance.managerApp.applicationSize.x / 2 - sourceView.width / 2, -sourceView.height);
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControlPopupUpDown(sceneOwner:IControlScene)
    {
        super(sceneOwner);
    }

    public override function show(onComplete:Function, delay:Number):void
    {
        super.show(onComplete, delay);

        var filters:Array = [new BlurFilter()];

        sceneOwner.layerScene.filters = filters;
        sceneOwner.layerUI.filters = filters;

        var params:Object =
        {
            x: positionShow.x,
            y: positionShow.y,
            ease: Back.easeOut,
            onComplete: onShowComplete
        };

        TweenLite.to(sourceView, delay, params);
    }


    public override function hide(onComplete:Function, delay:Number):void
    {
        super.hide(onComplete, delay);

        var params:Object =
        {
            x: positionHide.x,
            y: positionHide.y,
            ease: Back.easeIn,
            onComplete: onHideComplete
        };

        TweenLite.to(sourceView, delay, params);
    }

    protected override function onHideComplete():void
    {
        sceneOwner.layerScene.filters = [];
        sceneOwner.layerUI.filters = [];

        super.onHideComplete();
    }


}
}
