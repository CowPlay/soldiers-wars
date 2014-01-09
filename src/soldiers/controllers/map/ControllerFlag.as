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

import flash.events.MouseEvent;

import models.interfaces.levels.ILevelInfo;

import soldiers.GameInfo;
import soldiers.controllers.popups.levelStart.ControllerPopupLevelStart;
import soldiers.models.levels.LevelInfo;
import soldiers.popups.EPopupType;
import soldiers.views.map.ViewFlag;

import utils.UtilsFilters;

import views.IView;

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

    public function set isEnabled(value:Boolean):void
    {
        _view.handleEvents(value);
        _view.source.filters = value ? [] : [UtilsFilters.FILTER_GRAYSCALE];
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerFlag(entry:LevelInfo, isCurrent:Boolean)
    {
        _view = new ViewFlag(this, isCurrent, entry.starsCount);

        super(_view);

        _entry = entry;
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
