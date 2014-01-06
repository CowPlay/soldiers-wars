/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 5/31/13
 * Time: 11:39 AM
 * To change this template use File | Settings | File Templates.
 */

package soldiers.models.game.managerSoldiers
{

import core.DisposableObject;

import flash.events.TimerEvent;
import flash.utils.Timer;
import flash.utils.getTimer;

import soldiers.GameInfo;
import soldiers.controllers.EControllerUpdate;
import soldiers.models.game.ManagerGame;
import soldiers.models.game.managerPath.ManagerPath;
import soldiers.models.game.soldiers.ESoldierState;
import soldiers.models.game.soldiers.SoldierInfo;
import soldiers.models.housesGame.base.HouseG;

import utils.UtilsArray;

public class ManagerSoldiers extends DisposableObject implements IDisposable
{
    /*
     * Fields
     */

    private var _managerGame:ManagerGame;

    private var _timerSoldierGenerator:Timer;

    private var _soldierWaves:Array;

    private var _soldiers:Array;

    /*
     * Properties
     */
    public function get soldiers():Array
    {
        return _soldiers;
    }

    /*
     * Events
     */


    /*
     * Methods
     */


    //! Default constructor
    public function ManagerSoldiers(managerGame:ManagerGame)
    {
        _managerGame = managerGame;
        init();
    }

    private function init():void
    {
        _soldierWaves = [];

        _soldiers = [];

        _timerSoldierGenerator = new Timer(ConstantsBase.ANIMATION_DURATION * 1000 * 4);
        _timerSoldierGenerator.addEventListener(TimerEvent.TIMER, processWave);
        _timerSoldierGenerator.start();
    }

    public function processWave(e:TimerEvent):void
    {
        var wavesForRemove:Array = [];

        for each(var waveInfo:SoldierWaveInfo in _soldierWaves)
        {
            if (waveInfo.generatedSoldierRest == 0)
            {
                wavesForRemove.push(waveInfo);
                continue;
            }

            var currentTime:Number = getTimer();

            var isFirstProcess:Boolean = waveInfo.timeGenerated == 0;
            var isTimeForGenerate:Boolean = currentTime - waveInfo.timeGenerated > waveInfo.timeGeneratedFrequency;

            if (!isTimeForGenerate)
            {
                continue;
            }

            if (isFirstProcess)
            {
                waveInfo.generatedSoldierRest = Math.min(waveInfo.generatedSoldierRest, waveInfo.houseOwner.soldierCount);
                waveInfo.houseOwner.soldierCount -= waveInfo.generatedSoldierRest;
            }

            waveInfo.timeGenerated = currentTime;

            var paths:Array = _managerGame.managerPath.getPaths(waveInfo.houseOwner, waveInfo.houseTarget);

            for (var i:int = 0; i < waveInfo.generatedSoldierCount; i++)
            {
                if (waveInfo.generatedSoldierRest == 0 || waveInfo.houseOwner.soldierCount == 0)
                {
                    wavesForRemove.push(waveInfo);
                    break;
                }

                generateWaveSoldiers(waveInfo, paths[i]);
            }
        }

        //remove waves which done
        for each(var waveInfoRemove:SoldierWaveInfo in wavesForRemove)
        {
            UtilsArray.removeValue(_soldierWaves, waveInfoRemove);
            waveInfoRemove.cleanup();
        }
    }

    private function generateWaveSoldiers(waveInfo:SoldierWaveInfo, path:Array):void
    {
        var newSoldier:SoldierInfo = new SoldierInfo( waveInfo.houseOwnerType,waveInfo.houseOwnerLevel, waveInfo.houseOwnerLevelMax, waveInfo.houseOwnerPlayer, waveInfo.houseTarget, path);

        _soldiers.push(newSoldier);

        GameInfo.instance.managerStates.currentState.update(EControllerUpdate.ECU_SOLDIER_STATE_CHANGED);

        waveInfo.generatedSoldierRest--;

        if (waveInfo.generatedSoldierRest == 0)
        {
            newSoldier.isLastOnWave = true;
        }
    }

    public function generateSoldiers(owner:HouseG, target:HouseG, soldierCount:int):void
    {
        Debug.assert(owner != null);
        Debug.assert(target != null);

        var newWave:SoldierWaveInfo = new SoldierWaveInfo(owner, target);

        newWave.generatedSoldierRest = soldierCount;

        trace("generate soldiers " + soldierCount.toString())

        _soldierWaves.push(newWave);
    }

    public function removeSoldier(value:SoldierInfo):void
    {
        value.state = ESoldierState.ESS_NEED_REMOVE;
        UtilsArray.removeValue(_soldiers, value);
        value.cleanup();
    }


    /*
     * IDisposable
     */

    public override function cleanup():void
    {
        _timerSoldierGenerator.stop();
        _timerSoldierGenerator.removeEventListener(TimerEvent.TIMER, processWave);
        _timerSoldierGenerator = null;

        for each(var wave:IDisposable in _soldierWaves)
        {
            wave.cleanup();
        }

        for each(var soldier:IDisposable in _soldiers)
        {
            soldier.cleanup();
        }

        super.cleanup();
    }
}
}
