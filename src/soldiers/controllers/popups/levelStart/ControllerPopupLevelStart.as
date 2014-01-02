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
package soldiers.controllers.popups.levelStart
{
import controllers.implementations.ControllerPopup;

import views.IView;

import flash.events.MouseEvent;

import models.implementations.players.PlayerInfoBase;

import models.interfaces.levels.ILevelInfo;
import models.interfaces.players.IPlayerInfo;

import soldiers.GameInfo;
import soldiers.models.game.ManagerGame;
import soldiers.models.levels.LevelInfo;
import soldiers.popups.EPopupType;
import soldiers.states.EStateType;
import soldiers.views.popups.levelStart.ViewPopupLevelStart;

public class ControllerPopupLevelStart extends ControllerPopup
{
    /*
     * Fields
     */
    private var _view:ViewPopupLevelStart;

    private var _entry:LevelInfo;
    /*
     * Properties
     */
    public override function get type():String
    {
        return EPopupType.EPT_LEVEL_START;
    }

    public function set entry(value:LevelInfo):void
    {
        Debug.assert(value != null);

        _entry = value;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerPopupLevelStart()
    {
        _view = new ViewPopupLevelStart(this);

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
                case _view.buttonStart:
                {
                    var player0:IPlayerInfo = new PlayerInfoBase();
                    var player1:IPlayerInfo = new PlayerInfoBase();

                    var managerGame:ManagerGame = new ManagerGame(_entry, player0, player1);

                    GameInfo.instance.onGameStart(managerGame);

                    GameInfo.instance.managerStates.setState(EStateType.EST_GAME);

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
