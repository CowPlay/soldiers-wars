/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/9/13
 * Time: 5:41 PM
 * To change this template use File | Settings | File Templates.
 */
package core.controls
{
public interface IControlButtonWithLabels extends IControlButton
{
    function setLabelValue(labelName:String, labelValue:String):void;

    function getLabelValue(labelName:String):String;

}
}
