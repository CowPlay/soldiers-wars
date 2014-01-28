/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/15/14
 * Time: 3:16 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.map
{
import soldiers.controllers.base.ControllerUIBase;
import soldiers.views.map.ViewMapUI;

public class ControllerMapUI extends ControllerUIBase
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
    public function ControllerMapUI()
    {
        super(new ViewMapUI(this));
        init();
    }

    private function init():void
    {
    }
}
}
