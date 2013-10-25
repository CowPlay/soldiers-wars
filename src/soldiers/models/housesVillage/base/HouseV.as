/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/3/13
 * Time: 1:58 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.housesVillage.base
{

import controls.IControl;

import flash.events.MouseEvent;
import flash.utils.Dictionary;

import serialization.ISerializable;

import soldiers.models.GameInfo;

public class HouseV implements ISerializable
{
    /*
     * Fields
     */
    private var _view:IControl;

    private var _level:uint;

    //key - level number, value - level info object
    private var _levelsInfo:Dictionary;

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
        if (_view == value)
            return;

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

    public function get levelsInfo():Dictionary
    {
        return _levelsInfo;
    }


    protected function get levelInfoClass():Class
    {
        Debug.assert(false, "Please implement in derived classes");
        return null;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function HouseV()
    {
    }


    private function tryBuild():void
    {
        Debug.assert(_state == EHouseVState.EHVS_CLOSED);

        if (canBuild())
        {
            //TODO: build
            GameInfo.instance.managerHousesVillage.didHouseBuild(this);
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
        Debug.assert(false, "Not implemented");

        return null;
    }

    public function deserialize(data:Object):void
    {
        Debug.assert(data.hasOwnProperty("level"));

        Debug.assert(data.hasOwnProperty("levels_info"));
        Debug.assert(data["levels_info"] is Array);

        _levelsInfo = new Dictionary(true);

        _level = data["level"];

        var levelsInfo:Array = data["levels_info"];

        var levelInfoType:Class = this.levelInfoClass;

        for each(var levelInfoData:Object in levelsInfo)
        {
            var levelInfo:HouseLevelInfoV = new levelInfoType();
            levelInfo.deserialize(levelInfoData);
            _levelsInfo[levelInfo.level] = levelInfo;

            levelInfo.isAvailable = levelInfo.level <= _level;
        }
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
