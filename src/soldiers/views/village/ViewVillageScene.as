/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/7/13
 * Time: 4:17 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.village
{
import controllers.IController;

import controls.IViewScroll;
import controls.implementations.ControlBase;
import controls.implementations.ViewScroll;

import flash.display.DisplayObject;

import soldiers.models.GameInfo;

public class ViewVillageScene extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceView:gSceneVillage;

    private var _controlScroll:IViewScroll;

    /*
     * Properties
     */


    override public function get sourceView():DisplayObject
    {
        return _controlScroll.sourceView;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ViewVillageScene(controller:IController)
    {
        _sourceView = new gSceneVillage();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
        _controlScroll = new ViewScroll(controller, _sourceView, GameInfo.instance.managerApp.applicationSize);
    }

    public override function placeViews(isFullscreen:Boolean):void
    {
        super.placeViews(isFullscreen);

        _controlScroll.controlSize = GameInfo.instance.managerApp.applicationSize;
    }

    public override function cleanup():void
    {
        _controlScroll.cleanup();
        _controlScroll = null;

        _sourceView = null;

        super.cleanup();
    }
}
}
