/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 6/19/13
 * Time: 1:48 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.states.game
{
import controls.IView;

import soldiers.controllers.game.ControllerSceneGame;

import soldiers.models.GameInfo;
import soldiers.states.EStateType;
import soldiers.states.base.StateGameBase;
import soldiers.views.game.ViewSceneGame;

public class StateGame extends StateGameBase
{
    /*
     * Fields
     */
    private var _controlSceneView:IView;

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

    public override function update(type:String):void
    {
        this.controllerScene.update(type);
    }

    public override function onLoadingEnd():void
    {
        GameInfo.instance.managerGameSoldiers.registerSceneGame(this);
        super.onLoadingEnd();
    }

}
}
