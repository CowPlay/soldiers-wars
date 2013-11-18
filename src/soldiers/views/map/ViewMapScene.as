/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 11.11.13
 * Time: 14:07
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.map
{
import controllers.IController;

import controls.IView;

import controls.implementations.ControlBase;

import soldiers.views.popups.ViewPopupLevel;

public class ViewMapScene extends ControlBase
{
    /*
     * Fields
     */
    private var _items:Array;

    private var _sourceView:gSceneMap;

    /*
     * Properties
     */

    /*
     * Methods
     */
    public function ViewMapScene(controller:IController)
    {
        _sourceView = new gSceneMap();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
       _items = [];
    }

    override public function addSubView(view:IView):void
    {
        _sourceView.addChild(view.source);
        _items.push(view);
    }

    public override function placeViews(isFullscreen:Boolean):void
    {
        super.placeViews(isFullscreen);

        var itemView:ViewFlagItem = _items[0];
        itemView.source.x = 80;
        itemView.source.y = 172;
    }

    public override function cleanup():void
    {
        _sourceView = null;

        super.cleanup();
    }
}
}
