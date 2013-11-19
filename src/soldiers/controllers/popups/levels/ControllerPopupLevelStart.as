/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 12.11.13
 * Time: 11:43
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.popups.levels
{
import controllers.implementations.ControllerPopup;

import controls.IView;

import flash.events.MouseEvent;

import soldiers.models.GameInfo;
import soldiers.popups.EPopupType;
import soldiers.views.popups.ViewPopupLevel;

public class ControllerPopupLevelStart extends ControllerPopup
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
        return EPopupType.EPT_LEVEL_START;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerPopupLevelStart()
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
                    GameInfo.instance.startStubGame();

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
        super.cleanup();
    }
}
}
