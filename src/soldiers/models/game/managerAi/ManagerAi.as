/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/23/13
 * Time: 12:04 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerAi
{
import core.DisposableObject;

import flash.events.TimerEvent;
import flash.utils.Dictionary;
import flash.utils.Timer;
import flash.utils.getTimer;

import soldiers.Constants;
import soldiers.models.game.ManagerGame;
import soldiers.models.game.managerAi.aiActions.FactoryAiActions;
import soldiers.models.game.managerAi.aiActions.IAiAction;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;

import utils.memory.UtilsMemory;

public class ManagerAi extends DisposableObject
{
    /*
     * Fields
     */
    private var _managerGame:ManagerGame;

    //key - house owner, value - actions collection
    private var _actions:Dictionary;

    private var _timerActionsApply:Timer;

    //key - time for apply, value - actions collection
    private var _actionQueue:Dictionary;

    private var _aiDecisionLastTime:int;

    private var _timerActionsAdd:Timer;

    /*
     * Properties
     */

    /*
     * Events
     */
    private function tryApplyActions(e:TimerEvent):void
    {
        var keysForRemove:Array = [];

        var currentTime:int = getTimer();

        for (var key:Object in _actionQueue)
        {
            if (key <= currentTime)
            {
                keysForRemove.push(key);
                var actions:Array = _actionQueue[key];

                for each(var action:IAiAction in actions)
                {
                    if (action.canApply)
                    {
                        action.apply();
                    }
                }
            }
        }

        for each(var keyForRemove:int in keysForRemove)
        {
            delete _actionQueue[keyForRemove];
        }
    }

    public function onGameStart():void
    {
        tryAddActionToQueue();
    }

    public function onGameEnd():void
    {
        _timerActionsApply.stop();
        UtilsMemory.unregisterEventListener(_timerActionsApply, TimerEvent.TIMER, this, tryApplyActions);

        _timerActionsAdd.stop();
        UtilsMemory.unregisterEventListener(_timerActionsAdd, TimerEvent.TIMER, this, tryAddActionToQueue);
    }

    public function onWavePlayerGenerate(target:HouseG):void
    {
        if (target.ownerType != EHouseOwner.EHO_PLAYER)
        {
            tryAddActionToQueue();
        }
    }

    public function onWaveEnemyDied():void
    {
        trace("onWaveEnemyDied " + getTimer().toString());
        tryAddActionToQueue();
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ManagerAi(managerGame:ManagerGame)
    {
        _managerGame = managerGame;

        init();
    }

    private function init():void
    {
        _actionQueue = new Dictionary(true);
        _actions = new Dictionary(true);

        var actionsData:Array = _managerGame.currentLevel.aiActionsData;

        var houses:Array = _managerGame.houses;

        for each(var house:HouseG in houses)
        {
            var actions:Array = [];

            for each(var actionData:Object  in actionsData)
            {
                var action:Object = FactoryAiActions.getAction(actionData, house, _managerGame);
                actions.push(action);
            }

            _actions[house] = actions;
        }

        _timerActionsApply = new Timer(ConstantsBase.ANIMATION_DURATION * 1000);
        UtilsMemory.registerEventListener(_timerActionsApply, TimerEvent.TIMER, this, tryApplyActions);
        _timerActionsApply.start();

        _timerActionsAdd = new Timer(ConstantsBase.ANIMATION_DURATION * 1000 * 4 * 5);
        UtilsMemory.registerEventListener(_timerActionsAdd, TimerEvent.TIMER, this, tryAddActionToQueue);
        _timerActionsAdd.start();
    }

    private function tryAddActionToQueue(e:TimerEvent = null):void
    {
        var currentTime:int = getTimer();

        if (_aiDecisionLastTime + Constants.AI_DECISION_TIME_MIN <= currentTime)
        {
            for each(var actions:Array in _actions)
            {
                for each(var action:IAiAction in actions)
                {
                    if (action.owner.ownerType != EHouseOwner.EHO_ENEMY)
                    {
                        break;
                    }

                    if (action.canApply)
                    {
                        var timeForApply:int = currentTime + action.timeReaction;

                        var actionsQueue:Array = _actionQueue[timeForApply] == null ? [] : _actionQueue[timeForApply];

                        actionsQueue.push(action);

                        _actionQueue[timeForApply] = actionsQueue;

                        break;
                    }
                }
            }

            _aiDecisionLastTime = currentTime;
            trace("add actions on" + currentTime.toString());
        }

    }
}
}
