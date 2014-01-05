/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/30/13
 * Time: 5:03 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game.grid
{
import controllers.implementations.Controller;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.events.Event;

import soldiers.GameInfo;
import soldiers.views.game.grid.ViewGrid;

public class ControllerGrid extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewGrid;

//    private var _gridObjects:Array;

    private var _sourceObjects:DisplayObjectContainer;

    /*
     * Properties
     */

    /*
     * Events
     */

    public function onEnterFrame(e:Event):void
    {
        for (var i:int = 1; i < _sourceObjects.numChildren; i++)
        {
            var target:DisplayObject = _sourceObjects.getChildAt(i);

            var key:Number = target.y;

            var j:int = i - 1;

            var currentChild:DisplayObject = _sourceObjects.getChildAt(j);

            var childKey:Number = currentChild.y;

            while (j >= 0 && childKey > key)
            {
                _sourceObjects.setChildIndex(currentChild, j + 1);
                j--;

                //update currentChild and childKey
                if (j >= 0)
                {
                    currentChild = _sourceObjects.getChildAt(j);
                    childKey = currentChild.y;
                }
            }

            _sourceObjects.setChildIndex(target, j + 1);
        }
    }


    /*
     * Methods
     */

    //! Default constructor
    public function ControllerGrid(view:ViewGrid)
    {
        Debug.assert(view != null);

        _view = view;
        super(_view);

        init();
    }

    private function init():void
    {
        _sourceObjects = _view.sourceObjects;

        _view.showFoundation();
        _view.showPaths();
        _view.showHouseExits();
        _view.showHousePositions();
        _view.showDecor();

        GameInfo.instance.managerApp.applicationStage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }
}
}
