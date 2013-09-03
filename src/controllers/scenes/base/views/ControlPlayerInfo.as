/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/3/13
 * Time: 12:05 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.base.views
{
import core.controls.ControlBase;
import controllers.scenes.base.ControlScene;

public class ControlPlayerInfo extends ControlBase
{
    /*
     * Fields
     */
    private var _rootView:gControlPlayerInfo;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlPlayerInfo(sceneOwner:ControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _rootView = new gControlPlayerInfo();
        addChild(_rootView);
    }

    /*
     * IDisposable
     */

    public override function cleanup():void
    {
        removeChild(_rootView);
        _rootView = null;

        super.cleanup();
    }
}
}
