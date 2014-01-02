/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 23.10.13
 * Time: 13:13
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.village.housesV
{
import views.IView;

import flash.display.DisplayObjectContainer;

import soldiers.models.housesVillage.base.HouseV;
import soldiers.models.housesVillage.mineGold.HouseVMineGold;

public class ControlHouseViewMineGold extends ControlHouseViewV
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
    public function ControlHouseViewMineGold(parent:IView, entry:HouseV, sourceViewValue:DisplayObjectContainer)
    {
        super(parent, entry, sourceViewValue);

        Debug.assert(entry is HouseVMineGold);

        init();
    }

    private function init():void
    {

    }
}
}
