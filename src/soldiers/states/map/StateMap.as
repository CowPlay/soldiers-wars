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
import controls.IView;

import models.implementations.states.base.StateBase;

import soldiers.controllers.map.ControllerMapScene;

import soldiers.states.EStateType;
import soldiers.states.base.StateGameBase;
import soldiers.views.map.ViewMapScene;
import soldiers.views.map_back.ControlSceneMapView;

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

//    public override function onLoadingEnd():void
//    {
//        super.onLoadingEnd();
//    }
}
}
