/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/3/13
 * Time: 1:58 PM
 * To change this template use File | Settings | File Templates.
 */
package models.village.Houses.base
{

import flash.display.MovieClip;
import flash.events.MouseEvent;

import models.GameInfo;

public class HouseVillageBase implements IDisposable
{
    /*
     * Fields
     */

    private var _view:MovieClip;

    private var _level:int;
    private var _state:EHouseVillageState;
    /*
     * Properties
     */

    public function get type():EHouseVillageType
    {
        Debug.assert(false, "HouseVillageBase::type. Implement me in derived class.");
        return null;
    }

    public function get view():MovieClip
    {
        return _view;
    }

    public function set view(value:MovieClip):void
    {
        if (_view)
        {
            _view.removeEventListener(MouseEvent.CLICK, onButtonClick);
        }

        _view = value;

        if (_view)
        {
            _view.addEventListener(MouseEvent.CLICK, onButtonClick);
        }
    }

    public function get level():int
    {
        return _level;
    }

    public function set level(value:int):void
    {
        if (_level == value)
            return;

        _level = value;
    }

    public function get state():EHouseVillageState
    {
        return _state;
    }

    public function set state(value:EHouseVillageState):void
    {
        if (_state == value)
            return;

        _state = value;

    }

    /*
     * Methods
     */

    //! Default constructor
    public function HouseVillageBase(state:EHouseVillageState, level:int)
    {
        _view = view;

        _state = state;
        _level = level;
    }

    public function cleanup():void
    {
        if (_view != null)
        {
            _view = null;
        }
    }

    private function tryBuild():void
    {
        Debug.assert(_state == EHouseVillageState.EHVS_CLOSED);

        if (canBuild())
        {
            //TODO: build
            GameInfo.Instance.managerVillage.didHouseBuild(this);
        }
    }

    protected function canBuild():Boolean
    {
        Debug.assert(false, "HouseVillageBase::canBuild. Please override it.");
        return false;
    }

    /*
     * Event handlers
     */

    protected function onButtonClick(e:MouseEvent):void
    {
        switch (_state)
        {
            case  EHouseVillageState.EHVS_OPEN:
            {
                Debug.log("show info");
                break;
            }
            case EHouseVillageState.EHVS_CLOSED:
            {
                tryBuild();
                break;
            }
            case EHouseVillageState.EHVS_BUILD:
            {
                //do nothing
                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }
    }

}
}
