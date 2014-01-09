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

import models.interfaces.levels.ILevelContainer;
import models.interfaces.levels.ILevelInfo;

import soldiers.GameInfo;
import soldiers.models.levels.LevelInfo;
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

        var containers:Array = GameInfo.instance.managerLevels.items;

        for each(var levelContainer:ILevelContainer in containers)
        {
            var currentLevel:ILevelInfo = levelContainer.firstIncompleteLevel;

            var itemEnabled:Boolean = true;

            for each(var level:LevelInfo in levelContainer.items)
            {
                var isCurrent:Boolean = currentLevel == level;

                var controllerMapItem:ControllerFlag = new ControllerFlag(level, isCurrent);
                controllerMapItem.isEnabled = itemEnabled;

                _view.addSubView(controllerMapItem.view);
                _items.push(controllerMapItem);

                if (isCurrent)
                {
                    itemEnabled = false;
                }
            }
        }
    }


    public override function cleanup():void
    {
        for each(var item:ControllerFlag in _items)
        {
            item.cleanup();
            item = null;
        }

        super.cleanup();
    }
}
}
