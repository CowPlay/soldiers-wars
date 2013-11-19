/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 12.11.13
 * Time: 12:43
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.popups.levels
{
import controllers.implementations.ControllerPopup;

import controls.IView;

import flash.events.MouseEvent;

import soldiers.models.GameInfo;
import soldiers.popups.EPopupType;
import soldiers.states.EStateType;
import soldiers.views.popups.ViewPopupLevel;

public class ControllerPopupLevelEnd extends ControllerPopup
{
    /*
     * Fields
     */
    private var _view:ViewPopupLevel;

    /*
     * Properties
     */
    public override function get type():String
    {
        return EPopupType.EPT_LEVEL_END;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerPopupLevelEnd()
    {
        _view = new ViewPopupLevel(this);

        super(_view);

        init();
    }

    private function init():void
    {

    }

    /*
     * ActionDelegate
     */
    public override function onViewClicked(view:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewClicked(view, e);

        if (!result)
        {
            switch (view)
            {
                case _view.button:
                {
                    onButtonCloseClicked();

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

    override protected function onButtonCloseClicked():void
    {
        super.onButtonCloseClicked();

        GameInfo.instance.onGameEnd();

        GameInfo.instance.managerStates.setState(EStateType.EST_GAME_MAP);
    }
}
}
