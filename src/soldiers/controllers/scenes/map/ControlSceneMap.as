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
package soldiers.controllers.scenes.map
{
import controls.IControl;
import controls.implementations.scenes.base.ControlSceneBase;

import soldiers.controllers.ESceneType;
import soldiers.controllers.scenes.map.views.ControlSceneMapView;

public class ControlSceneMap  extends ControlSceneBase
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
        return ESceneType.EST_GAME_MAP;
    }

    /*
     * Methods
     */
    public function ControlSceneMap()
    {
    }

    public override function prepareLayerScene():void
    {
        super.prepareLayerScene();

        _controlSceneView = new ControlSceneMapView(this);
        registerControlScene(_controlSceneView);
    }

    public override function onLoadingEnd():void
    {
        super.onLoadingEnd();
    }
}
}
