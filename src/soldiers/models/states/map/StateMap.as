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
package soldiers.models.states.map
{
import controls.IView;

import models.implementations.states.base.StateBase;

import soldiers.models.states.EStateType;
import soldiers.views.map.ControlSceneMapView;

public class StateMap extends StateBase
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

        _controlSceneView = new ControlSceneMapView();
        setControllerScene(_controlSceneView);
    }

    public override function onLoadingEnd():void
    {
        super.onLoadingEnd();
    }
}
}
