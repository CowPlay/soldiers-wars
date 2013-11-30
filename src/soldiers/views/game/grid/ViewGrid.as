/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/5/13
 * Time: 1:43 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.grid
{
import controllers.IController;

import controls.IView;
import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.geom.Point;

import soldiers.models.GameInfo;
import soldiers.models.game.managerPath.GridCell;
import soldiers.models.housesGame.base.HouseG;

public class ViewGrid extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceView:DisplayObjectContainer;

    private var _cells:Array;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ViewGrid(controller:IController)
    {
        _sourceView = new Sprite();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
        anchorPoint = new Point(0.5, 0);

        _cells = [];

        var grid:Array = GameInfo.instance.managerGame.managerPath.grid;

        //add nodes
        for (var currentRow:int = 0; currentRow < grid.length; currentRow++)
        {
            var rowView:Array = [];
            var rowEntry:Array = grid[currentRow] as Array;

            for (var currentColumn:int = 0; currentColumn < rowEntry.length; currentColumn++)
            {
                var cellEntry:GridCell = rowEntry[currentColumn];
                var cellView:ControlBase = new ControlBase(controller, new gGridCell());

                cellEntry.view = cellView;

                _sourceView.addChild(cellView.source);

                rowView.push(cellView);
            }

            _cells.push(rowView);
        }
    }

    public function showFoundation():void
    {
        var houses:Array = GameInfo.instance.managerGame.houses;
        for each(var house:HouseG in houses)
        {
            var columnStart:uint = house.positionCurrent.x;
            var columnEnd:uint = columnStart + house.houseConfig.foundationSize.x;

            var rowStart:uint = house.positionCurrent.y;
            var rowEnd:uint = rowStart + house.houseConfig.foundationSize.y;

            for (var rowIndex:uint = rowStart; rowIndex <= rowEnd; rowIndex++)
            {
                var row:Array = _cells[rowIndex];

                for (var columnIndex:uint = columnStart; columnIndex <= columnEnd; columnIndex++)
                {
                    var cellView:IView = row[columnIndex];

                    var cellSource:Sprite = cellView.source as Sprite;

                    cellSource.graphics.beginFill(0x000000, 1);
                    cellSource.graphics.drawCircle(0, 0, 2);
                    cellSource.graphics.endFill();

                }
            }
        }
    }

    public function showPaths():void
    {

    }

    public function showHouseExits():void
    {
        var houses:Array = GameInfo.instance.managerGame.houses;
        for each(var house:HouseG in houses)
        {
            for each(var exitPosition:Point in house.positionsExits)
            {
                var row:Array = _cells[exitPosition.y];
                var cellView:IView = row[exitPosition.x];

                var cellSource:Sprite = cellView.source as Sprite;

                cellSource.graphics.beginFill(0xFF0000, 1);
                cellSource.graphics.drawCircle(0, 0, 2);
                cellSource.graphics.endFill();
            }
        }
    }

    public override function placeViews(fullscreen:Boolean):void
    {
        this.translate(0.5, 0.5);

        var startX:Number = 0;
        var startY:Number = 0;

        var firstNode:GridCell = GameInfo.instance.managerGame.managerPath.getCell(new Point(0, 0));

        var nodeWidth:Number = firstNode.view.source.width;
        var nodeHeight:Number = firstNode.view.source.height;

        var grid:Array = GameInfo.instance.managerGame.managerPath.grid;

        for (var currentRow:int = 0; currentRow < grid.length; currentRow++)
        {
            var offsetX:Number = startX + currentRow * nodeWidth / 2;
            var offsetY:Number = startY + currentRow * nodeHeight / 2;

            var row:Array = grid[currentRow] as Array;

            for (var currentColumn:int = 0; currentColumn < row.length; currentColumn++)
            {
                var node:GridCell = row[currentColumn];

                node.view.source.x = offsetX;
                node.view.source.y = offsetY;

                offsetX = offsetX + nodeWidth / 2;
                offsetY = offsetY - nodeHeight / 2;
            }
        }

        super.placeViews(fullscreen);
    }

    public override function cleanup():void
    {
        for each(var row:Array in _cells)
        {
            for each(var cell:IView in row)
            {
                cell.cleanup();
            }
        }


        _cells = null;
        _sourceView = null;

        super.cleanup();
    }
}
}
