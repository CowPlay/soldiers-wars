/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 18.10.13
 * Time: 11:28
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.popups.houses.bakery
{
import controllers.IController;

import views.IViewButton;
import views.implementations.ViewBase;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.text.TextField;

public class ViewPopupBakeryItem extends ViewBase
{
    /*
     * Fields
     */
    private var _sourceView:Sprite;

//    private var _sourceView:gPopupBakeryItem;

    private var _buttonBuild:IViewButton;

    /*
     * Properties
     */
    public function get labelCount():TextField
    {
//        return _sourceView.labelCount;
        return null;
    }

    public function get labelTimer():TextField
    {
//        return _sourceView.labelTimer;
        return null;

    }


    public function get buttonBuild():IViewButton
    {
        return _buttonBuild;
    }

    //TODO: make view animation
    public function get iconLock():DisplayObject
    {
//        return _sourceView.iconLock;
        return null;

    }

    /*
     * Methods
     */

    public function ViewPopupBakeryItem(controller:IController)
    {
//        _sourceView = new gPopupBakeryItem();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
//        _buttonBuild = new ViewButtonLabeled(controller, _sourceView.buttonBuild);
    }


    /*
     * IControl
     */

    public override function cleanup():void
    {
        _buttonBuild.cleanup();
        _buttonBuild = null;

        _sourceView = null;

        super.cleanup();
    }
}
}
