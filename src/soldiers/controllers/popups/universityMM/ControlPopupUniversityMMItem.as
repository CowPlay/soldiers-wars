/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 18.10.13
 * Time: 19:01
 * To change this template use File | Settings | File Templates.
 */

package soldiers.controllers.popups.universityMM
{
import controls.IControlButton;
import controls.IControlScene;
import controls.implementations.ControlBase;
import controls.implementations.buttons.ControlButtonBase;
import controls.implementations.buttons.ControlButtonWithLabelsBase;

public class ControlPopupUniversityMMItem extends ControlBase
{

    /*
     * Fields
     */


    private var _sourceViewTyped:gPopapUniversityMMItem;

    private var _buttonAccelerate:IControlButton;

    /*
     * Properties
     */


    /*
     * Methods
     */

    public function ControlPopupUniversityMMItem(sceneOwner:IControlScene)
    {
        super (sceneOwner);

        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gPopapUniversityMMItem();
        setSourceView(_sourceViewTyped);

        _buttonAccelerate = new ControlButtonWithLabelsBase(sceneOwner, _sourceViewTyped.buttonAccelerate);
        _buttonAccelerate.actionDelegate = this;
    }
}
}
