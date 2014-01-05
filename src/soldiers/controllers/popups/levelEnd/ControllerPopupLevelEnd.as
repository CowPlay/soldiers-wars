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
package soldiers.controllers.popups.levelEnd
{
import controllers.implementations.ControllerPopup;

import views.IView;

import flash.events.MouseEvent;

import models.implementations.players.PlayerInfoBase;
import models.interfaces.players.IPlayerInfo;

import soldiers.GameInfo;
import soldiers.models.game.ManagerGame;
import soldiers.models.levels.LevelInfo;
import soldiers.popups.EPopupType;
import soldiers.states.EStateType;
import soldiers.views.popups.levelEnd.ViewPopupLevelEnd;

public class ControllerPopupLevelEnd extends ControllerPopup
{
    /*
     * Fields
     */
    private var _view:ViewPopupLevelEnd;

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
        _view = new ViewPopupLevelEnd(this);

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
        //TODO: review
        var result:Boolean = false;

        if (!result)
        {
            switch (view)
            {
//                case _view.buttonClose:
//                {
//                    GameInfo.instance.onGameEnd();

//                    GameInfo.instance.managerStates.setState(EStateType.EST_GAME_MAP);
//
//  /                  break;
//                }
                case _view.buttonClose:
                {
                    GameInfo.instance.onGameEnd();

                    var nextLevel:LevelInfo = GameInfo.instance.managerLevels.getSavedOrIncompleteLevel() as LevelInfo;

                    var player0:IPlayerInfo = new PlayerInfoBase();
                    var player1:IPlayerInfo = new PlayerInfoBase();

                    var managerGame:ManagerGame = new ManagerGame(nextLevel, player0, player1);

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

}
}
