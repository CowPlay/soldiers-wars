/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 5/31/13
 * Time: 11:43 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.soldiers
{
import com.greensock.TimelineMax;
import com.greensock.TweenMax;

import controllers.IController;

import controls.implementations.ControlBase;

import flash.display.MovieClip;

import soldiers.models.game.managerPath.GridCell;
import soldiers.models.game.soldiers.ESoldierRotation;
import soldiers.models.game.soldiers.SoldierInfo;

public class ViewSoldier extends ControlBase
{
    /*
     * Static methods
     */

    private static function getRotationFrame(from:GridCell, to:GridCell):int
    {
        Debug.assert(from != null);
        Debug.assert(to != null);
        Debug.assert(from.row != to.row || from.column != to.column);

        var result:int;

        if (from.row > to.row)
        {
            if (from.column == to.column)
            {
                result = ESoldierRotation.ESR_DOWN;
            }
            else if (from.column < to.column)
            {
                result = ESoldierRotation.ESR_DOWN_RIGHT;
            }
            else
            {
                result = ESoldierRotation.ESR_DOWN_LEFT;
            }
        }
        else if (from.row < to.row)
        {
            if (from.column == to.column)
            {
                result = ESoldierRotation.ESR_UP;
            }
            else if (from.column < to.column)
            {
                result = ESoldierRotation.ESR_UP_RIGHT;
            }
            else
            {
                result = ESoldierRotation.ESR_UP_LEFT;
            }
        }
        else
        {
            if (from.column > to.column)
            {
                result = ESoldierRotation.ESR_LEFT;
            }
            else
            {
                result = ESoldierRotation.ESR_RIGHT;
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

    private var _rotationFrame:int;
    /*
     * Properties
     */
    public function get rotationFrame():int
    {
        return _rotationFrame;
    }

    public function set rotationFrame(value:int):void
    {
        if (_rotationFrame == value)
            return;

        _rotationFrame = value;

        _soldierView.gotoAndStop(value);
    }


    /*
     * Methods
     */

    public function ViewSoldier(controller:IController, entry:SoldierInfo)
    {
        //TODO: detect type
        _sourceView = new gSoldierPlayer();
        super(controller, _sourceView);

        _entry = entry;

        init();
    }

    private function init():void
    {

    }

    public function moveToTarget(callback:Function):void
    {
        for (var level:int = 1; level <= _entry.levelMax; level++)
        {
            var propertyName:String = "level_" + level.toString();
            Debug.assert(_sourceView.hasOwnProperty(propertyName), "Not found soldier view: " + propertyName);

            if (level == _entry.level)
            {
                _soldierView = _sourceView[propertyName];
                _soldierView.visible = true;
                _soldierView.gotoAndStop(0);
            }
            else
            {
                _sourceView[propertyName].visible = false;
            }
        }

        var firstCell:GridCell = _entry.path[0];

        source.x = firstCell.view.source.x;
        source.y = firstCell.view.source.y;

        var tweenSequence:TimelineMax = new TimelineMax();

        var nodeFrom:GridCell;
        var nodeTo:GridCell;

        var prevRotationFrame:int = ConstantsBase.INDEX_NONE;
        var sameRotationCellsCount:int = 0;

        var delayRotationChange:Number = 0.1;

        var owner:ViewSoldier = this;

        var generateAndAppedTween:Function = function (onComplete:Function = null):void
        {
            var paramsRotation:Object =
            {
                rotationFrame: prevRotationFrame,
                onComplete: function ():void
                {
                    owner.rotationFrame = prevRotationFrame;
                }
            };

            {//tween rotation
                var tweenRotation:TweenMax = new TweenMax(this, delayRotationChange, paramsRotation);
                tweenSequence.append(tweenRotation);
            }

            {//tween run
                var paramsRun:Object =
                {
                    x: nodeTo.view.source.x,
                    y: nodeTo.view.source.y,
                    onComplete: onComplete
                };

                var tweenRun:TweenMax = new TweenMax(source, (1 / _entry.speed) * sameRotationCellsCount - delayRotationChange, paramsRun);
                tweenSequence.append(tweenRun);
            }
        };

        for (var i:int = 0; i < _entry.path.length - 1; i++)
        {
            nodeFrom = _entry.path[i];
            nodeTo = _entry.path[i + 1];

            var rotationFrame:int = getRotationFrame(nodeFrom, nodeTo);

            if (prevRotationFrame == ConstantsBase.INDEX_NONE)
            {
                prevRotationFrame = rotationFrame;
            }

            if (prevRotationFrame != rotationFrame)
            {
                generateAndAppedTween();

                sameRotationCellsCount = 0;
                prevRotationFrame = rotationFrame;
            }
            else
            {
                sameRotationCellsCount++;
            }
        }

        generateAndAppedTween(callback);

        tweenSequence.play();
    }

    /*
     * IDisposable
     */


    public override function cleanup():void
    {
        TweenMax.killTweensOf(source);
        TweenMax.killTweensOf(this);

        _sourceView = null;
        _soldierView = null;
        _entry = null;

        super.cleanup();
    }
}
}
