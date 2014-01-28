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
import controllers.IController;

import soldiers.controllers.EControllerUpdate;
import soldiers.controllers.base.ControllerUIBase;
import soldiers.controllers.game.ui.ControllerProgress;
import soldiers.views.game.ViewGameUI;

public class ControllerGameUI extends ControllerUIBase
{
    /*
     * Fields
     */
    private var _view:ViewGameUI;
    private var _controllerProgress:IController;

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
        _controllerProgress = new ControllerProgress();
        _view.viewProgress = _controllerProgress.view;
    }

    override public function update(type:String):void
    {
        switch (type)
        {
            case EControllerUpdate.ECU_LEVEL_TARGET_STATUS:
            {
                _controllerProgress.update(type);
                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }
    }

    public override function cleanup():void
    {
        _controllerProgress.cleanup();
        super.cleanup();
    }
}
}
