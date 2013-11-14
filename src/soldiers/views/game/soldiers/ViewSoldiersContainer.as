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

import controls.IView;
import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

import models.interfaces.states.IState;

import soldiers.controllers.EControllerUpdate;
import soldiers.models.GameInfo;
import soldiers.models.game.soldiers.SoldierInfo;

public class ViewSoldiersContainer extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceView:DisplayObjectContainer;
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

        _sourceView.mouseChildren = false;
        _sourceView.mouseEnabled = false;
    }



}
}
