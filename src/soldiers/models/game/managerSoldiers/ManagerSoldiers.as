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
        _timerSoldierGenerator.addEventListener(TimerEvent.TIMER, processWaves);
        _timerSoldierGenerator.start();
    }

    public function processWaves(e:TimerEvent):void
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

            var isTimeForGenerate:Boolean = currentTime - waveInfo.timeGenerated > waveInfo.timeGeneratedFrequency;

            if (!isTimeForGenerate)
            {
                continue;
            }

            var needRemove:Boolean = processWave(waveInfo);

            if (needRemove)
            {
                wavesForRemove.push(waveInfo);
            }
        }

        //remove waves which done
        for each(var waveInfoRemove:SoldierWaveInfo in wavesForRemove)
        {
            UtilsArray.removeValue(_soldierWaves, waveInfoRemove);
            waveInfoRemove.cleanup();
        }
    }

    //Returns true if wave need remove
    private function processWave(wave:SoldierWaveInfo):Boolean
    {
        var result:Boolean = false;

        wave.timeGenerated = getTimer();

        var paths:Array = _managerGame.managerPath.getPaths(wave.houseOwner, wave.houseTarget);

        for (var i:int = 0; i < wave.generatedSoldierCount; i++)
        {
            if (wave.generatedSoldierRest == 0 || wave.houseOwner.soldierCount == 0)
            {
                result = true;
                break;
            }

            generateWaveSoldiers(wave, paths[i]);
        }

        return result;
    }

    private function generateWaveSoldiers(waveInfo:SoldierWaveInfo, path:Array):void
    {
        var newSoldier:SoldierInfo = new SoldierInfo(waveInfo.houseOwnerType, waveInfo.houseOwnerLevel, waveInfo.houseOwnerLevelMax, waveInfo.houseOwnerPlayer, waveInfo.houseTarget, path);

        _soldiers.push(newSoldier);

        GameInfo.instance.managerStates.currentState.update(EControllerUpdate.ECU_SOLDIER_STATE);

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

        newWave.generatedSoldierRest = Math.min(newWave.generatedSoldierRest, newWave.houseOwner.soldierCount);
        newWave.houseOwner.soldierCount -= newWave.generatedSoldierRest;

        processWave(newWave);

        trace("generate soldiers " + soldierCount.toString());

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
        _timerSoldierGenerator.removeEventListener(TimerEvent.TIMER, processWaves);
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
