/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/23/13
 * Time: 11:29 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerProgress.targets.grab
{
import soldiers.models.game.managerProgress.targets.base.LTBase;

public class LTGrabBase extends LTBase
{
    /*
     * Fields
     */

    protected var _targetHouseId:String;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function LTGrabBase()
    {
        init();
    }

    private function init():void
    {
    }

    /*
     *  ISerializable
     */


    override public function deserialize(data:Object):void
    {
        super.deserialize(data);

        Debug.assert(data.hasOwnProperty("target_id"));

        _targetHouseId = data["target_id"];
    }

}
}
