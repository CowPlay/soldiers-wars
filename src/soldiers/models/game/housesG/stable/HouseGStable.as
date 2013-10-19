/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 6/14/13
 * Time: 5:42 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.housesG.stable
{
public class HouseGStable extends HouseInfoG
{
    /*
     * Properties
     */

    public override function get type():String
    {
        return EHouseGType.EHGT_STABLE;
    }

    /*
     * Methods
     */

    public function HouseGStable()
    {
    }
}
}

