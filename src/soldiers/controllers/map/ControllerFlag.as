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

import views.IView;
import views.implementations.ViewBase;

import flash.events.MouseEvent;

import models.interfaces.levels.ILevelInfo;

import soldiers.GameInfo;
import soldiers.controllers.popups.levelStart.ControllerPopupLevelStart;
import soldiers.models.levels.LevelInfo;
import soldiers.popups.EPopupType;

public class ControllerFlag extends Controller
{
    /*
     * Fields
     */
    private var _view:IView;

    private var _entry:ILevelInfo;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerFlag(entry:ILevelInfo, isCurrent:Boolean)
    {
        _view = new ViewBase(this, isCurrent ? new gViewFlagCurrent() : new gViewFlag());

        _entry = entry;

        super(_view);

        init();
    }

    private function init():void
    {
        _view.handleEvents(true);
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

                    var popupLevelStart:ControllerPopupLevelStart = GameInfo.instance.managerStates.currentState.getPopupByType(EPopupType.EPT_LEVEL_START) as ControllerPopupLevelStart;

                    popupLevelStart.entry = _entry as LevelInfo;

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


    public override function cleanup():void
    {
        _entry = null;

        super.cleanup();
    }
}
}
