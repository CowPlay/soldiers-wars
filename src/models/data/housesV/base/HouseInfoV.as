/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/3/13
 * Time: 1:58 PM
 * To change this template use File | Settings | File Templates.
 */
package models.data.housesV.base
{

import controls.IControl;

import flash.events.MouseEvent;

import models.GameInfo;

import serialization.ISerializable;

public class HouseInfoV implements ISerializable
{
    /*
     * Fields
     */

    private var _view:IControl;

    private var _level:uint;
    private var _levelMax:uint;

    private var _state:String;
    /*
     * Properties
     */

    public function get type():String
    {
        Debug.assert(false, "HouseVillageBase::type. Implement me in derived class.");
        return null;
    }

    public function get view():IControl
    {
        return _view;
    }

    public function set view(value:IControl):void
    {
        Debug.assert(_view == null);

        _view = value;
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

    public function get state():String
    {
        return _state;
    }

    public function set state(value:String):void
    {
        if (_state == value)
            return;

        _state = value;

    }

    /*
     * Methods
     */

    //! Default constructor
    public function HouseInfoV()
    {
    }



    private function tryBuild():void
    {
        Debug.assert(_state == EHouseVState.EHVS_CLOSED);

        if (canBuild())
        {
            //TODO: build
            GameInfo.instance.managerVillage.didHouseBuild(this);
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
            case  EHouseVState.EHVS_OPEN:
            {
                Debug.log("show info");
                break;
            }
            case EHouseVState.EHVS_CLOSED:
            {
                tryBuild();
                break;
            }
            case EHouseVState.EHVS_BUILD:
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

    /*
     * ISerializable
     */


    public function serialize():Object
    {
        return null;
    }

    public function deserialize(data:Object):void
    {
        Debug.assert(data.hasOwnProperty("level"));
        Debug.assert(data.hasOwnProperty("level_max"));

        _level = data["level"];
        _levelMax = data["level_max"];
    }

    /*
     * IDisposable
     */

    public function cleanup():void
    {
        if (_view != null)
        {
            _view = null;
        }
    }

}
}
