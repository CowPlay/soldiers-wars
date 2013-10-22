/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 22.10.13
 * Time: 14:08
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.popups.mineGold
{
import controls.IControl;
import controls.IControlButton;
import controls.IControlScene;
import controls.implementations.ControlBase;
import controls.implementations.buttons.ControlButtonWithLabelsBase;

import flash.events.MouseEvent;

public class ControlPopupMineGoldItem extends ControlBase
{
    /*
     *Fields
     */
    private var _sourceViewTyped:gPopupMineGoldItem;

    private var _buttonBuild:IControlButton;

    /*
     *Properties
     */

    /*
     *Methods
     */
    public function ControlPopupMineGoldItem(sceneOwner:IControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gPopupMineGoldItem();
        setSourceView(_sourceViewTyped);

        _buttonBuild = new ControlButtonWithLabelsBase(sceneOwner, _sourceViewTyped.buttonBuild);
        _buttonBuild.actionDelegate = this;
    }

    /*
     * IActionDelegate
     */
    public override function onControlMouseClick(target:IControl, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onControlMouseClick(target, e);

        if (!result)
        {
            switch (target)
            {
                case _buttonBuild:
                {
                    result = true;
                    break;
                }
                default :
                {
                    Debug.assert(false);
                    break;
                }
            }
        }

        return result;
    }
    /*
     * IControl
     */


}
}
