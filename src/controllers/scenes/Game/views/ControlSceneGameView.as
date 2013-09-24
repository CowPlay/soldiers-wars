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
import controllers.scenes.game.views.Houses.ControlHouseView;
import controllers.scenes.game.views.Houses.ControlHouseViewBarracks;

import controls.IControl;

import controls.IControlScene;

import controls.implementations.ControlBase;

import flash.display.Sprite;

import models.GameInfo;
import models.data.houses.base.EHouseType;
import models.data.houses.base.HouseInfo;
import models.game.managerPath.GridCell;
import models.game.managerPath.ManagerPath;

public class ControlSceneGameView extends ControlBase
{
    /*
     * Fields
     */

    private var _controlGrid:ControlGrid;

    private var _houses:Array;

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

        _houses = [];

        init();
    }

    private function init():void
    {
        setSourceView(new Sprite());

        _controlGrid = new ControlGrid(sceneOwner);
        sourceView.addChild(_controlGrid.sourceView);

        initHouses();
    }

    private function initHouses():void
    {
        var housesEntries:Array = GameInfo.Instance.managerGameSoldiers.currentLevel.houses;

        for each(var entry:HouseInfo in housesEntries)
        {
            var view:IControl;

            switch (entry.type)
            {
                case EHouseType.EHT_BARRACKS:
                {
                    view = new ControlHouseViewBarracks(sceneOwner, entry);
                    break;
                }
                default :
                {
                    Debug.assert(false);
                    break;
                }
            }

            sourceView.addChild(view.sourceView);

            entry.view = view;
            _houses.push(view);
        }
    }

    public override function placeViews():void
    {
        super.placeViews();

        _controlGrid.placeViews();
        _controlGrid.sourceView.x = 100;
        _controlGrid.sourceView.y = 350;

        var managerPath:ManagerPath = GameInfo.Instance.managerGameSoldiers.managerPath;

        for each(var houseView:ControlHouseView in _houses)
        {
            var cellEntry:GridCell = managerPath.getCell(houseView.entry.positionCurrent);

            houseView.placeViews();
            houseView.sourceView.x = _controlGrid.sourceView.x + cellEntry.view.sourceView.x;
            houseView.sourceView.y = _controlGrid.sourceView.y + cellEntry.view.sourceView.y;
        }
    }
}
}
