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

import flash.events.MouseEvent;
import flash.geom.Point;

import soldiers.GameInfo;
import soldiers.models.game.managerPath.GridCell;
import soldiers.models.housesGame.base.HouseG;

import views.implementations.ViewBase;

public class ViewArrow extends ViewBase
{
    /*
     * Fields
     */
    private var _entry:HouseG;

    private var _source:gSelectArrow;
    private var _sizeLimit:Point;

    private var _rootViewWidth:Number;

    /*
     * Properties
     */


    /*
     * Methods
     */

    //! Default initializer
    public function ViewArrow(contoller:IController, entry:HouseG, sizeLimit:Point)
    {
        _source = new gSelectArrow();
        super(contoller, _source);

        Debug.assert(sizeLimit != null);
        Debug.assert(entry != null);

        _entry = entry;
        _sizeLimit = sizeLimit;

        init();
    }

    private function init():void
    {
        _rootViewWidth = _source.width;

        handleEvents(false, true);
    }

    public function updateArrowSize(e:MouseEvent):void
    {
        var rootViewPositionAbsolute:Point = _source.parent.localToGlobal(new Point(_source.x, _source.y));

        var limitWidth:Number = Math.sqrt(Math.pow((e.stageX - rootViewPositionAbsolute.x), 2) + Math.pow((e.stageY - rootViewPositionAbsolute.y), 2));

        _source.rotation = Math.atan2(rootViewPositionAbsolute.y - e.stageY, rootViewPositionAbsolute.x - e.stageX) / Math.PI * 180;

        if (Math.abs(_source.rotation) <= 90 && (_source.x - _source.width <= 0))
        {
            limitWidth = Math.min(_source.x / Math.cos(_source.rotation * Math.PI / 180), limitWidth);
        }
        else if (Math.abs(_source.rotation) > 90 && (_source.x + _source.width >= _sizeLimit.x))
        {
            limitWidth = Math.min((_sizeLimit.x - _source.x) / Math.cos((180 - _source.rotation) * Math.PI / 180), limitWidth);
        }

        if (_source.rotation > 0 && (_source.y - _source.height <= 0))
        {
            limitWidth = Math.min(_source.y / Math.sin(_source.rotation * Math.PI / 180), limitWidth);
        }
        else if (_source.rotation <= 0 && (_source.y + _source.height >= _sizeLimit.y))
        {
            limitWidth = Math.min((_sizeLimit.y - _source.y) / Math.sin((-_source.rotation) * Math.PI / 180), limitWidth);
        }

        _source.scaleX = -limitWidth / _rootViewWidth;
    }

    public override function placeViews(fullscreen:Boolean):void
    {
        super.placeViews(fullscreen);

        //TODO: remove offset foundation
        var offsetFoundation:Point = new Point(_entry.houseConfig.foundationSize.x / 2, _entry.houseConfig.foundationSize.y / 2);

        var cellEntry:GridCell = GameInfo.instance.managerGame.managerPath.getCell(_entry.positionCurrent.add(offsetFoundation));

        x = cellEntry.view.x;
        y = cellEntry.view.y;
    }

    override public function cleanup():void
    {
        _entry = null;
        _source = null;

        super.cleanup();
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
