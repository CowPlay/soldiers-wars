/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/7/14
 * Time: 8:57 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game.ui
{
import controllers.implementations.Controller;

import models.interfaces.string.IManagerString;

import mx.utils.StringUtil;

import soldiers.GameInfo;
import soldiers.controllers.EControllerUpdate;
import soldiers.models.game.ManagerGame;
import soldiers.models.game.managerProgress.targets.ELevelTarget;
import soldiers.models.game.managerProgress.targets.base.LTBase;
import soldiers.models.game.managerProgress.targets.grab.LTGrabAll;
import soldiers.models.game.managerProgress.targets.grab.owner.LTOwnerBase;
import soldiers.models.game.managerProgress.targets.grab.owner.LTOwnerGrabAll;
import soldiers.models.game.managerProgress.targets.grab.owner.LTOwnerNotGrabAny;
import soldiers.models.game.managerProgress.targets.grab.target.LTTargetBase;
import soldiers.models.game.managerProgress.targets.time.LTTimeLimit;
import soldiers.models.game.managerProgress.targets.time.LTTimePlay;
import soldiers.views.game.ui.ViewProgress;

public class ControllerProgress extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewProgress;

    /*
     * Properties
     */
    private var _managerGame:ManagerGame;
    private var _managerString:IManagerString;

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerProgress()
    {
        _managerGame = GameInfo.instance.managerGame;

        _view = new ViewProgress(this, _managerGame.currentLevel.targetsStar1.length, _managerGame.currentLevel.targetsStar2.length, _managerGame.currentLevel.targetsStar3.length);
        super(_view);

        init();
    }

    private function init():void
    {
        _managerString = GameInfo.instance.managerString;

        updateView();
    }

    private function getTargetText(target:LTBase):String
    {
        var result:String = _managerString.localizedString(target.type);

        switch (target.type)
        {
            case  ELevelTarget.ELT_TARGET_NOT_GRAB:
            case ELevelTarget.ELT_TARGET_GRAB:
            {
                result = StringUtil.substitute(result, (target as LTTargetBase).targetHouseId);

                break;
            }

            case ELevelTarget.ELT_GRAB_ALL:
            {
                result = StringUtil.substitute(result, (target as LTGrabAll).housesRest);

                break;
            }
            case ELevelTarget.ELT_OWNER_NOT_MISSING_ANY:
            case ELevelTarget.ELT_OWNER_NOT_GRAB_ANY:
            {
                result = StringUtil.substitute(result, (target as LTOwnerBase).targetOwnerType);

                break;
            }
            case  ELevelTarget.ELT_OWNER_GRAB_ALL:
            {
                result = StringUtil.substitute(result, (target as LTOwnerGrabAll).targetOwnerType, (target as LTOwnerGrabAll).housesRest);

                break;
            }
            case ELevelTarget.ELT_TIME_LIMIT:
            {
                result = StringUtil.substitute(result, (target as LTTimeLimit).timeLeft);

                break;
            }
            case ELevelTarget.ELT_TIME_PLAY:
            {
                result = StringUtil.substitute(result, (target as LTTimePlay).time - (target as LTTimePlay).timePlay);

                break;
            }
            default :
            {
                //do nothing
                break;
            }
        }

        return result;
    }


    override public function update(type:String):void
    {

        switch (type)
        {
            case EControllerUpdate.ECU_LEVEL_TARGET_STATUS:
            {
                updateView();

                if (_managerGame.currentLevel.target1Complete)
                {
                    _managerGame.onTarget1Complete();
                }

                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }
    }

    private function updateView():void
    {
        var currentTargetIndex:uint = 0;

        var currentTarget:LTBase;
        var text:String;

        for each(currentTarget in _managerGame.currentLevel.targetsStar1)
        {
            text = getTargetText(currentTarget);

            _view.onTargetChangeStatus(currentTargetIndex, currentTarget.isComplete(), text);

            currentTargetIndex++;
        }

        for each(currentTarget  in _managerGame.currentLevel.targetsStar2)
        {
            text = getTargetText(currentTarget);

            _view.onTargetChangeStatus(currentTargetIndex, currentTarget.isComplete(), text);

            currentTargetIndex++;
        }

        for each(currentTarget in _managerGame.currentLevel.targetsStar3)
        {
            text = getTargetText(currentTarget);

            _view.onTargetChangeStatus(currentTargetIndex, currentTarget.isComplete(), text);

            currentTargetIndex++;
        }

    }
}
}
