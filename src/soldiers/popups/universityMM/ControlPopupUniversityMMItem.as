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

package soldiers.popups.universityMM
{
import views.IView;
import views.IViewButton;
import views.implementations.ViewBase;
import controls.implementations.buttons.ViewButtonLabeled;

public class ControlPopupUniversityMMItem extends ViewBase
{

    /*
     * Fields
     */


    private var _sourceView:gPopapUniversityMMItem;

    private var _buttonAccelerate:IViewButton;

    /*
     * Properties
     */


    /*
     * Methods
     */

    public function ControlPopupUniversityMMItem(parent:IView)
    {
        _sourceView = new gPopapUniversityMMItem();
        super(parent, _sourceView);

        init();
    }

    private function init():void
    {
        _buttonAccelerate = new ViewButtonLabeled(this, _sourceView.buttonAccelerate);
//        _buttonAccelerate.actionDelegate = this;
    }

    public override function cleanup():void
    {
        _buttonAccelerate.cleanup();
        _buttonAccelerate = null;

        _sourceView = null;

        super.cleanup();
    }
}
}
