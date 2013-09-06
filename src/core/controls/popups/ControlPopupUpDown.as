/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/5/13
 * Time: 5:02 PM
 * To change this template use File | Settings | File Templates.
 */
package core.controls.popups
{
import com.greensock.TweenLite;
import com.greensock.easing.Back;

import core.controls.ControlScene;
import core.models.GameInfo;

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
        return new Point(GameInfo.Instance.appHelper.applicationSize.x / 2 - width / 2,
                GameInfo.Instance.appHelper.applicationSize.y / 2 - height / 2);
    }

    public override function get positionHide():Point
    {
        return new Point(GameInfo.Instance.appHelper.applicationSize.x / 2 - width / 2, -height);
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControlPopupUpDown(sceneOwner:ControlScene)
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

        TweenLite.to(this, delay, params);
    }


    public override function hide(onComplete:Function, delay:Number):void
    {
        super.hide(onComplete, delay);

        var params:Object =
        {
            x: positionHide.x,
            y: positionHide.y,
            ease: Back.easeOut,
            onComplete: onHideComplete
        };

        TweenLite.to(this, delay, params);
    }

    protected override function onHideComplete():void
    {
        sceneOwner.layerScene.filters = [];
        sceneOwner.layerUI.filters = [];

        super.onHideComplete();
    }


}
}
