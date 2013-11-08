/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 21.10.13
 * Time: 12:20
 * To change this template use File | Settings | File Templates.
 */
package soldiers.popups.merlinTower
{
import controls.IView;
import controls.implementations.ControlBase;

public class SkillView extends ControlBase
{
    /*
     *Fields
     */
    private var _sourceView:gSkillView;

    /*
     *Properties
     */

    /*
     *Methods
     */
    public function SkillView(parent:IView)
    {
        _sourceView = new gSkillView();
        super(parent, _sourceView);

        init();
    }

    private function init():void
    {
    }

    public override function cleanup():void
    {
        _sourceView = null;

        super.cleanup();
    }

}
}
