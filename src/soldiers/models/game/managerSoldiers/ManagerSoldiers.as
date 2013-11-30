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

import flash.events.Event;
import flash.events.TimerEvent;
import flash.utils.Timer;
import flash.utils.getTimer;

import soldiers.controllers.EControllerUpdate;
import soldiers.models.GameInfo;
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
     * Methods
     */


    //! Default constructor
    public function ManagerSoldiers()
    {
        init();
    }

    private function init():void
    {
        _soldierWaves = [];

        _soldiers = [];

        _timerSoldierGenerator = new Timer(250);
        _timerSoldierGenerator.addEventListener(TimerEvent.TIMER, processWave);
        _timerSoldierGenerator.start();
    }

    public function generateSoldiers(owner:HouseG, target:HouseG, soldierCount:int):void
    {
        Debug.assert(owner != null);
        Debug.assert(target != null);

        var newWave:SoldierWaveInfo = new SoldierWaveInfo();

        newWave.generatedSoldierRest = soldierCount;
        newWave.owner = owner;
        newWave.target = target;
        newWave.timeGeneratedFrequency = 300;
        newWave.generatedSoldierCount = 3;

        _soldierWaves.push(newWave);
    }

    private function processWave(e:Event):void
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

            var isFirstProcess:Boolean = waveInfo.timeGeneratedLast == 0;
            var isTimeForGenerate:Boolean = currentTime - waveInfo.timeGeneratedLast > waveInfo.timeGeneratedFrequency;

            if (!isTimeForGenerate)
            {
                continue;
            }

            if (isFirstProcess)
            {
                Debug.assert(waveInfo.owner.soldierCount >= waveInfo.generatedSoldierRest);
                waveInfo.owner.soldierCount -= waveInfo.generatedSoldierRest;
            }

            waveInfo.timeGeneratedLast = currentTime;


            var managerPath:ManagerPath = GameInfo.instance.managerGame.managerPath;

            var paths:Array = managerPath.getPaths(managerPath.getCell(waveInfo.owner.positionsExits[0]), managerPath.getCell(waveInfo.target.positionsExits[0]));

            for (var i:int = 0; i < waveInfo.generatedSoldierCount; i++)
            {
                if (waveInfo.generatedSoldierRest == 0 || waveInfo.owner.soldierCount == 0)
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
        }
    }

    private function generateWaveSoldiers(waveInfo:SoldierWaveInfo, path:Array):void
    {
        var newSoldier:SoldierInfo = new SoldierInfo(waveInfo.owner, waveInfo.target, path);

        _soldiers.push(newSoldier);

        GameInfo.instance.managerStates.currentState.update(EControllerUpdate.ECU_SOLDIER_STATE_CHANGED);

        waveInfo.generatedSoldierRest--;
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
