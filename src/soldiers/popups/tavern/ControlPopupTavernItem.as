/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 18.10.13
 * Time: 15:08
 * To change this template use File | Settings | File Templates.
 */
package soldiers.popups.tavern
{
import controls.IView;
import controls.IViewButton;
import controls.implementations.ControlBase;
import controls.implementations.buttons.ViewButton;

import flash.events.MouseEvent;

import models.interfaces.states.IState;

public class ControlPopupTavernItem extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceView:gPopupTavernItem;

    private var _buttonAccelerate:IViewButton;
    /*
     * Properties
     */


    /*
     * Methods
     */

    public function ControlPopupTavernItem(parent:IView)
    {
        _sourceView = new gPopupTavernItem();
        super(parent, _sourceView);

        init();
    }

    private function init():void
    {
        _buttonAccelerate = new ViewButton(this, _sourceView.buttonAccelerate);
//        _buttonAccelerate.actionDelegate = this;
    }

    public override function onControlMouseClick(target:IView, e:MouseEvent):Boolean
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

    public override function cleanup():void
    {
        _buttonAccelerate.cleanup();
        _buttonAccelerate = null;

        _sourceView = null;

        super.cleanup();
    }
}
}
