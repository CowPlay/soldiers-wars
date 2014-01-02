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

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.geom.Point;

import soldiers.GameInfo;
import soldiers.models.game.managerPath.GridCell;
import soldiers.models.game.managerPath.ManagerPath;
import soldiers.models.housesGame.base.HouseG;
import soldiers.views.game.arrows.ViewArrowContainer;
import soldiers.views.game.houses.ViewHousesGContainer;
import soldiers.views.game.soldiers.ViewSoldiersContainer;

import views.IView;
import views.implementations.ViewBase;

public class ViewGrid extends ViewBase
{
    /*
     * Fields
     */
    private var _sourceView:DisplayObjectContainer;
    private var _sourceObjects:DisplayObjectContainer;

    private var _viewSoldiersContainer:ViewSoldiersContainer;
    private var _viewHousesContainer:ViewHousesGContainer;
    private var _viewArrowsContainer:ViewArrowContainer;

    private var _cells:Array;

    /*
     * Properties
     */


    public function get sourceObjects():DisplayObjectContainer
    {
        return  _sourceObjects;
    }

    public function get viewArrowsContainer():ViewArrowContainer
    {
        return _viewArrowsContainer;
    }

    public function get viewSoldiersContainer():ViewSoldiersContainer
    {
        return  _viewSoldiersContainer;
    }

    public function get viewHousesContainer():ViewHousesGContainer
    {
        return  _viewHousesContainer;
    }


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
        _sourceObjects = new Sprite();
        _sourceView.addChild(_sourceObjects);

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

                var cellView:ViewBase = new ViewGridCell(controller);

                cellEntry.view = cellView;

                _sourceView.addChild(cellView.source);

                rowView.push(cellView);
            }

            _cells.push(rowView);
        }


        _viewSoldiersContainer = new ViewSoldiersContainer(controller, _sourceObjects);
        _viewHousesContainer = new ViewHousesGContainer(controller, _sourceObjects);
        _viewArrowsContainer = new ViewArrowContainer(controller);
        _sourceView.addChild(_viewArrowsContainer.source);
    }

    public function showFoundation():void
    {
        var houses:Array = GameInfo.instance.managerGame.houses;
        for each(var house:HouseG in houses)
        {
            var foundationWidthHalf:int = house.houseConfig.foundationSize.x / 2;
            var foundationHeightHalf:int = house.houseConfig.foundationSize.y / 2;

            var columnStart:uint = house.positionCurrent.x - foundationWidthHalf;
            var columnEnd:uint = house.positionCurrent.x + foundationWidthHalf;

            var rowStart:uint = house.positionCurrent.y - foundationHeightHalf;
            var rowEnd:uint = house.positionCurrent.y + foundationHeightHalf;

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
        var managerPath:ManagerPath = GameInfo.instance.managerGame.managerPath;

        var houses:Array = GameInfo.instance.managerGame.houses;

        for each(var houseFrom:HouseG in houses)
        {
            for each(var houseTo:HouseG in houses)
            {
                if (houseFrom == houseTo)
                {
                    continue;
                }

                var paths:Array = managerPath.getPaths(houseFrom, houseTo);

                for each(var path:Array in paths)
                {
                    for each(var gridCell:GridCell in path)
                    {
                        var row:Array = _cells[gridCell.row];
                        var cellView:IView = row[gridCell.column];

                        var cellSource:Sprite = gridCell.view.source as Sprite;

                        cellSource.graphics.beginFill(0x00FF00, 1);
                        cellSource.graphics.drawCircle(0, 0, 2);
                        cellSource.graphics.endFill();
                    }
                }
            }
        }
    }

    public function showHousePositions():void
    {
        var houses:Array = GameInfo.instance.managerGame.houses;
        for each(var house:HouseG in houses)
        {
            var cellView:IView = _cells[house.positionCurrent.y][house.positionCurrent.x];

            var cellSource:Sprite = cellView.source as Sprite;

            cellSource.graphics.beginFill(0x00ff00, 1);
            cellSource.graphics.drawCircle(0, 0, 2);
            cellSource.graphics.endFill();
        }
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

        _viewSoldiersContainer.placeViews(fullscreen);
        _viewHousesContainer.placeViews(fullscreen);
        _viewArrowsContainer.placeViews(fullscreen);

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

        _sourceObjects = null;
        _sourceView = null;

        super.cleanup();
    }
}
}
