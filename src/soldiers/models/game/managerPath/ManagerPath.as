package soldiers.models.game.managerPath
{
import core.DisposableObject;

import flash.geom.Point;
import flash.utils.Dictionary;

import soldiers.models.GameInfo;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;

//! Class which contains info about level grid and provide find path functionally
public class ManagerPath extends DisposableObject
{
    /*
     * Static methods
     */

    private static function getPathHash(from:HouseG, to:HouseG):String
    {
        return  from.hash + "#" + to.hash;
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
    public function ManagerPath(gridSize:Point)
    {
        Debug.assert(gridSize != null);

        _gridSize = gridSize;

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
        var houses:Array = GameInfo.instance.managerGame.houses;

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

                        trace(Math.sqrt(distance));

                        if(distance == 2)
                        {
                            trace("");
                        }

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

                    for (var i:int = 0; i < 2; i++)
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

                    //TODO:remove this hack
                    {//remove 2,4 path
//                        newPathInfo.removePath();
//                        newPathInfoReversed.removePath();
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

                //TODO: test it
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


    //! Returns nearest house with specify type. If type = null, returns house with any type
    public function getNearestHouse(target:HouseG, type:EHouseOwner = null):HouseG
    {
        Debug.assert(false);
        var result:HouseG = null;
//
//        var minPath:Array = null;
//
//        for each (var house:HouseBase in _currentLevel.houses)
//        {
//            if (house == target)
//            {
//                continue;
//            }
//
//            if (type != null && house.ownerType != type)
//            {
//                continue;
//            }
//
//            var path:Array = getPath(target.houseExitPosition, house.houseExitPosition);
//
//            if (minPath == null)
//            {
//                minPath = path;
//                result = house;
//            }
//            else
//            {
//                minPath = path.length < minPath.length ? path : minPath;
//                result = house;
//            }
//        }
//
        return result;
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