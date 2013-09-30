/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/5/13
 * Time: 2:11 AM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.game.views.arrows
{
import controls.EControlUpdateTypeBase;
import controls.IControlScene;
import controls.implementations.ControlBase;

import flash.events.MouseEvent;
import flash.geom.Point;

import utils.memory.UtilsMemory;

public class ControlArrow extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceViewTyped:gSelectArrow;

    private var _rootViewWidth:Number;

    /*
     * Properties
     */


//    public function get rootViewWidth():Number
//    {
//        return _rootViewWidth;
//    }
//
    /*
     * Methods
     */

    //! Default initializer
    public function ControlArrow(sceneOwner:IControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gSelectArrow();

        setSourceView(_sourceViewTyped);

        _rootViewWidth = _sourceViewTyped.width;

    }

    public function updateArrowSize(e:MouseEvent):void
    {
        var rootViewPositionAbsolute:Point = _sourceViewTyped.parent.localToGlobal(new Point(_sourceViewTyped.x, _sourceViewTyped.y));

        var point:Point = new Point(e.stageX, e.stageY);

        _sourceViewTyped.scaleX = -Math.sqrt(Math.pow((point.x - rootViewPositionAbsolute.x), 2) + Math.pow((point.y - rootViewPositionAbsolute.y), 2)) / _rootViewWidth;

        _sourceViewTyped.rotation = Math.atan2(rootViewPositionAbsolute.y - point.y, rootViewPositionAbsolute.x - point.x) / Math.PI * 180;
    }

    public override function update(type:String = ""):void
    {
        switch (type)
        {
            case EControlUpdateTypeBase.ECUT_MOUSE_MOVE:
            {
                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }
    }

//    public function show(isShow:Boolean):void
//    {
//        if (_rootView.visible == isShow)
//            return;
//
//        _rootView.visible = isShow;
//
//        _rootView.scaleX = isShow ? _rootView.scaleX : 0;
//    }
//
//    public function magnetizeFromTargetHouse(targetHouse:HouseBase):void
//    {
//        var rootViewPositionAbsolute:Point = _rootView.parent.localToGlobal(new Point(_rootView.x, _rootView.y));
//        _rootView.rotation = Math.atan2(rootViewPositionAbsolute.y - targetHouse.view.y, rootViewPositionAbsolute.x - targetHouse.view.x) / Math.PI * 180;
//
//        var ellipseHalfWidth:Number = 70;
//        var ellipseHalfHeight:Number = 30;
//
//        var fi:Number = _rootView.rotation;
//        var ellipseRadius:Number = ellipseHalfWidth * ellipseHalfHeight / Math.sqrt(Math.pow(ellipseHalfHeight, 2) * Math.pow(Math.cos(fi), 2) + Math.pow(ellipseHalfWidth, 2) * Math.pow(Math.sin(fi), 2));
//        _rootView.scaleX = (-Math.sqrt(Math.pow((rootViewPositionAbsolute.x - targetHouse.view.x), 2) + Math.pow((rootViewPositionAbsolute.y - targetHouse.view.y), 2)) + ellipseRadius) / _rootViewWidth;
//    }

    /*
     * IDisposable
     */

    public override function cleanup():void
    {
    }


}
}
