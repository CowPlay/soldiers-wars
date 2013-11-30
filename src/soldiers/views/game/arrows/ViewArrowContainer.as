/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/25/13
 * Time: 10:15 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.arrows
{
import controllers.IController;

import controls.EViewAlignment;
import controls.IView;
import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.geom.Point;

import soldiers.models.GameInfo;
import soldiers.models.game.managerPath.GridCell;

import soldiers.models.game.managerPath.ManagerPath;

public class ViewArrowContainer extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceView:Sprite;

    private var _viewsArrows:Array;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ViewArrowContainer(controller:IController)
    {
        _sourceView = new Sprite();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
        _viewsArrows = [];

        alignment = EViewAlignment.EVA_ABSOLUTE;

        anchorPoint = new Point(0.5, 0);

        handleEvents(false);

        _sourceView.mouseEnabled = false;
        _sourceView.mouseChildren = false;


        var managerPath:ManagerPath = GameInfo.instance.managerGame.managerPath;

        var cell:GridCell = managerPath.getCell(new Point(0, 0));

        var gridSize:Point = GameInfo.instance.managerGame.currentLevel.gridSize;

        var width:Number = gridSize.x * cell.view.source.width;
        var height:Number = gridSize.y * cell.view.source.height;

        _sourceView.graphics.beginFill(0x0000ff, 0.1);
        _sourceView.graphics.drawRect(0, 0, width, height);
        _sourceView.graphics.endFill();
    }

    public override function addSubView(view:IView):void
    {
        _sourceView.addChild(view.source);
        _viewsArrows.push(view);
    }


    public override function placeViews(fullscreen:Boolean):void
    {
        super.placeViews(fullscreen);

        for each(var arrowView:IView in _viewsArrows)
        {
            arrowView.placeViews(fullscreen);
        }
    }
}

}
