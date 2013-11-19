/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 6/19/13
 * Time: 1:48 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.states.game
{
import controllers.IControllerPopup;

import controls.EViewAlignment;

import soldiers.controllers.game.ControllerSceneGame;
import soldiers.controllers.popups.levels.ControllerPopupLevelEnd;
import soldiers.models.GameInfo;
import soldiers.states.EStateType;
import soldiers.states.base.StateGameBase;

public class StateGame extends StateGameBase
{
    /*
     * Fields
     */

    /*
     * Properties
     */
    public override function get type():String
    {
        return EStateType.EST_GAME;
    }

    /*
     * Methods
     */

    public function StateGame()
    {
    }

    public override function prepareLayerScene():void
    {
        super.prepareLayerScene();

        this.controllerScene = new ControllerSceneGame();
    }

    public override function prepareLayerPopups():void
    {
        super.prepareLayerPopups();

        registerPopup(new ControllerPopupLevelEnd());
    }

    public override function update(type:String):void
    {
        this.controllerScene.update(type);
    }

    public override function onLoadingEnd():void
    {
        GameInfo.instance.managerGame.registerSceneGame(this);
        super.onLoadingEnd();
    }

    public override function placeViews(fullscreen:Boolean):void
    {
        for each(var popup:IControllerPopup in popups)
        {
            popup.view.alignment = EViewAlignment.EVA_ABSOLUTE;
            popup.view.translate(0.5, 0.5);
        }

        super.placeViews(fullscreen);
    }

}
}
