/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 18.10.13
 * Time: 15:08
 * To change this template use File | Settings | File Templates.
 */
package controllers.popups.tavern
{
import controls.IControl;
import controls.IControlButton;
import controls.IControlScene;
import controls.implementations.ControlBase;
import controls.implementations.buttons.ControlButtonBase;

import flash.events.MouseEvent;

public class ControlPopupTavernItem  extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceViewTyped:gPopupTavernItem;

    private var _buttonAccelerate:IControlButton;
    /*
     * Properties
     */


    /*
     * Methods
     */

    public function ControlPopupTavernItem(sceneOwner:IControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gPopupTavernItem();
        setSourceView(_sourceViewTyped);

        _buttonAccelerate = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonAccelerate);
        _buttonAccelerate.actionDelegate = this;


    }

    public override function onControlMouseClick(target:IControl, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onControlMouseClick(target, e);

        if (!result)
        {
            switch (target)
            {
                case _buttonAccelerate:
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
