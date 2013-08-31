/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/5/13
 * Time: 1:43 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.Game.views
{
import core.Debug;
import core.IDisposable;

import flash.display.Sprite;

public class GameGrid implements IDisposable
{
    /*
     * Fields
     */
    private var _rootView:Sprite;
    private var _sceneOwner:SceneGame;
    /*
     * Properties
     */

    public function get rootView():Sprite
    {
        return _rootView;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function GameGrid(sceneOwner:SceneGame)
    {
        Debug.assert(sceneOwner != null);

        _sceneOwner = sceneOwner;

        init();
    }

    public function cleanup():void
    {
        _sceneOwner = null;
    }

    private function init():void
    {
//        var borderClass:Class = ResourceLoader.getClass(ResourceManagerSceneGame.gridBorder);
        _rootView = new Sprite();

        var grid:Array = GameInfo.Instance.pathfinder.grid;

        //add nodes
        for (var currentRow:int = 0; currentRow < grid.length; currentRow++)
        {
            var row:Array = grid[currentRow] as Array;

            for (var currentColumn:int = 0; currentColumn < row.length; currentColumn++)
            {
                var node:Node = row[currentColumn];

                node.initView();

                _rootView.addChild(node.view);
            }
        }

        //add houses
        for each(var house:HouseBase in GameInfo.Instance.houseManager.houses)
        {
            house.initView();

            _rootView.addChild(house.view);
        }
    }

    public function placeViews():void
    {
        var startX:Number = -_rootView.width / 2;
        var startY:Number = 0;

        var firstNode:Node = GameInfo.Instance.pathfinder.getNode(0, 0);

        var nodeWidth:Number = firstNode.view.width;
        var nodeHeight:Number = firstNode.view.height;

        var grid:Array = GameInfo.Instance.pathfinder.grid;

        for (var currentRow:int = 0; currentRow < grid.length; currentRow++)
        {
            var offsetX:Number = startX + currentRow * nodeWidth / 2;
            var offsetY:Number = startY + currentRow * nodeHeight / 2;

            var row:Array = grid[currentRow] as Array;

            for (var currentColumn:int = 0; currentColumn < row.length; currentColumn++)
            {
                var node:Node = row[currentColumn];

                node.view.x = offsetX;//startX + currentRow * Node.NodeWidthHalf;
                node.view.y = offsetY;//startY - currentColumn * Node.NodeHeightHalf;

                offsetX = offsetX + nodeWidth / 2;
                offsetY = offsetY - nodeHeight / 2;
            }
        }

        for each(var house:HouseBase in GameInfo.Instance.houseManager.houses)
        {
            house.view.x = house.currentPosition.view.x;//* house.view.x + Math.round(house.view.width / 2) - Node.NodeWidthHalf;
            house.view.y = house.currentPosition.view.y;//house.view.x + Math.round(house.view.height / 2) - Node.NodeHeightHalf;

            if (house.view.arrow != null)
            {
                house.view.arrow.rootView.x = house.view.x;
                house.view.arrow.rootView.y = house.view.y;
            }
        }
    }
}
}
