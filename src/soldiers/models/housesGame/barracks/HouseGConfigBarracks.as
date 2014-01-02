/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/20/13
 * Time: 7:10 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesGame.barracks
{
import soldiers.models.housesGame.base.HouseGConfig;

public class HouseGConfigBarracks extends HouseGConfig
{
    /*
     * Fields
     */

    private var _soldiersGenerationSpeed:Number;

    /*
     * Properties
     */


    public function get soldiersGenerationSpeed():Number
    {
        return _soldiersGenerationSpeed;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function HouseGConfigBarracks(levelInfoClass:Class)
    {
        super(levelInfoClass);
    }

    private function init():void
    {

    }


    override public function deserialize(data:Object):void
    {
        super.deserialize(data);

        Debug.assert(data.hasOwnProperty("soldiers_generation_speed"));

        _soldiersGenerationSpeed = data["soldiers_generation_speed"];

    }
}
}
