/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/30/13
 * Time: 12:37 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.houses
{
import controllers.IController;

import controls.EViewAlignment;
import controls.IView;
import controls.implementations.ControlBase;

import flash.display.Sprite;
import flash.geom.Point;

import soldiers.models.GameInfo;
import soldiers.models.game.managerPath.GridCell;
import soldiers.models.game.managerPath.ManagerPath;

public class ViewHousesGContainer extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceView:Sprite;

    private var _houses:Array;


    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ViewHousesGContainer(controller:IController)
    {
        _sourceView = new Sprite();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
        _houses = [];

        handleEvents(false, false, false, true);
        alignment = EViewAlignment.EVA_ABSOLUTE;
        anchorPoint = new Point(0.5, 0);

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

        _houses.push(view);
    }

    public override function placeViews(fullscreen:Boolean):void
    {
        super.placeViews(fullscreen);

        for each(var houseView:ViewHouseG in  _houses)
        {
            houseView.placeViews(fullscreen);
        }


    }
}
}
