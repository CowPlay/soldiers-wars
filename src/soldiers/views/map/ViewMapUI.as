/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/15/14
 * Time: 3:15 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.map
{
import controllers.IController;

import flash.display.Sprite;

import soldiers.views.base.ViewUIBase;

public class ViewMapUI extends ViewUIBase
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
    public function ViewMapUI(controller:IController)
    {
        super(controller, new Sprite());
        init();
    }

    private function init():void
    {
    }
}
}
