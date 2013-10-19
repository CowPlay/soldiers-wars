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
package soldiers.controllers.popups.bakery
{
import controls.IControl;
import controls.IControlButton;
import controls.IControlScene;
import controls.implementations.ControlBase;
import controls.implementations.buttons.ControlButtonBase;

import flash.events.MouseEvent;

public class ControlPopupBakeryItem extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceViewTyped:gPopupBakeryItem;

    private var _buttonBuild:IControlButton;
    /*
     * Properties
     */


    /*
     * Methods
     */

    public function ControlPopupBakeryItem(sceneOwner:IControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gPopupBakeryItem();
        setSourceView(_sourceViewTyped);

        _buttonBuild = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonBuild);
        _buttonBuild.actionDelegate = this;

        _sourceViewTyped.labelCount.text = "2222";
        _sourceViewTyped.labelTimer.text = "555"
    }

    public override function onControlMouseClick(target:IControl, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onControlMouseClick(target, e);

        if (!result)
        {
            switch (target)
            {
                case _buttonBuild:
                {
                    result = true;
                    break;
                }
                default :
                {
                    Debug.assert(false);
                    break;
                }
            }
        }

        return result;
    }

    public override function placeViews():void
    {
        super.placeViews();


    }
}
}
