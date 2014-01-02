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
package soldiers.popups.militaryAcademy
{
import views.IView;
import views.IViewButton;
import views.implementations.ViewBase;
import controls.implementations.buttons.ViewButtonLabeled;

import flash.events.MouseEvent;

import models.interfaces.states.IState;

public class ControlPopupMilitaryAcademyItem extends ViewBase
{
    /*
     * Fields
     */
    private var _sourceView:gPopupMilitaryAcademyItem;

    private var _buttonStudy:IViewButton;
    private var _buttonAccelerate:IViewButton;


    /*
     *Properties
     */

    /*
     * Methods
     */
    public function ControlPopupMilitaryAcademyItem(parent:IView)
    {
        _sourceView = new gPopupMilitaryAcademyItem();
        super(parent, _sourceView);

        init();
    }

    private function init():void
    {
        _buttonStudy = new ViewButtonLabeled(this, _sourceView.buttonStudy);
//        _buttonStudy.actionDelegate = this;

        _buttonAccelerate = new ViewButtonLabeled(this, _sourceView.buttonAccelerate);
//        _buttonAccelerate.actionDelegate = this;
    }

    /*
     * IActionDelegate
     */
    public override function onControlMouseClick(target:IView, e:MouseEvent):Boolean
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

        _sourceView = null;

        super.cleanup();
    }
}
}
