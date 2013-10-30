/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 01.11.13
 * Time: 12:47
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.scenes.map.views
{
import controls.IControlScene;
import controls.implementations.ControlBase;

public class ControlStar extends ControlBase
{
    /*
     *Fields
     */
    private var _sourceViewType:gStar;
    /*
     *Properties
     */

    /*
     *Methods
     */
    public function ControlStar(sceneOwner:IControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _sourceViewType = new gStar();
        setSourceView(_sourceViewType);
    }

    public override function cleanup():void
    {
      _sourceViewType = null;

        super.cleanup();
    }
}
}
