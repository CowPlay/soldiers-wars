/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/5/14
 * Time: 2:35 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.ui
{
import controllers.IController;

import views.IViewButton;
import views.implementations.ViewBase;
import views.implementations.buttons.ViewButton;

public class ViewOptions extends ViewBase
{
    /*
     * Fields
     */
    private var _source:gViewOptions;

    private var _buttonFullscreen:IViewButton;
    private var _buttonScreenshot:IViewButton;
    private var _buttonSound:IViewButton;
    private var _buttonMusic:IViewButton;


    /*
     * Properties
     */

    public function get buttonFullscreen():IViewButton
    {
        return _buttonFullscreen;
    }


    public function get buttonScreenshot():IViewButton
    {
        return _buttonScreenshot;
    }

    public function get buttonSound():IViewButton
    {
        return _buttonSound;
    }

    public function get buttonMusic():IViewButton
    {
        return _buttonMusic;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ViewOptions(controller:IController)
    {
        _source = new gViewOptions();
        super(controller, _source);
        init();
    }

    private function init():void
    {
        _buttonFullscreen = new ViewButton(controller, _source.buttonFullscreen);
        _buttonScreenshot = new ViewButton(controller, _source.buttonScreenshoot);
        _buttonSound = new ViewButton(controller, _source.buttonSound);
        _buttonMusic = new ViewButton(controller, _source.buttonMusic);
    }


    override public function cleanup():void
    {
        _buttonFullscreen.cleanup();
        _buttonScreenshot.cleanup();
        _buttonSound.cleanup();
        _buttonMusic.cleanup();

        super.cleanup();
    }
}
}
