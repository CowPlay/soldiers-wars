/**
* Created with IntelliJ IDEA.
* User: user
* Date: 21.10.13
* Time: 12:20
* To change this template use File | Settings | File Templates.
*/
package soldiers.controllers.popups.merlinTower
{
import controls.IControlScene;
import controls.implementations.ControlBase;

public class SkillView extends ControlBase
{
    /*
     *Fields
     */
         private var _sourceViewTyped:gSkillView;

    /*
     *Properties
     */

    /*
     *Methods
     */
    public function SkillView(sceneOwner:IControlScene)
    {
        super (sceneOwner);

        init();
    }

    private function init():void
    {
       _sourceViewTyped = new gSkillView();
        setSourceView(_sourceViewTyped);
    }

    public override function cleanup():void
    {
        _sourceViewTyped = null;

        super.cleanup();
    }

}
}
