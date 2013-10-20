/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/19/13
 * Time: 8:54 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesGame.barracks
{
import soldiers.models.housesGame.base.HouseConfigG;

public class HouseConfigGBarracks extends HouseConfigG
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function HouseConfigGBarracks()
    {
        init();
    }

    private function init():void
    {

    }

    /*
     * ISerializable
     */

    public override function deserialize(data:Object):void
    {
        super.deserialize(data);

        Debug.assert(data.hasOwnProperty("soldiers_generation"));


    }
}
}
