/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 5/31/13
 * Time: 11:43 AM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.game.views.soldiers.base
{
import com.greensock.TimelineMax;
import com.greensock.TweenMax;

import controls.IControlScene;
import controls.implementations.ControlBase;

import flash.display.MovieClip;

import models.data.soldiers.ESoldierRotation;
import models.data.soldiers.SoldierInfo;
import models.game.managerPath.GridCell;

public class ControlSoldierView extends ControlBase
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
    private var _sourceViewTyped:MovieClip;
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

    public function ControlSoldierView(sceneOwner:IControlScene, entry:SoldierInfo)
    {
        super(sceneOwner);

        Debug.assert(entry != null);

        _entry = entry;

        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gSoldierPlayer();
        setSourceView(_sourceViewTyped);

        for (var level:int = 1; level <= _entry.levelMax; level++)
        {
            var propertyName:String = "level_" + level.toString();
            Debug.assert(_sourceViewTyped.hasOwnProperty(propertyName));

            if (level == _entry.level)
            {
                _soldierView = _sourceViewTyped[propertyName];
                _soldierView.visible = true;
                _soldierView.gotoAndStop(0);
            }
            else
            {
                _sourceViewTyped[propertyName].visible = false;
            }
        }

        var firstCell:GridCell = _entry.path[0];

        sourceView.x = firstCell.view.sourceView.x;
        sourceView.y = firstCell.view.sourceView.y;

        //TODO: update rotation

        var tweenSequence:TimelineMax = new TimelineMax();

        var nodeFrom:GridCell;
        var nodeTo:GridCell;

        var delayRotationChange:Number = 0.1;

        for (var i:int = 0; i < _entry.path.length - 1; i++)
        {
            nodeFrom = _entry.path[i];
            nodeTo = _entry.path[i + 1];

            var rotationFrame:int = getRotationFrame(nodeFrom, nodeTo);

            var paramsView:Object =
            {
                rotationFrame: rotationFrame
            };

            var tweenView:TweenMax = new TweenMax(this, delayRotationChange, paramsView);

            tweenSequence.append(tweenView);

            var paramsSource:Object =
            {
                x: nodeTo.view.sourceView.x,
                y: nodeTo.view.sourceView.y
            };

            var tweenSource:TweenMax = new TweenMax(sourceView, (1 / _entry.speed) - delayRotationChange, paramsSource);

            tweenSequence.append(tweenSource);
        }

        var paramsLastTween:Object =
        {
            x: nodeTo.view.sourceView.x,
            y: nodeTo.view.sourceView.y
        };

        var lastTweenSource:TweenMax = new TweenMax(sourceView, 1 / _entry.speed, paramsLastTween);
        tweenSequence.append(lastTweenSource);

        tweenSequence.play();
    }

    /*
     * IDisposable
     */


    public override function cleanup():void
    {
        TweenMax.killTweensOf(sourceView);
        TweenMax.killTweensOf(this);

        _sourceViewTyped = null;
        _soldierView = null;
        _entry = null;

        super.cleanup();
    }
}
}
