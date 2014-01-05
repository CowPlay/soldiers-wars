/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/5/14
 * Time: 11:43 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game.decor
{
import controllers.IController;
import controllers.implementations.Controller;

import soldiers.GameInfo;
import soldiers.models.game.decor.Decor;
import soldiers.views.game.decor.ViewDecorContainer;

public class ControllerDecorContainer extends Controller
{
    /*
     * Fields
     */
    private var _items:Array;
    /*
     * Properties
     */

    /*
     * Methods
     */


    //! Default constructor
    public function ControllerDecorContainer(view:ViewDecorContainer)
    {
        super(view);
        init();
    }

    private function init():void
    {
        _items = [];

        var decorItems:Array = GameInfo.instance.managerGame.decor;
        for   each(var decor:Decor in decorItems)
        {
            var controllerDecor:IController = new ControllerDecor(decor);
            view.addSubView(controllerDecor.view);
            _items.push(controllerDecor);
        }
    }

    public override function cleanup():void
    {
        for each(var item:IDisposable in _items)
        {
            item.cleanup();
        }

        _items = null;
    }
}
}
