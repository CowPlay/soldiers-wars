/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/25/13
 * Time: 3:03 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerAi.aiActions.base
{
import core.DisposableObject;

import soldiers.models.game.ManagerGame;
import soldiers.models.game.managerAi.aiActions.IAiAction;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;

public class AiActionBase extends DisposableObject implements IAiAction
{
    /*
     * Fields
     */
    private var _owner:HouseG;
    private var _timeReaction:uint;

    protected var _managerGame:ManagerGame;
    protected var _target:HouseG;

    /*
     * Properties
     */


    public function get owner():HouseG
    {
        return _owner;
    }

    public function get canApply():Boolean
    {
        return _owner.ownerType == EHouseOwner.EHO_ENEMY;
    }

    public function get timeReaction():uint
    {
        return _timeReaction;
    }


    /*
     * Methods
     */

    //! Default constructor
    public function AiActionBase(owner:HouseG, managerGame:ManagerGame)
    {
        Debug.assert(owner != null);
        _owner = owner;

        _managerGame = managerGame;
    }

    /*
     * IAiAction
     */

    public function apply():void
    {
        Debug.assert(_target != null);

        _managerGame.onPlayerSelectHouse(owner.owner, owner);
        _managerGame.onPlayerGenerateSoldiers(owner.owner, _target);

        _target = null;
    }

    /*
     * ISerializable
     */


    public function serialize():Object
    {
        return null;
    }

    public function deserialize(data:Object):void
    {
        Debug.assert(data.hasOwnProperty("time_reaction"));
        _timeReaction = data["time_reaction"];
    }
}
}
