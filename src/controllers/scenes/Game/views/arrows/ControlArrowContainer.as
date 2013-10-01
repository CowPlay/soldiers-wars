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
package controllers.scenes.game.views.arrows
{
import controllers.EControlUpdateType;

import controls.IControl;
import controls.IControlScene;
import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.MouseEvent;

import models.GameInfo;
import models.data.housesG.base.HouseInfoG;

import utils.memory.UtilsMemory;

public class ControlArrowContainer extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceViewTyped:DisplayObjectContainer;

    private var _houses:Array;
    private var _controlsArrows:Array;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlArrowContainer(sceneOwner:IControlScene)
    {
        super(sceneOwner);


        init();
    }

    private function init():void
    {
        _sourceViewTyped = new Sprite();
        _sourceViewTyped.mouseEnabled = false;
        _sourceViewTyped.mouseChildren = false;

        setSourceView(_sourceViewTyped);

        _controlsArrows = [];

        _houses = GameInfo.instance.managerGameSoldiers.currentLevel.houses;

        for each(var house:HouseInfoG in _houses)
        {
            var controlArrow:ControlArrow = new ControlArrow(sceneOwner);
            controlArrow.hide();

            _sourceViewTyped.addChild(controlArrow.sourceView);

            _controlsArrows.push(controlArrow);
        }

        UtilsMemory.registerEventListener(GameInfo.instance.managerApp.applicationStage, MouseEvent.MOUSE_MOVE, this, updateArrowSize);
    }

    public function updateArrowSize(e:MouseEvent):void
    {
        for each(var arrowView:ControlArrow in _controlsArrows)
        {
            arrowView.updateArrowSize(e);
        }
    }

    public override function placeViews():void
    {
        super.placeViews();

        for (var i:int = 0; i < _houses.length; i++)
        {
            var house:HouseInfoG = _houses[i];
            var controlArrow:IControl = _controlsArrows[i];

            controlArrow.sourceView.x = house.view.sourceView.x + house.view.auraPosition.x;
            controlArrow.sourceView.y = house.view.sourceView.y + house.view.auraPosition.y;
        }
    }

    public override function update(type:String = ""):void
    {
        switch (type)
        {
            case EControlUpdateType.ECUT_HOUSE_SELECTION_CHANGED:
            {
                for (var i:int = 0; i < _houses.length; i++)
                {
                    var house:HouseInfoG = _houses[i];
                    var controlArrow:IControl = _controlsArrows[i];

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

}

}
