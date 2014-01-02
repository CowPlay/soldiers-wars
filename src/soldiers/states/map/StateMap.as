/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 30.10.13
 * Time: 10:16
 * To change this template use File | Settings | File Templates.
 */
package soldiers.states.map
{
import controllers.IControllerPopup;

import views.EViewPosition;

import soldiers.controllers.map.ControllerMapScene;
import soldiers.controllers.popups.levelStart.ControllerPopupLevelStart;
import soldiers.states.EStateType;
import soldiers.states.base.StateGameBase;

public class StateMap extends StateGameBase
{
    /*
     * Fields
     */

    /*
     * Properties
     */
    public override function get type():String
    {
        return EStateType.EST_GAME_MAP;
    }

    /*
     * Methods
     */
    public function StateMap()
    {
    }

    public override function prepareLayerScene():void
    {
        super.prepareLayerScene();

        this.controllerScene = new ControllerMapScene();
    }

    public override function prepareLayerPopups():void
    {
        super.prepareLayerPopups();

        registerPopup(new ControllerPopupLevelStart());
    }

    public override function placeViews(fullscreen:Boolean):void
    {
        for each(var popup:IControllerPopup in popups)
        {
            popup.view.position = EViewPosition.EVP_ABSOLUTE;
            popup.view.translate(0.5, 0.5);
        }

        super.placeViews(fullscreen);
    }

    public override function cleanup():void
    {
        super.cleanup();
    }
}
}
