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
import controllers.IController;

import controls.IView;
import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import soldiers.models.GameInfo;
import soldiers.views.game.arrows.ControlArrowContainer;
import soldiers.views.game.housesG.base.ControlGHouseViewContainer;
import soldiers.views.game.soldiers.base.ControlSoldierViewContainer;

public class ViewSceneGame extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceView:DisplayObjectContainer;

    private var _viewGrid:IView;
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
    public function ViewSceneGame(controller:IController)
    {
        _sourceView = new Sprite();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
        _viewGrid = new ViewGrid(controller);
        _viewGrid.handleEvents(false);

        _sourceView.addChild(_viewGrid.sourceView);

//        _controlArrowContainer = new ControlArrowContainer(this);
//        _sourceView.addChild(_controlArrowContainer.sourceView);

//        _controlHousesContainer = new ControlGHouseViewContainer(this);
//        _sourceView.addChild(_controlHousesContainer.sourceView);

//        _controlSoldiersContainer = new ControlSoldierViewContainer(this);
//        _sourceView.addChild(_controlSoldiersContainer.sourceView);

        GameInfo.instance.managerApp.applicationStage.addEventListener(Event.MOUSE_LEAVE, clearHousesSelection);
        GameInfo.instance.managerApp.applicationStage.addEventListener(MouseEvent.MOUSE_UP, clearHousesSelection);
    }

    private static function clearHousesSelection(e:Event = null):void
    {
        GameInfo.instance.managerGameSoldiers.clearHousesSelection(GameInfo.instance.managerGameSoldiers.gameOwner);
    }

    public override function addSubView(view:IView):void
    {
        _sourceView.addChild(view.sourceView);
    }

    //TODO: implement when fullscreen
//    public override function onDisplayStateChanged(isFullScreenNow:Boolean):void
//    {
//        _viewGrid.sourceView.x = (GameInfo.instance.managerApp.applicationSize.x / 2) - (_viewGrid.sourceView.width / 2);
//        _viewGrid.sourceView.y = (GameInfo.instance.managerApp.applicationSize.y / 2);
//
//        _controlHousesContainer.sourceView.x = _viewGrid.sourceView.x;
//        _controlHousesContainer.sourceView.y = _viewGrid.sourceView.y;
//
//        _controlArrowContainer.sourceView.x = _viewGrid.sourceView.x;
//        _controlArrowContainer.sourceView.y = _viewGrid.sourceView.y;
//
//        _controlSoldiersContainer.sourceView.x = _viewGrid.sourceView.x;
//        _controlSoldiersContainer.sourceView.y = _viewGrid.sourceView.y;
//
//        super.onDisplayStateChanged(isFullScreenNow);
//    }

    public override function placeViews(fullscreen:Boolean):void
    {
        super.placeViews(fullscreen);

        _viewGrid.placeViews(fullscreen);
//        _controlHousesContainer.placeViews(fullscreen);
//        _controlArrowContainer.placeViews(fullscreen);
    }
}
}
