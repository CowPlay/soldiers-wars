package soldiers.models.game.managerPath
{
import core.DisposableObject;

import flash.geom.Point;
import flash.utils.Dictionary;

import soldiers.Constants;
import soldiers.GameInfo;
import soldiers.models.game.ManagerGame;
import soldiers.models.game.soldiers.ESoldierRotation;
import soldiers.models.housesGame.base.HouseG;

import utils.UtilsArray;

//! Class which contains info about level grid and provide find path functionally
public class ManagerPath extends DisposableObject
{
    /*
     * Static methods
     */

    private static function getPathHash(from:HouseG, to:HouseG):String
    {
        return  from.id + "#" + to.id;
    }

    //! returns optimized path(without redundant nodes)
    private static function getOptimizePath(path:Array):Array
    {
        var result:Array = [];

        result.push(path[0]);

        var prevRotation:int = ESoldierRotation.getRotation(path[0], path[1]);

        for (var i:uint = 1; i < path.length - 2; i++)
        {
            var cellCurrent:GridCell = path[i];
            var cellNext:GridCell = path[i + 1];

            var currentRotation:int = ESoldierRotation.getRotation(cellCurrent, cellNext);

            if (currentRotation != prevRotation)
            {
                result.push(cellNext);
                prevRotation = currentRotation;
            }
        }

        result.push(path[path.length - 1]);

        //TODO: implement
//        if (result.length > 2)
//        {
//            var redundantCellsIndexes:Array = [];
//
//            var needRemoveCell:Boolean = false;
//
//            //start from first. Without end cell
//            for (var cellIndex:int = 0; cellIndex < result.length - 1; cellIndex++)
//            {
//                if (needRemoveCell)
//                {
//                    redundantCellsIndexes.push(cellIndex);
//                }
//
//                needRemoveCell = !needRemoveCell;
//            }
//
//            //index of index - very funny :D
//            for (var indexOfIndex:int = redundantCellsIndexes.length - 1; indexOfIndex >= 0; indexOfIndex--)
//            {
//                var reduntantCellIndex:int = redundantCellsIndexes[indexOfIndex];
//
//                UtilsArray.removeValue(result, result[reduntantCellIndex])
//            }
//        }

        return result;
    }


    /*
     * Fields
     */

    private var _gridSize:Point;

    //! Array of (array of nodes)
    private var _grid:Array;

    //! Key - path hash(string), value - PathInfo
    private var _pathsCache:Dictionary;

    private var _heuristicFunction:Function;

    private var _managerGame:ManagerGame;

    /*
     * Properties
     */

    public function get grid():Array
    {
        return _grid;
    }


    /*
     * Methods
     */

    //! Default constructor
    public function ManagerPath(gridSize:Point, managerGame:ManagerGame)
    {
        Debug.assert(gridSize != null);

        _gridSize = gridSize;
        _managerGame = managerGame;

        _heuristicFunction = ManagerPath.manhattanHeuristic;

        initGrid();
    }

    private function initGrid():void
    {
        _pathsCache = new Dictionary();

        var row:int;
        var column:int = 0;

        { // Create grid
            _grid = [];

            for (row = 0; row < _gridSize.y; row++)
            {
                var newRow:Array = [];

                for (column = 0; column < _gridSize.x; column++)
                {
                    var newNode:GridCell = new GridCell(column, row);

                    newRow.push(newNode);
                }

                _grid.push(newRow);
            }
        }
    }

    public function generateLevelPaths():void
    {
        var houses:Array = _managerGame.houses;

        for each(var houseFrom:HouseG in houses)
        {
            for each(var houseTo:HouseG in houses)
            {
                if (houseFrom == houseTo)
                {
                    continue;
                }

                var positionFrom:Point = null;
                var positionTo:Point = null;

                var distanceBetweenExits:int = int.MAX_VALUE;

                //get node from and node to
                for each (var exitPositionFrom:Point in houseFrom.positionsExits)
                {
                    for each (var exitPositionTo:Point in houseTo.positionsExits)
                    {
                        var distance:int = Math.pow(exitPositionFrom.x - exitPositionTo.x, 2) + Math.pow(exitPositionFrom.y - exitPositionTo.y, 2);

                        if (distance <= distanceBetweenExits)
                        {
                            distanceBetweenExits = distance;

                            positionFrom = exitPositionFrom;
                            positionTo = exitPositionTo;
                        }
                    }
                }

                var nodeFrom:GridCell = getCell(positionFrom);
                var nodeTo:GridCell = getCell(positionTo);

                var pathHash:String = getPathHash(houseFrom, houseTo);

                if (_pathsCache[pathHash] == null)
                {
                    var newPathInfo:PathsInfo = new PathsInfo(nodeFrom, nodeTo);
                    _pathsCache[pathHash] = newPathInfo;

                    var newPathInfoReversed:PathsInfo = new PathsInfo(nodeTo, nodeFrom);
                    var pathHashReversed:String = getPathHash(houseTo, houseFrom);
                    _pathsCache[pathHashReversed] = newPathInfoReversed;

                    for (var i:int = 0; i < Constants.PATH_COUNT; i++)
                    {
                        var newPath:Array = getPath(nodeFrom, nodeTo);
                        addPathToCache(houseFrom, houseTo, newPath);

                        var lastPath:Array = newPathInfo.savedPaths[newPathInfo.savedPaths.length - 1];

                        for each(var cell:GridCell in lastPath)
                        {
                            cell.traversable = false;
                        }

                        nodeFrom.traversable = true;
                        nodeTo.traversable = true;
                    }

                    //revert cells states
                    for each(var path:Array in newPathInfo.savedPaths)
                    {
                        for each(var cellPath:GridCell in path)
                        {
                            cellPath.traversable = true;
                        }
                    }
                }
            }
        }
    }

    private function addPathToCache(from:HouseG, to:HouseG, path:Array):void
    {
        {//add to cache
            var pathHash:String = getPathHash(from, to);

            var pathInfo:PathsInfo = _pathsCache[pathHash];
            pathInfo.addPath(path);
        }

        {
            //get info for reversed path
            var pathHashReversed:String = getPathHash(to, from);

            var pathReversed:Array = [];

            for (var nodeIndex:int = path.length - 1; nodeIndex >= 0; nodeIndex--)
            {
                pathReversed.push(path[nodeIndex]);
            }

            //Add reversed path to cache
            var reversedPathInfo:PathsInfo = _pathsCache[pathHashReversed];
            reversedPathInfo.addPath(pathReversed);
        }
    }

    public function getPaths(from:HouseG, to:HouseG):Array
    {
        var pathHash:String = getPathHash(from, to);

        var pathInfo:PathsInfo = _pathsCache[pathHash];

        Debug.assert(pathInfo != null);

        return  pathInfo.savedPaths;

    }

    public function getMinPathDistance(from:HouseG, to:HouseG):int
    {
        var result:int = 0;

        if (from != to)
        {
            var paths:Array = getPaths(from, to);
            //first path is shortest

            var shortestPath:Array = paths[0];

            for (var i:uint = 1; i < shortestPath.length; i++)
            {
                var cellPrev:GridCell = shortestPath[i - 1];
                var cellCurrent:GridCell = shortestPath[i];

                result += cellPrev.getDistanceTo(cellCurrent);
            }
        }

        return result;
    }

    private function getPath(nodeFrom:GridCell, nodeTo:GridCell):Array
    {
        var result:Array = [];

        var openNodes:Array = [nodeFrom];
        var closedNodes:Array = [];

        var currentNode:GridCell;

        var travelCost:Number = 1.0;

        nodeFrom.g = 0;
        nodeFrom.h = _heuristicFunction(nodeFrom, nodeTo, travelCost);
        nodeFrom.f = nodeFrom.g + nodeFrom.h;

        var tentative_is_better:Boolean;

        while (openNodes.length > 0)
        {
            openNodes.sortOn('f', Array.NUMERIC);

            currentNode = openNodes.shift() as GridCell;

            if (currentNode == nodeTo)
            {
                var nodeTmp:GridCell = nodeTo;

                result.push(nodeTmp);

                while (nodeTmp != nodeFrom)
                {
                    nodeTmp = nodeTmp.parentNode;
                    result.unshift(nodeTmp);
                }

                break;
            }

            closedNodes.push(currentNode);

            var neighbour_nodes_x:Array = findConnectedNodes(currentNode);

            for each (var tentativeNode:GridCell in neighbour_nodes_x)
            {
                if (closedNodes.indexOf(tentativeNode) != ConstantsBase.INDEX_NONE || !tentativeNode.traversable)
                    continue;

                var tentative_g_score:Number = currentNode.g + travelCost;

                if (openNodes.indexOf(tentativeNode) == ConstantsBase.INDEX_NONE)
                {
                    openNodes.push(tentativeNode);
                    tentative_is_better = true;
                }
                else
                {
                    tentative_is_better = tentative_g_score < tentativeNode.g;
                }

                if (tentative_is_better)
                {
                    tentativeNode.parentNode = currentNode;
                    tentativeNode.g = tentative_g_score;
                    tentativeNode.h = _heuristicFunction(tentativeNode, nodeTo, travelCost);
                    tentativeNode.f = tentativeNode.g + tentativeNode.h;
                }
            }
        }

        Debug.assert(result.length > 0, "Path not found");

//        TODO: implement
//        result = getOptimizePath(result);

        return result;
    }


    private function findConnectedNodes(node:GridCell):Array
    {
        var result:Array = [];

        var rowMin:int = node.row > 0 ? node.row - 1 : 0;
        var rowMax:int = node.row < _gridSize.y - 1 ? node.row + 1 : _gridSize.y - 1;

        var columnMin:int = node.column > 0 ? node.column - 1 : node.column;
        var columnMax:int = node.column < _gridSize.x - 1 ? node.column + 1 : _gridSize.x - 1;

        for (var currentRow:int = rowMin; currentRow <= rowMax; currentRow++)
        {
            var row:Array = _grid[currentRow];

            for (var column:int = columnMin; column <= columnMax; column++)
            {
                var connectedNode:GridCell = row[column];

                if (connectedNode == node)
                {
                    continue;
                }

                result.push(connectedNode);
            }
        }

        return result;
    }


    /******************************************************************************
     *
     *    These are our available heuristics
     *
     ******************************************************************************/
//    private static function euclidianHeuristic(node:Node, destinationNode:Node, cost:Number = 1.0):Number
//    {
//        var dx:Number = node.column - destinationNode.column;
//        var dy:Number = node.row - destinationNode.row;
//
//        return Math.sqrt(dx * dx + dy * dy) * cost;
//    }

    public static function manhattanHeuristic(node:GridCell, destinationNode:GridCell, cost:Number = 1.0):Number
    {
        return (Math.abs(node.column - destinationNode.column) + Math.abs(node.row - destinationNode.row)) * cost;
    }

//
//    public static function diagonalHeuristic(node:Node, destinationNode:Node, cost:Number = 1.0, diagonalCost:Number = 1.0):Number
//    {
//        var dx:Number = Math.abs(node.column - destinationNode.column);
//        var dy:Number = Math.abs(node.row - destinationNode.row);
//
//        var diag:Number = Math.min(dx, dy);
//        var straight:Number = dx + dy;
//
//        return diagonalCost * diag + cost * (straight - 2 * diag);
//    }

    //! Returns node by row and column index
    public function getCell(position:Point):GridCell
    {
        var result:GridCell;

        Debug.assert(position != null);
        Debug.assert(position.x >= 0 && position.y >= 0);
        Debug.assert(position.length < _gridSize.length);

        var rowEntry:Array = _grid[position.y] as Array;

        result = rowEntry[position.x] as GridCell;

        return result;
    }

    public function makeTraversable(rowFrom:int, rowTo:int, columnFrom:int, columnTo:int, traversable:Boolean):void
    {
        //make foundations not walkable
        for (var row:uint = rowFrom; row <= rowTo; row++)
        {
            var rowEntry:Array = _grid[row] as Array;

            for (var column:uint = columnFrom; column <= columnTo; column++)
            {
                var cell:GridCell  = rowEntry[column] as GridCell;
                cell.traversable = traversable;
            }
        }
    }

    public override function cleanup():void
    {
        _gridSize = null;
        for each(var row:Array in _grid)
        {
            for each(var cell:GridCell in row)
            {
                cell.cleanup();
            }
        }

        _grid = null;

        super.cleanup();
    }


}

}