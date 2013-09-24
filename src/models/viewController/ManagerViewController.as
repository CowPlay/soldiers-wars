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

import controls.IControlScene;
import controls.implementations.ControlSceneBase;

import flash.display.DisplayObjectContainer;
import flash.display.Stage;

import models.implementations.viewController.ManagerViewControllerBase;

public class ManagerViewController extends ManagerViewControllerBase
{

    public function ManagerViewController(appStage:Stage, appRootView:DisplayObjectContainer)
    {
        super(appStage, appRootView);
    }

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
