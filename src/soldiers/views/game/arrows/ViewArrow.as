/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/5/13
 * Time: 2:11 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.arrows
{
import controllers.IController;

import controls.implementations.ControlBase;

import flash.events.MouseEvent;
import flash.geom.Point;

import soldiers.models.GameInfo;
import soldiers.models.game.managerPath.GridCell;
import soldiers.models.housesGame.base.HouseG;

public class ViewArrow extends ControlBase
{
    /*
     * Fields
     */
    private var _entry:HouseG;

    private var _sourceView:gSelectArrow;

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
    public function ViewArrow(contoller:IController, entry:HouseG)
    {
        _sourceView = new gSelectArrow();
        super(contoller, _sourceView);

        Debug.assert(entry != null);
        _entry = entry;

        init();
    }

    private function init():void
    {
        _rootViewWidth = _sourceView.width;

        handleEvents(false, true);
    }

    public function updateArrowSize(e:MouseEvent):void
    {
        var rootViewPositionAbsolute:Point = _sourceView.parent.localToGlobal(new Point(_sourceView.x, _sourceView.y));

        var point:Point = new Point(e.stageX, e.stageY);

        _sourceView.scaleX = -Math.sqrt(Math.pow((point.x - rootViewPositionAbsolute.x), 2) + Math.pow((point.y - rootViewPositionAbsolute.y), 2)) / _rootViewWidth;

        _sourceView.rotation = Math.atan2(rootViewPositionAbsolute.y - point.y, rootViewPositionAbsolute.x - point.x) / Math.PI * 180;
    }

    public override function placeViews(fullscreen:Boolean):void
    {
        super.placeViews(fullscreen);

        var cellEntry:GridCell = GameInfo.instance.managerGame.managerPath.getCell(_entry.positionCurrent);

        x = cellEntry.view.x;
        y = cellEntry.view.y;
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

}
}
