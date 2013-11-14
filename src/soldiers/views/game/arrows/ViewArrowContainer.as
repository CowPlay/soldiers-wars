/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/25/13
 * Time: 10:15 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.arrows
{
import controllers.IController;

import controls.IView;
import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.MouseEvent;

import soldiers.controllers.EControllerUpdate;
import soldiers.models.GameInfo;
import soldiers.models.housesGame.base.HouseG;

import utils.memory.UtilsMemory;

public class ViewArrowContainer extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceView:DisplayObjectContainer;

    private var _houses:Array;
    private var _controlsArrows:Array;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ViewArrowContainer(controller:IController)
    {
        _sourceView = new Sprite();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
        handleEvents(false);

        _sourceView.mouseEnabled = false;
        _sourceView.mouseChildren = false;

        _controlsArrows = [];

        _houses = GameInfo.instance.managerGameSoldiers.currentLevel.houses;

        for each(var house:HouseG in _houses)
        {
            var controlArrow:ViewArrow = new ViewArrow(controller);
            controlArrow.hide();

            _sourceView.addChild(controlArrow.sourceView);

            _controlsArrows.push(controlArrow);
        }

        UtilsMemory.registerEventListener(GameInfo.instance.managerApp.applicationStage, MouseEvent.MOUSE_MOVE, this, updateArrowSize);
    }

    public function updateArrowSize(e:MouseEvent):void
    {
        for each(var arrowView:ViewArrow in _controlsArrows)
        {
            arrowView.updateArrowSize(e);
        }
    }

    public override function update(type:String = ""):void
    {
        switch (type)
        {
            case EControllerUpdate.ECU_HOUSE_SELECTION_CHANGED:
            {
                for (var i:int = 0; i < _houses.length; i++)
                {
                    var house:HouseG = _houses[i];
                    var controlArrow:IView = _controlsArrows[i];

                    house.isSelect ? controlArrow.show() : controlArrow.hide();
                }

                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }
    }

    public override function placeViews(isFullscreen:Boolean):void
    {
        super.placeViews(isFullscreen);

        for (var i:int = 0; i < _houses.length; i++)
        {
            var house:HouseG = _houses[i];
            var controlArrow:IView = _controlsArrows[i];

            controlArrow.sourceView.x = house.controller.sourceView.x + house.controller.auraPosition.x;
            controlArrow.sourceView.y = house.controller.sourceView.y + house.controller.auraPosition.y;
        }
    }
}

}
