/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/5/13
 * Time: 1:43 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game
{
import controls.IView;
import controls.implementations.ControlBase;

import flash.display.Sprite;
import flash.geom.Point;

import soldiers.models.GameInfo;
import soldiers.models.game.managerPath.GridCell;

public class ControlGrid extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceViewTyped:Sprite;

    private var _cells:Array;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlGrid(parent:IView)
    {
        super(parent);

        init();
    }

    private function init():void
    {
        _sourceViewTyped = new Sprite();
        setSourceView(_sourceViewTyped);

        _cells = [];

        var grid:Array = GameInfo.instance.managerGameSoldiers.managerPath.grid;

        //add nodes
        for (var currentRow:int = 0; currentRow < grid.length; currentRow++)
        {
            var rowView:Array = [];
            var rowEntry:Array = grid[currentRow] as Array;

            for (var currentColumn:int = 0; currentColumn < rowEntry.length; currentColumn++)
            {
                var cellEntry:GridCell = rowEntry[currentColumn];
                var cellView:ControlGridCell = new ControlGridCell(this, cellEntry);

                cellEntry.view = cellView;

                _sourceViewTyped.addChild(cellView.sourceView);

                rowView.push(cellView);
            }

            _cells.push(rowView);
        }
    }

    public override function placeViews():void
    {
        var startX:Number = 0;
        var startY:Number = 0;

        var firstNode:GridCell = GameInfo.instance.managerGameSoldiers.managerPath.getCell(new Point(0, 0));

        var nodeWidth:Number = firstNode.view.sourceView.width;
        var nodeHeight:Number = firstNode.view.sourceView.height;

        var grid:Array = GameInfo.instance.managerGameSoldiers.managerPath.grid;

        for (var currentRow:int = 0; currentRow < grid.length; currentRow++)
        {
            var offsetX:Number = startX + currentRow * nodeWidth / 2;
            var offsetY:Number = startY + currentRow * nodeHeight / 2;

            var row:Array = grid[currentRow] as Array;

            for (var currentColumn:int = 0; currentColumn < row.length; currentColumn++)
            {
                var node:GridCell = row[currentColumn];

                node.view.sourceView.x = offsetX;//startX + currentRow * Node.NodeWidthHalf;
                node.view.sourceView.y = offsetY;//startY - currentColumn * Node.NodeHeightHalf;

                offsetX = offsetX + nodeWidth / 2;
                offsetY = offsetY - nodeHeight / 2;
            }
        }

//        for each(var house:HouseBase in GameInfo.Instance.houseManager.houses)
//        {
//            house.view.x = house.currentPosition.view.x;//* house.view.x + Math.round(house.view.width / 2) - Node.NodeWidthHalf;
//            house.view.y = house.currentPosition.view.y;//house.view.x + Math.round(house.view.height / 2) - Node.NodeHeightHalf;
//
//            if (house.view.arrow != null)
//            {
//                house.view.arrow.rootView.x = house.view.x;
//                house.view.arrow.rootView.y = house.view.y;
//            }
//        }
    }
}
}
