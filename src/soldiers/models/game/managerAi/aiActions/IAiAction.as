/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/25/13
 * Time: 3:02 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerAi.aiActions
{
import serialization.ISerializable;

import soldiers.models.housesGame.base.HouseG;

public interface IAiAction extends ISerializable
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    function get owner():HouseG;

    function get canApply():Boolean;

    function get timeReaction():uint;

    /*
     * Events
     */

    function apply():void;

}
}
