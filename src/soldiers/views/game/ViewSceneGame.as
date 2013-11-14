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

import controls.EViewAlignment;

import controls.IView;
import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Point;

import soldiers.models.GameInfo;
import soldiers.views.game.arrows.ViewArrowContainer;
import soldiers.views.game.houses.ViewHousesGContainer;
import soldiers.views.game.soldiers.ViewSoldiersContainer;

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

    private var _subViews:Array;


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
        _subViews = [];

        _viewGrid = new ViewGrid(controller);
        _viewGrid.alignment = EViewAlignment.EVA_ABSOLUTE;
        _viewGrid.handleEvents(false);

        //TODO: review this hack
        _viewGrid.anchorPoint = new Point(0.5, 0);

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
        _subViews.push(view);
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
        _viewGrid.translate(0.5, 0.5);

        for each(var subView:IView in _subViews)
        {
            subView.placeViews(fullscreen);
        }

//        _controlHousesContainer.placeViews(fullscreen);
//        _controlArrowContainer.placeViews(fullscreen);
    }
}
}
