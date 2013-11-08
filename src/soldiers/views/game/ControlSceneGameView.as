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
package soldiers.views.game
{
import controls.IView;
import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import soldiers.controllers.EControllerUpdate;
import soldiers.models.GameInfo;
import soldiers.models.game.ManagerGame;
import soldiers.views.game.arrows.ControlArrowContainer;
import soldiers.views.game.housesG.base.ControlGHouseViewContainer;
import soldiers.views.game.soldiers.base.ControlSoldierViewContainer;

public class ControlSceneGameView extends ControlBase
{
    /*
     * Fields
     */
    private var _managerGame:ManagerGame;

    private var _sourceViewTyped:DisplayObjectContainer;

    private var _controlGrid:ControlGrid;
    private var _controlArrowContainer:IView;
    private var _controlHousesContainer:IView;
    private var _controlSoldiersContainer:IView;


    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlSceneGameView()
    {
        super(this);

        init();
    }

    private function init():void
    {
        _managerGame = GameInfo.instance.managerGameSoldiers;

        _sourceViewTyped = new Sprite();
        setSourceView(_sourceViewTyped);

        _controlGrid = new ControlGrid(this);
        _sourceViewTyped.addChild(_controlGrid.sourceView);

        _controlArrowContainer = new ControlArrowContainer(this);
        _sourceViewTyped.addChild(_controlArrowContainer.sourceView);

        _controlHousesContainer = new ControlGHouseViewContainer(this);
        _sourceViewTyped.addChild(_controlHousesContainer.sourceView);

        _controlSoldiersContainer = new ControlSoldierViewContainer(this);
        _sourceViewTyped.addChild(_controlSoldiersContainer.sourceView);

        //TODO: review this hack
        GameInfo.instance.managerApp.applicationStage.addEventListener(Event.MOUSE_LEAVE, clearHousesSelection);
        GameInfo.instance.managerApp.applicationStage.addEventListener(MouseEvent.MOUSE_UP, clearHousesSelection);
    }

    private function clearHousesSelection(e:Event = null):void
    {
        _managerGame.clearHousesSelection(_managerGame.gameOwner);
    }

    //TODO: implement when fullscreen
//    public override function onDisplayStateChanged(isFullScreenNow:Boolean):void
//    {
//        _controlGrid.sourceView.x = (GameInfo.instance.managerApp.applicationSize.x / 2) - (_controlGrid.sourceView.width / 2);
//        _controlGrid.sourceView.y = (GameInfo.instance.managerApp.applicationSize.y / 2);
//
//        _controlHousesContainer.sourceView.x = _controlGrid.sourceView.x;
//        _controlHousesContainer.sourceView.y = _controlGrid.sourceView.y;
//
//        _controlArrowContainer.sourceView.x = _controlGrid.sourceView.x;
//        _controlArrowContainer.sourceView.y = _controlGrid.sourceView.y;
//
//        _controlSoldiersContainer.sourceView.x = _controlGrid.sourceView.x;
//        _controlSoldiersContainer.sourceView.y = _controlGrid.sourceView.y;
//
//        super.onDisplayStateChanged(isFullScreenNow);
//    }

    public override function placeViews():void
    {
        super.placeViews();

        _controlGrid.placeViews();
        _controlHousesContainer.placeViews();
        _controlArrowContainer.placeViews();
    }

    /*
     * IActionDelegate
     */


    public override function update(type:String = ""):void
    {
        switch (type)
        {
            case EControllerUpdate.ECU_HOUSE_SELECTION_CHANGED:
            {
                _controlArrowContainer.update(type);

                break;
            }
            case EControllerUpdate.ECU_SOLDIER_GENERATE:
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
