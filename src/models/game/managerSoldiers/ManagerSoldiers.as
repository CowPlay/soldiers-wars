/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 5/31/13
 * Time: 11:39 AM
 * To change this template use File | Settings | File Templates.
 */

package models.game.managerSoldiers
{

import com.greensock.TweenLite;

import controllers.EControlUpdateType;

import flash.events.Event;
import flash.events.TimerEvent;
import flash.utils.Timer;
import flash.utils.getTimer;

import models.GameInfo;
import models.data.houses.base.HouseInfo;
import models.data.soldiers.SoldierInfo;

import utils.UtilsArray;

public class ManagerSoldiers implements IDisposable
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

    public function generateSoldiers(owner:HouseInfo, target:HouseInfo):void
    {
        Debug.assert(owner != null);
        Debug.assert(target != null);

        var newWave:SoldierWaveInfo = new SoldierWaveInfo();

        newWave.generatedSoldierRest = 1; //TODO: make configurable
        newWave.owner = owner;
        newWave.target = target;
        newWave.timeGeneratedFrequency = 300;
        newWave.generatedSoldierCount = 1;

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

            if(!isTimeForGenerate)
            {
                continue;
            }

            if (isFirstProcess)
            {
                Debug.assert(waveInfo.owner.soldierCount >= waveInfo.generatedSoldierRest);
                waveInfo.owner.soldierCount -= waveInfo.generatedSoldierRest;
            }

            waveInfo.timeGeneratedLast = currentTime;

            for (var i:int = 0; i < waveInfo.generatedSoldierCount; i++)
            {
                if (waveInfo.owner.soldierCount == 0)
                {
                    wavesForRemove.push(waveInfo);
                    break;
                }

                generateSoldier(waveInfo);
                waveInfo.generatedSoldierRest--;
            }
        }

        //remove waves which done
        for each(var waveInfoRemove:SoldierWaveInfo in wavesForRemove)
        {
            UtilsArray.removeValue(_soldierWaves, waveInfoRemove);
        }
    }

    private function generateSoldier(waveInfo:SoldierWaveInfo):void
    {
        var newSoldier:SoldierInfo = new SoldierInfo(waveInfo.owner, waveInfo.target);

        _soldiers.push(newSoldier);

        GameInfo.instance.managerViewController.currentScene.update(EControlUpdateType.ECUT_SOLDIER_GENERATE);

        newSoldier.moveToTarget(onSoldierMoveComplete);
    }

    private function onSoldierMoveComplete(soldier:SoldierInfo):void
    {
        Debug.assert(soldier != null);

        UtilsArray.removeValue(_soldiers, soldier);
    }





    /*
     * IDisposable
     */

    public function cleanup():void
    {
        _timerSoldierGenerator.stop();
        _timerSoldierGenerator = null;
    }
}
}
