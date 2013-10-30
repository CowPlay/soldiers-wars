/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: Evgenyi
 * Date: 20.10.13
 * Time: 18:44
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.popups.militaryAcademy
{
import controls.IControl;
import controls.IControlButton;
import controls.IControlScene;
import controls.implementations.ControlBase;
import controls.implementations.buttons.ControlButtonWithLabelsBase;

import flash.events.MouseEvent;

public class ControlPopupMilitaryAcademyItem extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceViewTyped:gPopupMilitaryAcademyItem;

    private var _buttonStudy:IControlButton;
    private var _buttonAccelerate:IControlButton;


    /*
     *Properties
     */

    /*
     * Methods
     */
    public function ControlPopupMilitaryAcademyItem(sceneOwner:IControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gPopupMilitaryAcademyItem();
        setSourceView(_sourceViewTyped);

        _buttonStudy = new ControlButtonWithLabelsBase(sceneOwner, _sourceViewTyped.buttonStudy);
        _buttonStudy.actionDelegate = this;

        _buttonAccelerate = new ControlButtonWithLabelsBase(sceneOwner, _sourceViewTyped.buttonAccelerate);
        _buttonAccelerate.actionDelegate = this;
    }

    /*
     * IActionDelegate
     */
    public override function onControlMouseClick(target:IControl, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onControlMouseClick(target, e);

        if (!result)
        {
            switch (target)
            {
                case _buttonStudy:
                {
                    result = true;
                    break;
                }
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

    public override function cleanup():void
    {
        _buttonAccelerate.cleanup();
        _buttonAccelerate = null;

        _buttonStudy.cleanup();
        _buttonStudy = null;

        _sourceViewTyped = null;

        super.cleanup();
    }
}
}
