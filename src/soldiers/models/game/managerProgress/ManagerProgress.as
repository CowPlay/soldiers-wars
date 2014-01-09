/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/23/13
 * Time: 9:42 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerProgress
{
import core.DisposableObject;

import flash.events.TimerEvent;
import flash.utils.Timer;

import models.interfaces.states.IState;

import soldiers.GameInfo;

import soldiers.controllers.EControllerUpdate;

import soldiers.models.game.ManagerGame;
import soldiers.models.game.managerProgress.targets.ELevelTarget;
import soldiers.models.game.managerProgress.targets.base.LTBase;

import utils.memory.UtilsMemory;

public class ManagerProgress extends DisposableObject
{
    /*
     * Fields
     */
    private var _managerGame:ManagerGame;

    private var _listenersHouseOwner:Array;
    private var _listenersTime:Array;

    private var _timer:Timer;

    /*
     * Properties
     */

    /*
     * Events
     */
    public function onHouseOwnerChanged():void
    {
        for each(var target:LTBase in _listenersHouseOwner)
        {
            target.update();
        }
    }

    private function onTimer(e:TimerEvent):void
    {
        for each(var target:LTBase in _listenersTime)
        {
            target.update();
        }

        var currentState:IState = GameInfo.instance.managerStates.currentState;

        if (currentState != null)
        {
            currentState.update(EControllerUpdate.ECU_LEVEL_TARGET_STATUS);
        }
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ManagerProgress(managerGame:ManagerGame)
    {
        Debug.assert(managerGame != null);

        _managerGame = managerGame;

        init();
    }

    private function init():void
    {
        _listenersHouseOwner = [];
        _listenersTime = [];

        initListeners(_managerGame.currentLevel.targetsStar1);
        initListeners(_managerGame.currentLevel.targetsStar2);
        initListeners(_managerGame.currentLevel.targetsStar3);

        _timer = new Timer(ConstantsBase.ANIMATION_DURATION * 4 * 1000);
        UtilsMemory.registerEventListener(_timer, TimerEvent.TIMER, this, onTimer);
    }

    private function initListeners(targets:Array):void
    {
        for each(var target:LTBase in targets)
        {
            switch (target.type)
            {
                case ELevelTarget.ELT_GRAB_ALL:
                case ELevelTarget.ELT_OWNER_NOT_GRAB_ANY:
                case ELevelTarget.ELT_OWNER_GRAB_ALL:
                case ELevelTarget.ELT_TARGET_GRAB:
                case ELevelTarget.ELT_TARGET_NOT_GRAB:
                {
                    _listenersHouseOwner.push(target);
                    break;
                }
                case ELevelTarget.ELT_TIME_LIMIT:
                case ELevelTarget.ELT_TIME_PLAY:
                {
                    _listenersTime.push(target);
                    break;
                }
                default :
                {
                    break;
                }
            }
        }
    }

    public function onGameStart():void
    {
        _timer.start();

        for each(var target:LTBase in _managerGame.currentLevel.targets)
        {
            target.onGameStart();
        }
    }

    public function onGameEnd():void
    {
        cleanupTimer();
    }

    private function cleanupTimer():void
    {
        if (_timer != null)
        {
            _timer.stop();
            UtilsMemory.unregisterEventListener(_timer, TimerEvent.TIMER, this, onTimer);
            _timer = null;
        }
    }


    override public function cleanup():void
    {
        cleanupTimer();

        super.cleanup();
    }
}
}
