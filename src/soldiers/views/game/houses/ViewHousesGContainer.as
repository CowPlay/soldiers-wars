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

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.geom.Point;

public class ViewHousesGContainer extends ControlBase
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
    public function ViewHousesGContainer(controller:IController)
    {
        _sourceView = new Sprite();
        super(controller, _sourceView);

        handleEvents(false, false, false, true);

        alignment = EViewAlignment.EVA_ABSOLUTE;

        anchorPoint = new Point(0.5, 0);

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
