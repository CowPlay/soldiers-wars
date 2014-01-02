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

import soldiers.controllers.EControllerUpdate;

import soldiers.models.game.ManagerGame;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;

public class ManagerProgress extends DisposableObject
{
    /*
     * Fields
     */
    private var _managerGame:ManagerGame;

    private var _housesNeutralCount:uint;
    private var _housesEnemyCount:uint;
    private var _housesPlayerCount:uint;

    /*
     * Properties
     */

    /*
     * Events
     */
    public function onHouseOwnerChanged():void
    {
        if(_managerGame.currentLevel.target1Complete)
        {
            _managerGame.onTarget1Complete();
        }

        //TODO: implement
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
        for each(var house:HouseG in _managerGame.houses)
        {
            switch (house.ownerType)
            {
                case EHouseOwner.EHO_NEUTRAL:
                {
                    _housesNeutralCount++;
                    break;
                }
                case EHouseOwner.EHO_PLAYER:
                {
                    _housesPlayerCount++;
                    break;
                }
                case EHouseOwner.EHO_ENEMY:
                {
                    _housesEnemyCount++;
                    break;
                }
                default:
                {
                    Debug.assert(false);
                    break;
                }
            }

        }

    }
}
}
