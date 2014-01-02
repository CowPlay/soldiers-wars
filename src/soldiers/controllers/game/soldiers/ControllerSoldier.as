/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/13/13
 * Time: 5:00 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game.soldiers
{
import controllers.implementations.Controller;

import soldiers.GameInfo;
import soldiers.models.game.managerPath.GridCell;
import soldiers.models.game.soldiers.ESoldierState;
import soldiers.models.game.soldiers.SoldierInfo;
import soldiers.views.game.soldiers.ViewSoldier;

import utils.UtilsArray;

public class ControllerSoldier extends Controller
{
    /*
     * Fields
     */
    private var _view:ViewSoldier;

    private var _entry:SoldierInfo;


    private var _path:Array;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerSoldier(entry:SoldierInfo)
    {
        Debug.assert(entry != null);
        _entry = entry;

        _view = new ViewSoldier(this, _entry);
        super(_view);

        init();
    }

    private function init():void
    {
        _path = [];
        for each(var cell:GridCell in _entry.path)
        {
            _path.push(cell);
        }

        var callback:Function =
                function ():void
                {
                    UtilsArray.removeValue(_path, _path[0]);

                    if (_path.length == 1)
                    {
                        GameInfo.instance.managerGame.onSoldierMoveComplete(_entry);
                    }
                    else
                    {
                        _view.moveToTarget(_path[0], _path[1], callback)
                    }
                };

        _entry.state = ESoldierState.ESS_IN_MOVE;

        _view.moveToTarget(_path[0], _path[1], callback);
    }

    public override function cleanup():void
    {
        _entry = null;

        super.cleanup();
    }
}
}
