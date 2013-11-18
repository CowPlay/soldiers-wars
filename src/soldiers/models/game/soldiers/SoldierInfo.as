/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 5/29/13
 * Time: 7:02 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.soldiers
{
import com.greensock.TweenLite;
import com.greensock.TweenMax;

import controls.IView;

import core.DisposableObject;

import models.interfaces.players.IPlayerInfo;

import soldiers.models.GameInfo;
import soldiers.models.game.managerPath.ManagerPath;
import soldiers.models.housesGame.base.HouseG;

public class SoldierInfo extends DisposableObject implements IDisposable
{
    private var _houseOwnerPlayer:IPlayerInfo;
    private var _houseOwnerType:String;
    private var _houseTarget:HouseG;

    private var _level:uint;
    private var _levelMax:uint;

    private var _soldierRotation:ESoldierRotation;
    private var _path:Array;

    private var _view:IView;


    /*
     * Properties
     */
    public function get houseOwnerPlayer():IPlayerInfo
    {
        return _houseOwnerPlayer;
    }

    public function get houseOwnerType():String
    {
        return _houseOwnerType;
    }

    public function get houseTarget():HouseG
    {
        return _houseTarget;
    }

    public function get level():uint
    {
        return _level;
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

    public function get view():IView
    {
        return _view;
    }

    public function set view(value:IView):void
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


    public function get levelMax():uint
    {
        return _levelMax;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function SoldierInfo(owner:HouseG, target:HouseG)
    {
        Debug.assert(owner != null);
        Debug.assert(target != null);
        Debug.assert(target != owner);

        _houseOwnerType = owner.ownerType;
        _level = owner.level;
        _levelMax = owner.houseConfig.levelMax;
        _houseTarget = target;
        _houseOwnerPlayer = owner.owner;

        var managerPath:ManagerPath = GameInfo.instance.managerGame.managerPath;

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

    public override function cleanup():void
    {
        TweenMax.killTweensOf(this);

        _path.length = 0;
        _view = null;

        super.cleanup();
    }
}
}
