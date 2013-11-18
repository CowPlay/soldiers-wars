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

import soldiers.controllers.EControllerUpdate;
import soldiers.models.GameInfo;
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
    public function ControllerArrowContainer()
    {
        _view = new ViewArrowContainer(this);
        super(_view);

        init();
    }

    private function init():void
    {
        var houses:Array = GameInfo.instance.managerGame.currentLevel.houses;

        _arrows = [];
        for each(var house:HouseG in houses)
        {
            var controllerArrow:ControllerArrow = new ControllerArrow(house);
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
}
}
