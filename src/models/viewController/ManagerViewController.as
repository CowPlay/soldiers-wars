/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/6/13
 * Time: 11:57 AM
 * To change this template use File | Settings | File Templates.
 */
package models.viewController
{
import controllers.ESceneType;
import controllers.scenes.game.ControlSceneGame;
import controllers.scenes.village.ControlSceneVillage;

import core.Debug;
import core.controls.IControlScene;
import core.controls.implementations.ControlSceneBase;
import core.models.implementations.viewController.ManagerViewControllerBase;

public class ManagerViewController extends ManagerViewControllerBase
{

    public override function createSceneByType(type:String):IControlScene
    {
        Debug.assert(type != null && type != "");

        var result:ControlSceneBase = null;

        switch (type)
        {
            case ESceneType.EST_GAME:
            {
                result = new ControlSceneGame();
                break;
            }
            case ESceneType.EST_VILLAGE:
            {
                result = new ControlSceneVillage();
                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }

        return result;
    }

}
}
