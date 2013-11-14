/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/14/13
 * Time: 2:13 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.houses
{
import controllers.IController;

import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

public class ViewHouseGAura extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceView:DisplayObjectContainer;

    //TODO:implement
//    private var _auraEnemy:gAuraEnemy;
//    private var _auraPlayer:gAuraPlayer;
    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ViewHouseGAura(controller:IController)
    {
        _sourceView = new Sprite();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
    }
}
}
