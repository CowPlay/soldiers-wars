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

import views.IViewScroll;
import views.implementations.ViewBase;
import views.implementations.ViewScroll;

import flash.display.DisplayObject;
import flash.display.Sprite;

import soldiers.GameInfo;

public class ViewVillageScene extends ViewBase
{
    /*
     * Fields
     */
    //TODO: impleemnt
//    private var _sourceView:gSceneVillage;
    private var _sourceView:Sprite;

    private var _controlScroll:IViewScroll;

    /*
     * Properties
     */


    override public function get source():DisplayObject
    {
        return _controlScroll.source;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ViewVillageScene(controller:IController)
    {
//        _sourceView = new gSceneVillage();
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

        _controlScroll.size = GameInfo.instance.managerApp.applicationSize;
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
