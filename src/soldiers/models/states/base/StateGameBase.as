/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/4/13
 * Time: 3:36 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.states.base
{
import controls.IView;
import models.implementations.states.base.StateBase;

public class StateGameBase extends StateBase
{
    /*
     * Fields
     */

    //ui
    private var _controlOptions:IView;

    protected var _controlGameName:IView;
    protected var _controlStripTop:IView;
    protected var _controlPlayerInfo:IView;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function StateGameBase()
    {
    }


    public override function prepareLayerUI():void
    {
        super.prepareLayerUI();

//        {//ui
//            _controlGameName = new ControlSprite(this, new gControlGameName());
//            registerControlUI(_controlGameName);

            //control strip
//            _controlStripTop = new ControlScalableStrip(this);
//            registerControlUI(_controlStripTop);

//            _controlOptions = new ControlOptions(this);
//            registerControlUI(_controlOptions);

//            _controlPlayerInfo = new ControlPlayerInfo(this);
//            registerControlUI(_controlPlayerInfo);
//        }
    }

    /*
     * IControl
     */

    //TODO:call it, when fullscreen
    private function updateViewsPositions():void
    {
//        Utils.alignHorizontalAbsolute(_controlPlayerInfo.sourceView, 0.1);
//        Utils.alignHorizontalAbsolute(_controlOptions.sourceView, 0.9, 0.5);
    }

    public override function placeViews(isFullscreen:Boolean):void
    {
        super.placeViews(isFullscreen);

//        _controlStripTop.sourceView.y = _controlGameName.sourceView.height;
//
//        _controlPlayerInfo.sourceView.y = _controlStripTop.sourceView.y + _controlStripTop.sourceView.height - _controlPlayerInfo.sourceView.height / 2;
//
//        _controlOptions.sourceView.y = _controlStripTop.sourceView.y + (_controlStripTop.sourceView.height / 2) - _controlOptions.sourceView.height / 2;

        updateViewsPositions();
    }

    /*
     * IDisposable
     */

    public override function cleanup():void
    {
        _controlGameName = null;
        _controlOptions = null;
        _controlPlayerInfo = null;
        _controlStripTop = null;

        super.cleanup();
    }
}
}
