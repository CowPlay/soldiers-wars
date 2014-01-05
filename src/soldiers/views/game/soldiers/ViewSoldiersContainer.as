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

import views.EViewPosition;
import views.IView;
import views.implementations.ViewBase;

import flash.display.DisplayObjectContainer;
import flash.events.Event;
import flash.geom.Point;

import soldiers.GameInfo;

import utils.UtilsArray;

public class ViewSoldiersContainer extends ViewBase
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
    public function ViewSoldiersContainer(controller:IController, sourceView:DisplayObjectContainer)
    {
        _sourceView = sourceView;
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
        _soldiers = [];
    }


    override public function addSubView(view:IView):void
    {
        Debug.assert(view is ViewSoldier);

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
