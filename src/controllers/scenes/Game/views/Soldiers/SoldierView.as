/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 5/31/13
 * Time: 11:43 AM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.game.views.Soldiers
{
import core.Debug;
import core.controls.implementations.ControlBase;

import flash.display.MovieClip;

import models.Game.base.gameObjects.Soldier.Soldier;

public class SoldierView extends ControlBase
{
    /*
     * Fields
     */
    private var _entry:Soldier;

    private var _soldierView:MovieClip;

    private var _soldierRotation:ESoldierRotation;

//    private var _tweenX:Tween;
//    private var _tweenY:Tween;

    /*
     * Properties
     */

    public function get entry():Soldier
    {
        return _entry;
    }

    public function set soldierRotation(value:ESoldierRotation):void
    {
        if (_soldierRotation == value)
        {
            return;
        }

        _soldierRotation = value;

        switch (_soldierRotation)
        {
            case ESoldierRotation.ESR_UP_LEFT:
            {
                _soldierView.gotoAndStop(8);
                break;
            }
            case ESoldierRotation.ESR_UP:
            {
                _soldierView.gotoAndStop(1);
                break;
            }
            case ESoldierRotation.ESR_UP_RIGHT:
            {
                _soldierView.gotoAndStop(2);
                break;
            }
            case ESoldierRotation.ESR_RIGHT:
            {
                _soldierView.gotoAndStop(3);
                break;
            }
            case ESoldierRotation.ESR_DOWN_RIGHT:
            {
                _soldierView.gotoAndStop(4);
                break;
            }
            case ESoldierRotation.ESR_DOWN:
            {
                _soldierView.gotoAndStop(5);
                break;
            }
            case ESoldierRotation.ESR_DOWN_LEFT:
            {
                _soldierView.gotoAndStop(6);
                break;
            }
            case ESoldierRotation.ESR_LEFT:
            {
                _soldierView.gotoAndStop(7);
                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }
    }


    /*
     * Methods
     */

    //! Default constructor
    public function SoldierView(owner:Soldier)
    {
        Debug.assert(owner != null);

        _entry = owner;

        var soldierClass:Class = ResourceLoader.getClass(ResourceManagerSoldier.getSoldierClassByOwner(_entry));

        _soldierView = new soldierClass;

        this.eventHandler = _soldierView;

        addChild(_soldierView);
    }

    /*
     * IDisposable
     */


    public override function cleanup():void
    {
    }
}
}
