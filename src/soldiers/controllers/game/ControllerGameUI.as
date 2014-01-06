/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/5/14
 * Time: 2:32 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game
{
import controllers.implementations.Controller;

import flash.events.MouseEvent;

import soldiers.views.game.ViewGameUI;

import views.IView;

public class ControllerGameUI extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewGameUI;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerGameUI()
    {
        _view = new ViewGameUI(this);
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

    public override function cleanup():void
    {
        super.cleanup();
    }
}
}
