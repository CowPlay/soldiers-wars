/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 11.11.13
 * Time: 16:29
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.map
{
import controllers.implementations.Controller;

import models.interfaces.levels.ILevelInfo;

import soldiers.controllers.village.ui.ControllerAddFriend;

import soldiers.models.GameInfo;

import soldiers.views.map.ViewMapScene;

public class ControllerMapScene extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewMapScene;

    //flags array
    private var _items:Array;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerMapScene()
    {
        _view = new ViewMapScene(this);
        super(_view);


        init();
    }

    private function init():void
    {
        _items = [];

        var levelInfo:ILevelInfo = GameInfo.instance.managerLevels.getLevel("0");

        var controllerFlagLevel0:ControllerFlagItem = new ControllerFlagItem(levelInfo);

        this.view.addSubView(controllerFlagLevel0.view);

        _items.push(controllerFlagLevel0)
    }



    public override function cleanup():void
    {
        _view.cleanup();
        _view = null;

        super.cleanup();
    }
}
}
