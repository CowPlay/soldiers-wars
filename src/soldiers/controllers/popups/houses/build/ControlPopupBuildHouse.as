/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 17.10.13
 * Time: 15:33
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.popups.houses.build
{
import controls.IControl;
import controls.IControlButton;
import controls.IControlScene;
import controls.implementations.ControlPopupBase;
import controls.implementations.buttons.ControlButtonBase;

import flash.events.MouseEvent;

import soldiers.controllers.EPopupType;

public class ControlPopupBuildHouse extends ControlPopupBase
{
    /*
     * Fields
     */
    private var _sourceViewTyped:gPopupBuildHouse;

    private var _buttonBuild:IControlButton;

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
    public function ControlPopupBuildHouse(sceneOwner:IControlScene)
    {
        super(sceneOwner);
        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gPopupBuildHouse();
        setSourceView(_sourceViewTyped);

        var buttonClose:IControl = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonClose);
        setButtonClose(buttonClose);

        _buttonBuild = new ControlButtonBase(sceneOwner, _sourceViewTyped.buttonBuild);
        _buttonBuild.actionDelegate = this;
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

    public override function cleanup():void
    {
        _buttonBuild.cleanup();
        _buttonBuild = null;

        _sourceViewTyped = null;

        super.cleanup();
    }
}
}
