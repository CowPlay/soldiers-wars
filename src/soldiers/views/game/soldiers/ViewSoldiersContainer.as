/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/30/13
 * Time: 2:18 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.soldiers
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

public class ViewSoldiersContainer extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceView:DisplayObjectContainer;

    private var _soldiers:Array;
    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ViewSoldiersContainer(controller:IController)
    {
        _sourceView = new Sprite();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
        alignment = EViewAlignment.EVA_ABSOLUTE;

        anchorPoint = new Point(0.5, 0);

        _soldiers = [];

        _sourceView.mouseChildren = false;
        _sourceView.mouseEnabled = false;


        var grid:Array = GameInfo.instance.managerGame.managerPath.grid;
        var row:Array = grid[0];
        var cell:GridCell = row[0];

        var width:Number = cell.view.source.width * row.length;
        var height:Number = cell.view.source.height * grid.length;


        //TODO: remove
        var rect:Sprite = new Sprite();
//        rect.graphics.beginFill(0xff00ff, 0.2);
        rect.graphics.drawRect(0, 0, width, height);
        rect.graphics.endFill();

        _sourceView.addChild(rect);
    }


    override public function addSubView(view:IView):void
    {
        _sourceView.addChild(view.source);

        _soldiers.push(view);
    }


}
}
