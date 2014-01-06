/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/14/13
 * Time: 5:00 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game.arrow
{
import controllers.IController;
import controllers.implementations.Controller;

import flash.geom.Point;

import soldiers.GameInfo;
import soldiers.controllers.EControllerUpdate;
import soldiers.models.game.managerPath.GridCell;
import soldiers.models.housesGame.base.HouseG;
import soldiers.views.game.arrows.ViewArrowContainer;

public class ControllerArrowContainer extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewArrowContainer;

    private var _arrows:Array;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerArrowContainer(view:ViewArrowContainer)
    {
        _view = view;
        super(_view);

        init();
    }

    private function init():void
    {
        var houses:Array = GameInfo.instance.managerGame.houses;

        var sizeLimit:Point = null;

        var grid:Array = GameInfo.instance.managerGame.managerPath.grid;

        var row:Array = grid[0];

        var firstNode:GridCell = row[0];

        sizeLimit = new Point(firstNode.view.source.width * row.length, firstNode.view.source.height * grid.length);

        _arrows = [];
        for each(var house:HouseG in houses)
        {
            var controllerArrow:ControllerArrow = new ControllerArrow(house, sizeLimit);
            _view.addSubView(controllerArrow.view);

            _arrows.push(controllerArrow);
        }
    }

    public override function update(type:String):void
    {
        switch (type)
        {
            case EControllerUpdate.ECU_HOUSE_SELECTION_CHANGED:
            {
                for each(var arrow:IController in  _arrows)
                {
                    arrow.update(type);
                }

                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }
    }

    public override function cleanup():void
    {
        for each(var arrow:IDisposable in _arrows)
        {
            arrow.cleanup();
        }

        super.cleanup();
    }
}
}
