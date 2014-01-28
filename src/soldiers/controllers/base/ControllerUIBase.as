/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/15/14
 * Time: 3:08 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.base
{
import controllers.implementations.Controller;

import flash.events.MouseEvent;

import soldiers.views.base.ViewUIBase;

import views.IView;

public class ControllerUIBase extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewUIBase;
    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerUIBase(view:ViewUIBase)
    {
        _view = view;
        super(_view);

        init();
    }

    private function init():void
    {
    }

    override public function onViewClicked(view:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewClicked(view, e);

        if (!result)
        {
            switch (view)
            {
                case _view.viewOptions.buttonFullscreen:
                {
                    GameInfoBase.instance.managerApp.fullScreenEnable = !GameInfoBase.instance.managerApp.fullScreenEnable;

                    result = true;

                    break;
                }
                case _view.viewOptions.buttonMusic:
                case _view.viewOptions.buttonScreenshot:
                case _view.viewOptions.buttonSound:
                {
                    //do nothing
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
