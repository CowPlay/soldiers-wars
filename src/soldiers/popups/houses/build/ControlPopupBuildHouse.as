/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 17.10.13
 * Time: 15:33
 * To change this template use File | Settings | File Templates.
 */
package soldiers.popups.houses.build
{
import controls.IView;
import controls.IViewButton;
import controls.implementations.ViewPopup;
import controls.implementations.buttons.ViewButton;

import flash.events.MouseEvent;

import models.interfaces.states.IState;

import soldiers.popups.EPopupType;

public class ControlPopupBuildHouse extends ViewPopup
{
    /*
     * Fields
     */
    private var _sourceView:gPopupBuildHouse;

    private var _buttonBuild:IViewButton;

    /*
     * Properties
     */
    public override function get type():String
    {
        return EPopupType.EPT_VILLAGE_HOUSE_BUILD;
    }

    /*
     * Methods
     */
    public function ControlPopupBuildHouse()
    {
        _sourceView = new gPopupBuildHouse();
        super(_sourceView);

        init();
    }

    private function init():void
    {
        var buttonClose:IView = new ViewButton(this, _sourceView.buttonClose);
        setButtonClose(buttonClose);

        _buttonBuild = new ViewButton(this, _sourceView.buttonBuild);
//        _buttonBuild.actionDelegate = this;
    }

    public override function onControlMouseClick(target:IView, e:MouseEvent):Boolean
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

    public override function cleanup():void
    {
        _buttonBuild.cleanup();
        _buttonBuild = null;

        _sourceView = null;

        super.cleanup();
    }
}
}
