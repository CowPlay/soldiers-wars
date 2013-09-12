/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/9/13
 * Time: 9:49 AM
 * To change this template use File | Settings | File Templates.
 */
package core.controls.implementations
{
import core.ConstantsBase;
import core.Debug;
import core.controls.IControlButtonWithLabels;
import core.controls.IControlScene;

import flash.display.MovieClip;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.utils.Dictionary;

public class ControlButtonWithLabelsBase extends ControlButtonBase implements IControlButtonWithLabels
{
    /*
     * Constants
     */

    private static const ELT_UP:String = "UP";
    private static const ELT_OVER:String = "OVER";
    private static const ELT_DOWN:String = "DOWN";

    /*
     * Fields
     */

    private var _labelsNames:Array;
    private var _labelsNamesAllStates:Dictionary;

    /*
     * Properties
     */


    /*
     * Methods
     */

    //! @param labelsNames - array which contains labels names
    //! Default constructor
    public function ControlButtonWithLabelsBase(sceneOwner:IControlScene, sourceViewValue:MovieClip, labelsNames:Array = null)
    {
        super(sceneOwner, sourceViewValue);

        labelsNames = labelsNames == null ? [""] : labelsNames;

        init(labelsNames);
    }

    private function init(labelsNames:Array):void
    {
        _labelsNames = [];
        _labelsNamesAllStates = new Dictionary();

        for each(var labelName:String in labelsNames)
        {
            var labelStates:Array = [];

            labelName = labelName.toUpperCase();

            var labelUpName:String = "labelUp" + labelName;
            Debug.assert(sourceView.hasOwnProperty(labelUpName), "Missing label up instance");
            labelStates.push(labelUpName);

            var labelOverName:String = "labelOver" + labelName;
            Debug.assert(sourceView.hasOwnProperty(labelOverName), "Missing label over instance");
            labelStates.push(labelOverName);

            var labelDownName:String = "labelDown" + labelName;
            Debug.assert(sourceView.hasOwnProperty(labelDownName), "Missing label down instance");
            labelStates.push(labelDownName);

            _labelsNames.push(labelName);

            _labelsNamesAllStates[labelName] = labelStates;
        }
    }

    public function setLabelValue(labelName:String, labelValue:String):void
    {
        labelName = labelName.toUpperCase();

        Debug.assert(_labelsNames.indexOf(labelName) != ConstantsBase.INDEX_NONE, "Not found label with name: " + labelName);

        var labelStates:Array = _labelsNamesAllStates[labelName];

        for each (var labelState:String in labelStates)
        {
            sourceView[labelState].text = labelValue;
        }
    }

    public function getLabelValue(labelName:String):String
    {
        var result:String = null;

        labelName = labelName.toUpperCase();
        Debug.assert(_labelsNames.indexOf(labelName) != ConstantsBase.INDEX_NONE, "Not found label with name: " + labelName);

        var labelStates:Array = _labelsNamesAllStates[labelName];
        var firstLabelState:String  =  labelStates[0];
        result = sourceView[firstLabelState].text;

        return result;
    }

    private function hideAllLabels():void
    {
        for each (var labelName:String in _labelsNames)
        {
            var labelStates:Array = _labelsNamesAllStates[labelName];

            for each (var labelState:String in labelStates)
            {
                sourceView[labelState].visible = false;
            }
        }
    }

    private function showLabel(type:String):void
    {
        for each (var labelName:String in _labelsNames)
        {
            var labelStates:Array = _labelsNamesAllStates[labelName];

            for (var i:int = 0; i < labelStates.length; i++)
            {
                var labelState:String = labelStates[i];

                switch (type)
                {
                    case ELT_UP:
                    {
                        sourceView[labelState].visible = i == 0;

                        break;
                    }
                    case ELT_OVER:
                    {
                        sourceView[labelState].visible = i == 1;

                        break;
                    }

                    case ELT_DOWN:
                    {
                        sourceView[labelState].visible = i == 2;

                        break;
                    }
                    default :
                    {
                        Debug.assert(false);
                        break;
                    }
                }

            }
        }
    }


    /*
     * Handlers
     */

    protected override function onMouseUpOver(e:MouseEvent):void
    {
        super.onMouseUpOver(e);

        showLabel(ELT_OVER);
    }

    protected override function onMouseUpOut(e:Event):void
    {
        super.onMouseUpOut(e);

        showLabel(ELT_UP);
    }


    protected override function onMouseOut(e:MouseEvent):void
    {
        if (_isMouseDown)
            return;

        super.onMouseOut(e);

        showLabel(ELT_UP);
    }

    protected override function onMouseOver(e:MouseEvent):void
    {
        if (_isMouseDown)
            return;

        super.onMouseOver(e);

        showLabel(ELT_OVER);
    }

    protected override function onMouseDown(e:MouseEvent):void
    {
        super.onMouseDown(e);

        showLabel(ELT_DOWN);
    }


}
}
