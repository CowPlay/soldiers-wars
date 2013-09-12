/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 6/19/13
 * Time: 1:48 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.game
{
import controllers.ESceneType;
import controllers.scenes.base.ControlSceneGameBase;

import flash.display.Sprite;

public class ControlSceneGame extends ControlSceneGameBase
{
    /*
     * Fields
     */
//    private var _resourceLoaderGame:ResourceLoader;

    private var _arrowContainer:Sprite;

//    private var _gameGrid:GameGrid;

    /*
     * Properties
     */
    public override function get type():String
    {
        return ESceneType.EST_GAME;
    }

    /*
     * Events
     */

//    public function didArrowCreate(houseView:HouseBaseView):void
//    {
//        Debug.assert(houseView != null);
//
//        _arrowContainer.addChild(houseView.arrow.rootView);
//
//        houseView.arrow.rootView.x = houseView.x;
//        houseView.arrow.rootView.y = houseView.y;
//    }
//
//    public function didArrowRemove(houseView:HouseBaseView):void
//    {
//        Debug.assert(houseView != null);
//
//        _arrowContainer.removeChild(houseView.arrow.rootView);
//    }
//
//    public function didSoldierGenerate(soldier:Soldier):void
//    {
//        Debug.assert(soldier != null);
//
//        _gameGrid.rootView.addChild(soldier.view);
//
//        soldier.view.x = soldier.currentPosition.view.x;
//        soldier.view.y = soldier.currentPosition.view.y;
//    }
//
//    /*
//     * Methods
//     */
//
//    //! Default constructor
//    public function SceneGame()
//    {
////        mouseChildren = true;
//        _arrowContainer = new Sprite();
//        addChild(_arrowContainer);
//    }
//
//
//    public override function cleanup():void
//    {
//        _resourceLoaderGame.cleanup();
//        _resourceLoaderGame = null;
//
//        super.cleanup();
//    }
//
//    //! Load resources here
//    protected override function loadResources():void
//    {
//        _resourceLoaderGame = new ResourceLoader(ResourceManagerSceneGame.librarySceneGame);
//        _resourceLoaderGame.load(didResourceGameLoaded);
//    }
//
//    private function didResourceGameLoaded():void
//    {
//        super.loadResources();
//    }
//
//    protected override function prepareViews():void
//    {
//        super.prepareViews();
//
//        _gameGrid = new GameGrid(this);
//        addChild(_gameGrid.rootView);
//    }
//
//
//    //! Place all views here
//    protected override function placeViews():void
//    {
//        _gameGrid.placeViews();
//
//        _arrowContainer.x = _gameGrid.rootView.x = 0;//SoldierWars.rootView.stage.stageWidth / 2;
//        _arrowContainer.y = _gameGrid.rootView.y = SoldierWars.rootView.stage.stageHeight / 2;
//
//        super.placeViews();
//    }


}
}
