/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 11.11.13
 * Time: 16:48
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.map
{
import controllers.implementations.Controller;

import controls.IView;

import flash.events.MouseEvent;

import models.interfaces.levels.ILevelInfo;

import soldiers.models.GameInfo;
import soldiers.popups.EPopupType;
import soldiers.states.EStateType;

import soldiers.views.map.ViewFlagItem;

public class ControllerFlagItem extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewFlagItem;

    private var _entry:ILevelInfo;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerFlagItem(entry:ILevelInfo)
    {
        _view = new ViewFlagItem(this);

        _entry = entry;

        super(_view);

        init();
    }

    private function init():void
    {

    }

    public override function cleanup():void
    {
        _entry = null;

        super.cleanup();
    }

    /*
     *ActionDelegate
     */
    public override function onViewClicked(target:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewClicked(target, e);

        if (!result)
        {
            switch (target.source)
            {
                case _view.source:
                {
                    GameInfo.instance.managerStates.currentState.showPopup(EPopupType.EPT_LEVEL_START);

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
}
}
