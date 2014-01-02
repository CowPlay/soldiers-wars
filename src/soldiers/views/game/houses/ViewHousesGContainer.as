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

import views.EViewPosition;
import views.IView;
import views.implementations.ViewBase;

import flash.display.DisplayObjectContainer;

import flash.display.Sprite;
import flash.geom.Point;

import soldiers.GameInfo;
import soldiers.models.game.managerPath.GridCell;
import soldiers.models.game.managerPath.ManagerPath;

public class ViewHousesGContainer extends ViewBase
{
    /*
     * Fields
     */
    private var _sourceView:DisplayObjectContainer;

    private var _houses:Array;


    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ViewHousesGContainer(controller:IController, sourceView:DisplayObjectContainer)
    {
        _sourceView = sourceView;
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
        _houses = [];
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
