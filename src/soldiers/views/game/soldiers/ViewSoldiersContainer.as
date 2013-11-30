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
import soldiers.models.game.managerPath.ManagerPath;

import utils.UtilsArray;

public class ViewSoldiersContainer extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceView:Sprite;

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


        var managerPath:ManagerPath = GameInfo.instance.managerGame.managerPath;

        var cell:GridCell = managerPath.getCell(new Point(0, 0));

        var gridSize:Point = GameInfo.instance.managerGame.currentLevel.gridSize;

        var width:Number = gridSize.x * cell.view.source.width;
        var height:Number = gridSize.y * cell.view.source.height;

        _sourceView.graphics.beginFill(0x0000ff, 0.1);
        _sourceView.graphics.drawRect(0, 0, width, height);
        _sourceView.graphics.endFill();
    }


    override public function addSubView(view:IView):void
    {
        _sourceView.addChild(view.source);

        _soldiers.push(view);
    }


    //! Remove subview to this view
    override public function removeSubView(view:IView):void
    {
        _sourceView.removeChild(view.source);

        UtilsArray.removeValue(_soldiers, view);
    }


}
}
