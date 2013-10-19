/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/8/13
 * Time: 1:18 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.scenes.village.views
{
import controls.IControlButtonWithLabels;
import controls.IControlScene;
import controls.implementations.ControlBase;
import controls.implementations.buttons.ControlButtonWithLabelsBase;

public class ControlMultiplayer extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceViewtyped:gControlMultiPlayer;

    private var _buttonMultiplayer:IControlButtonWithLabels;
    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlMultiplayer(sceneOwner:IControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _sourceViewtyped = new gControlMultiPlayer();
        setSourceView(_sourceViewtyped);

        _buttonMultiplayer = new ControlButtonWithLabelsBase(sceneOwner, _sourceViewtyped.buttonMultiplayer);
        _buttonMultiplayer.actionDelegate = this;
    }

    public override function cleanup():void
    {
        _buttonMultiplayer.cleanup();
        _buttonMultiplayer = null;

        _sourceViewtyped = null;
        super.cleanup();
    }
}
}
