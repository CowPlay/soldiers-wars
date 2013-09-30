/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 5/29/13
 * Time: 7:02 PM
 * To change this template use File | Settings | File Templates.
 */
package models.data.soldiers
{
import com.greensock.TweenLite;

import controls.IControl;

import models.GameInfo;
import models.data.houses.base.HouseInfo;
import models.game.managerPath.ManagerPath;

public class SoldierInfo implements IDisposable
{
    private var _houseOwnerType:String;
    private var _houseTarget:HouseInfo;

    private var _level:uint;
    private var _levelMax:uint;

    private var _soldierRotation:ESoldierRotation;
    private var _path:Array;

    private var _view:IControl;


    /*
     * Properties
     */
    public function get houseOwnerType():String
    {
        return _houseOwnerType;
    }

    public function get houseTarget():HouseInfo
    {
        return _houseTarget;
    }

    public function get level():uint
    {
        return _level;
    }

    public function get levelMax():uint
    {
        return _levelMax;
    }

    public function get soldierRotation():ESoldierRotation
    {
        return _soldierRotation;
    }


    public function set soldierRotation(value:ESoldierRotation):void
    {
        if (_soldierRotation == value)
            return;

        _soldierRotation = value;
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

    public function get damage():int
    {
        return 1;
    }


    public function get speed():Number
    {
        return 3;
    }


    public function get path():Array
    {
        return _path;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function SoldierInfo(owner:HouseInfo, target:HouseInfo)
    {
        Debug.assert(owner != null);
        Debug.assert(target != null);
        Debug.assert(target != owner);

        _houseOwnerType = owner.ownerType;
        _level = owner.level;
        _levelMax = owner.levelMax;
        _houseTarget = target;

        var managerPath:ManagerPath = GameInfo.instance.managerGameSoldiers.managerPath;

        _path = managerPath.getPath(managerPath.getCell(owner.positionExit), managerPath.getCell(_houseTarget.positionExit));

        Debug.assert(_path.length > 1);
    }

    public function moveToTarget(onComplete:Function):void
    {
        var paramsLastTween:Object =
        {
            onComplete: onComplete,
            onCompleteParams: [this]
        };

        TweenLite.to(this, _path.length * (1 / speed), paramsLastTween);
    }

    /*
     *  IDisposable
     */

    public function cleanup():void
    {
//        _path = [];
//
//        _view.cleanup();
//        _view = null;
    }
}
}
