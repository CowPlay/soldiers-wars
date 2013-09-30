/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/19/13
 * Time: 9:57 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.game.views
{
import controllers.EControlUpdateType;
import controllers.scenes.game.views.arrows.ControlArrowContainer;
import controllers.scenes.game.views.houses.base.ControlHouseViewContainer;
import controllers.scenes.game.views.soldiers.base.ControlSoldierViewContainer;

import controls.IControl;
import controls.IControlScene;
import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import models.GameInfo;
import models.game.ManagerGameSoldiers;

public class ControlSceneGameView extends ControlBase
{
    /*
     * Fields
     */
    private var _managerGame:ManagerGameSoldiers;

    private var _sourceViewTyped:DisplayObjectContainer;

    private var _controlGrid:ControlGrid;
    private var _controlArrowContainer:IControl;
    private var _controlHousesContainer:IControl;
    private var _controlSoldiersContainer:IControl;


    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlSceneGameView(sceneOwner:IControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _managerGame = GameInfo.instance.managerGameSoldiers;

        _sourceViewTyped = new Sprite();
        setSourceView(_sourceViewTyped);

        _controlGrid = new ControlGrid(sceneOwner);
        _sourceViewTyped.addChild(_controlGrid.sourceView);

        _controlArrowContainer = new ControlArrowContainer(sceneOwner);
        _sourceViewTyped.addChild(_controlArrowContainer.sourceView);

        _controlHousesContainer = new ControlHouseViewContainer(sceneOwner);
        _sourceViewTyped.addChild(_controlHousesContainer.sourceView);

        _controlSoldiersContainer = new ControlSoldierViewContainer(sceneOwner);
        _sourceViewTyped.addChild(_controlSoldiersContainer.sourceView);

//        actionDelegate = this;
        //TODO: review this hack
        GameInfo.instance.managerApp.applicationStage.addEventListener(Event.MOUSE_LEAVE, clearHousesSelection);
        GameInfo.instance.managerApp.applicationStage.addEventListener(MouseEvent.MOUSE_UP, clearHousesSelection);
    }

    private function clearHousesSelection(e:Event = null):void
    {
        _managerGame.clearHousesSelection(_managerGame.gameOwner);
    }

    public override function placeViews():void
    {
        super.placeViews();

        _controlGrid.placeViews();
        _controlGrid.sourceView.x = 100;
        _controlGrid.sourceView.y = 350;

        _controlHousesContainer.placeViews();
        _controlHousesContainer.sourceView.x = _controlGrid.sourceView.x;
        _controlHousesContainer.sourceView.y = _controlGrid.sourceView.y;

        _controlArrowContainer.placeViews();
        _controlArrowContainer.sourceView.x = _controlGrid.sourceView.x;
        _controlArrowContainer.sourceView.y = _controlGrid.sourceView.y;

        _controlSoldiersContainer.sourceView.x = _controlGrid.sourceView.x;
        _controlSoldiersContainer.sourceView.y = _controlGrid.sourceView.y;

    }

    /*
     * IActionDelegate
     */

//    public override function onControlMouseUp(target:IControl, e:MouseEvent):Boolean
//    {
//        var result:Boolean = super.onControlMouseUp(target, e);
//
//        //clear selection
//        clearHousesSelection();
//        _managerGame.clearHousesSelection(_managerGame.gameOwner);
//
//        if (!result)
//        {
//
//        }
//
//        return result;
//    }
//
//    public override function onControlMouseDown(target:IControl, e:MouseEvent):Boolean
//    {
//        var result:Boolean = super.onControlMouseDown(target, e);
//
//        if (!result)
//        {
//            switch (target)
//            {
//                case this:
//                {
//                    //do nothing
//                    result = true;
//                    break;
//                }
//                default :
//                {
//                    Debug.assert(false);
//                    break;
//                }
//            }
//        }
//        Debug.assert(result);
//
//        return result;
//    }

    public override function update(type:String = ""):void
    {
        switch (type)
        {
            case EControlUpdateType.ECUT_HOUSE_SELECTION_CHANGED:
            {
                _controlArrowContainer.update(type);

                break;
            }
            case EControlUpdateType.ECUT_SOLDIER_GENERATE:
            {
                _controlSoldiersContainer.update(type);
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
