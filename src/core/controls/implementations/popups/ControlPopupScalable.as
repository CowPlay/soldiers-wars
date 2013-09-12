/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/10/13
 * Time: 7:12 PM
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

public class ControlPopupScalable extends ControlPopupBase
{
    /*
     * Fields
     */
    private var _sourceViewSize:Point;
    /*
     * Properties
     */

    /*
     * Properties
     */

    public override function get positionShow():Point
    {
        return new Point(GameInfoBase.Instance.managerApp.applicationSize.x / 2 - _sourceViewSize.x / 2,
                GameInfoBase.Instance.managerApp.applicationSize.y / 2 - _sourceViewSize.y / 2);
    }

    public override function get positionHide():Point
    {
        return new Point(GameInfoBase.Instance.managerApp.applicationSize.x / 2,
                GameInfoBase.Instance.managerApp.applicationSize.y / 2);
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControlPopupScalable(sceneOwner:IControlScene)
    {
        super(sceneOwner);
    }

    public override function show(onComplete:Function, delay:Number):void
    {
        super.show(onComplete, delay);

        var filters:Array = [new BlurFilter()];

        if (sceneOwner.layerScene != null)
            sceneOwner.layerScene.filters = filters;

        if (sceneOwner.layerUI != null)
            sceneOwner.layerUI.filters = filters;

        var params:Object =
        {
            scaleX: 1,
            scaleY: 1,
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

        var paramsTarget:Object =
        {
            scaleX: 0,
            scaleY: 0,
            x: positionHide.x,
            y: positionHide.y,
            ease: Back.easeIn,
            onComplete: onHideComplete
        };

        TweenLite.to(sourceView, delay, paramsTarget);
    }

    protected override function onHideComplete():void
    {
        if (sceneOwner.layerScene != null)
            sceneOwner.layerScene.filters = [];

        if (sceneOwner.layerUI != null)
            sceneOwner.layerUI.filters = [];

        super.onHideComplete();
    }

    public override function placeViews():void
    {
        super.placeViews();

        _sourceViewSize = new Point(sourceView.width, sourceView.height);
    }
}
}
