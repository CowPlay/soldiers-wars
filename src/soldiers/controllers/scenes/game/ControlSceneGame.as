/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 6/19/13
 * Time: 1:48 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.scenes.game
{
import controls.IControl;

import soldiers.controllers.ESceneType;
import soldiers.controllers.scenes.base.ControlSceneGameBase;
import soldiers.controllers.scenes.game.views.ControlSceneGameView;
import soldiers.models.GameInfo;

public class ControlSceneGame extends ControlSceneGameBase
{
    /*
     * Fields
     */
    private var _controlSceneView:IControl;

    /*
     * Properties
     */
    public override function get type():String
    {
        return ESceneType.EST_GAME;
    }

    /*
     * Methods
     */

    public function ControlSceneGame()
    {
    }

    public override function prepareLayerScene():void
    {
        super.prepareLayerScene();

        _controlSceneView = new ControlSceneGameView(this);
        registerControlScene(_controlSceneView);
    }

    public override function update(type:String = ""):void
    {
        _controlSceneView.update(type);
    }

    public override function onLoadingEnd():void
    {
        GameInfo.instance.managerGameSoldiers.registerSceneGame(this);
        super.onLoadingEnd();
    }

}
}
