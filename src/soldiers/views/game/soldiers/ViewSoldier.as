/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 5/31/13
 * Time: 11:43 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.soldiers
{
import com.greensock.TweenMax;

import controllers.IController;

import flash.display.MovieClip;

import soldiers.models.game.managerPath.GridCell;
import soldiers.models.game.soldiers.ESoldierRotation;
import soldiers.models.game.soldiers.SoldierInfo;
import soldiers.models.housesGame.base.EHouseOwner;

import views.implementations.ViewBase;

public class ViewSoldier extends ViewBase
{
    /*
     * Static methods
     */
    private static function getSoldierClass(type:String):Class
    {
        var result:Class;

        switch (type)
        {
            case EHouseOwner.EHO_ENEMY:
            {
                result = gSoldierEnemy;

                break;
            }
            case EHouseOwner.EHO_PLAYER:
            {
                result = gSoldierPlayer;
                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }

        return result;
    }

    /*
     * Fields
     */
    private var _sourceView:MovieClip;
    private var _soldierView:MovieClip;
    private var _entry:SoldierInfo;

    /*
     * Properties
     */


    /*
     * Events
     */

    /*
     * Methods
     */

    public function ViewSoldier(controller:IController, entry:SoldierInfo)
    {
        var sourceClass:Class = getSoldierClass(entry.houseOwnerType);

        _sourceView = new sourceClass();
        super(controller, _sourceView);

        _entry = entry;

        init();
    }

    private function init():void
    {
        for (var level:int = 1; level <= _entry.levelMax; level++)
        {
            var propertyName:String = "level_" + level.toString();
            Debug.assert(_sourceView.hasOwnProperty(propertyName), "Not found soldier view: " + propertyName);

            if (level == _entry.level)
            {
                _soldierView = _sourceView[propertyName];
                _soldierView.visible = true;
            }
            else
            {
                _sourceView[propertyName].visible = false;
            }
        }
    }

    public function moveToTarget(from:GridCell, to:GridCell, callback:Function):void
    {
        _sourceView.x = from.view.source.x;
        _sourceView.y = from.view.source.y;

        _soldierView.gotoAndStop(ESoldierRotation.getRotation(from, to));

        var paramsRun:Object =
        {
            x         : to.view.source.x,
            y         : to.view.source.y,
            onComplete: callback
        };

        var distance:Number = from.getDistanceTo(to);

        TweenMax.to(source, (distance / _entry.speed), paramsRun);
    }


    /*
     * IDisposable
     */


    public override function cleanup():void
    {
        TweenMax.killTweensOf(_sourceView);
        TweenMax.killTweensOf(this);

        _sourceView = null;
        _soldierView = null;
        _entry = null;

        super.cleanup();
    }
}
}
