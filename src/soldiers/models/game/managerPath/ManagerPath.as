package soldiers.models.game.managerPath
{
import flash.geom.Point;
import flash.utils.Dictionary;

import models.interfaces.levels.ILevelInfo;

import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;
import soldiers.models.levels.LevelInfo;

import utils.Utils;

//! Class which contains info about level grid and provide find path functionally
public class ManagerPath
{
    /*
     * Static methods
     */

    private static function getPathHash(nodeFrom:GridCell, nodeTo:GridCell):String
    {
        return  nodeFrom.toString() + "#" + nodeTo.toString();
    }

    /*
     * Fields
     */

    private var _currentLevel:LevelInfo;

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
    public function ManagerPath(currentLevel:ILevelInfo)
    {
        Debug.assert(currentLevel != null);
        Debug.assert(currentLevel is LevelInfo);

        _currentLevel = currentLevel as LevelInfo;

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

            for (row = 0; row < _currentLevel.gridSize.y; row++)
            {
                var newRow:Array = [];

                for (column = 0; column < _currentLevel.gridSize.x; column++)
                {
                    var newNode:GridCell = new GridCell(column, row);

                    newRow.push(newNode);
                }

                _grid.push(newRow);
            }
        }

        {
            for each (var house:HouseG in _currentLevel.houses)
            {
                var foundationSize:Point = house.currentLevelInfo.foundationSize;

                var rowFrom:int = house.positionCurrent.y;
                var rowTo:int = rowFrom + foundationSize.y;

                var columnFrom:int = house.positionCurrent.x;
                var columnTo:int = columnFrom + foundationSize.x;

                //make foundations not walkable
                for (row = rowFrom; row < rowTo; row++)
                {
                    for (column = columnFrom; column < columnTo; column++)
                    {
                        var foundationCell:GridCell = getCell(new Point(column, row));
                        foundationCell.traversable = false;
                    }
                }

                //and make house exit traversable
                var houseExitCell:GridCell = getCell(house.positionExit);
                houseExitCell.traversable = true;
            }
        }
    }

    public function generateLevelPaths():void
    {
        for each(var houseFrom:HouseG in _currentLevel.houses)
        {
            for each(var houseTo:HouseG in _currentLevel.houses)
            {
                if (houseFrom == houseTo)
                {
                    continue;
                }
                var nodeFrom:GridCell = getCell(houseFrom.positionExit);
                var nodeTo:GridCell = getCell(houseTo.positionExit);

                var pathHash:String = getPathHash(nodeFrom, nodeTo);

                if (_pathsCache[pathHash] == null)
                {
                    _pathsCache[pathHash] = new PathInfo(nodeFrom, nodeTo);

                    var pathHashReversed:String = getPathHash(nodeTo, nodeFrom);
                    _pathsCache[pathHashReversed] = new PathInfo(nodeTo, nodeFrom);

                    for (var i:int = 0; i < 20; i++)
                    {
                        generateAndAddPath(nodeFrom, nodeTo);
                    }
                }
            }
        }
    }

    public function getPath(nodeFrom:GridCell, nodeTo:GridCell):Array
    {
        var pathHash:String = getPathHash(nodeFrom, nodeTo);

        var pathInfo:PathInfo = _pathsCache[pathHash];

        Debug.assert(pathInfo != null);

        return  pathInfo.randomPath;
    }

    private function generateAndAddPath(nodeFrom:GridCell, nodeTo:GridCell):void
    {
        var pathFinded:Boolean = false;

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
                buildPath(nodeFrom, nodeTo);
                pathFinded = true;
            }

            closedNodes.push(currentNode);

            var neighbour_nodes_x:Array = findConnectedNodes(currentNode);

            for each (var tentativeNode:GridCell in neighbour_nodes_x)
            {
                if (closedNodes.indexOf(tentativeNode) != ConstantsBase.INDEX_NONE || !tentativeNode.traversable)
                    continue;

                var penalty:Number = 0;

                if (tentativeNode != nodeTo)
                {
                    penalty = Utils.randomFromTo(0, 2);
                }

                var tentative_g_score:Number = currentNode.g + travelCost + penalty;

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

        Debug.assert(pathFinded);
    }

    private function buildPath(nodeFrom:GridCell, nodeTo:GridCell):void
    {
        var pathHash:String = getPathHash(nodeFrom, nodeTo);

        var path:Array = [];

        var nodeTmp:GridCell = nodeTo;

        path.push(nodeTmp);

        while (nodeTmp != nodeFrom)
        {
            nodeTmp = nodeTmp.parentNode;
            path.unshift(nodeTmp);
        }

        {//add to cache
            var pathInfo:PathInfo = _pathsCache[pathHash];
            pathInfo.addPath(path);
        }

        {
            //get info for reversed path
            var pathHashReversed:String = getPathHash(nodeTo, nodeFrom);

            var pathReversed:Array = [];

            for (var nodeIndex:int = path.length - 1; nodeIndex >= 0; nodeIndex--)
            {
                pathReversed.push(path[nodeIndex]);
            }

            //Add reversed path to cache
            var reversedPathInfo:PathInfo = _pathsCache[pathHashReversed];
            reversedPathInfo.addPath(pathReversed);
        }

//        if (true)
//        {
//            Debug.assert(false);
//            for each(var node:GridCell in path)
//            {
//                node.drawDebugData(0xFF80C0);
//            }
//        }
    }


    private function findConnectedNodes(node:GridCell):Array
    {
        var result:Array = [];

        var rowMin:int = node.row > 0 ? node.row - 1 : 0;
        var rowMax:int = node.row < _currentLevel.gridSize.y - 1 ? node.row + 1 : _currentLevel.gridSize.y - 1;

        var columnMin:int = node.column > 0 ? node.column - 1 : node.column;
        var columnMax:int = node.column < _currentLevel.gridSize.x - 1 ? node.column + 1 : _currentLevel.gridSize.x - 1;

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
        Debug.assert(position.length < _currentLevel.gridSize.length);

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


}

}