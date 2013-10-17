/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/17/13
 * Time: 1:02 PM
 * To change this template use File | Settings | File Templates.
 */
package src
{
import controllers.scenes.game.views.Houses.HouseBaseView;
import controllers.views.BaseView;

import core.Debug;
import core.IDisposable;

import flash.geom.Point;
import flash.geom.Rectangle;

import models.Game.base.gameObjects.Soldier.Soldier;
import models.GameConstants.base.ConstantsBase;
import models.GameConstants.game.House.ConstantsHouseExitPosition;
import models.GameConstants.game.House.ConstantsHouseFoundation;
import models.GameConstants.game.House.ConstantsHouseLevel;
import models.GameConstants.game.Soldier.ConstantsSoldierDamage;
import models.GameInfo.GameInfo;
import models.GameInfo.Pathfinder.Node;

//! Base class of all house types
public class HouseBase implements IDisposable
{

    /*
     * Static functions
     */

    private static var _selectedHouses:Array = [];

    public static function get selectedHouses():Array
    {
        return _selectedHouses;
    }

    public static function clearHouseSelection():void
    {
        for each(var house:HouseBase in _selectedHouses)
        {
            if (house._ownerType != EHouseOwner.EHO_PLAYER)
                continue;

            house._view.didHousePlayerSelectionChanged(false);

            trace("clear selection");
        }

        _selectedHouses = [];
    }

    public static function selectHousePlayer(value:HouseBase):void
    {
        Debug.assert(value != null);

        if (!value.isSelect)
        {
            _selectedHouses.push(value);

            trace("select house");
        }

        //force update view
        value._view.didHousePlayerSelectionChanged(true);
    }

    /*
     * Fields
     */

    protected var _view:HouseBaseView;

    //! Represents house owner type
    protected var _ownerType:EHouseOwner;

    protected var _level:uint;
    protected var _levelMax:uint;

    //! Use Get\SetSoldierCount
    protected var _soldierCount:Number;
    protected var _soldierCountMax:uint;

    protected var _rotateLeftToRight:Boolean;
    protected var _currentPosition:Node;
    protected var _houseExitPosition:Node;
    protected var _foundation:Array;

    /*
     *  Properties
     */

    public function get isSelect():Boolean
    {
        return HouseBase.selectedHouses.indexOf(this) != ConstantsBase.INDEX_NONE;
    }

    //! Returns house view
    public function get view():HouseBaseView
    {
        return _view;
    }

    public function get type():EHouseType
    {
        Debug.assert(false);
        return null;
    }

    //! Returns soldiers count
    public function get soldierCount():Number
    {
        return _soldierCount;
    }

    protected function setSoldierCount(value:Number):void
    {
        if (_soldierCount == value)
            return;

        _soldierCount = value;

        if (_view != null)
            _view.update();
    }

    public function get soldierCountMax():int
    {
        return _soldierCountMax;
    }

    public function get ownerType():EHouseOwner
    {
        return  _ownerType;
    }

    //! Set house owner type
    protected function setOwnerType(type:EHouseOwner):void
    {
        if (_ownerType == type)
            return;

        _ownerType = type;

        _levelMax = ConstantsHouseLevel.getLevelMax(this);

        //TODO: update foundation
        //TODO: update exit position

        if (_view != null)
            _view.update();
    }


    public function get level():uint
    {
        return _level;
    }

    public function set level(value:uint):void
    {
        if (_level == value)
        {
            return;
        }

        //TODO: move to game config
        _soldierCountMax = value * 25;

        _soldierCount = _soldierCount - Math.round(_level * 25 / 2);

        _level = value;

        //TODO: update square
        //TODO: update exit position

        if (_view != null)
            _view.update();
    }

    public function setPosition(column:int, row:int):void
    {
        Debug.assert(row >= 0 && column >= 0);

        _currentPosition = GameInfo.Instance.pathfinder.getNode(column, row);

        updateHouseExitPosition();

        updateFoundation();

        if (_view != null)
            _view.update();
    }

    public function get  rotateLeftToRight():Boolean
    {
        return  _rotateLeftToRight;
    }

    public function set rotateLeftToRight(value:Boolean):void
    {
        if (_rotateLeftToRight == value)
            return;

        _rotateLeftToRight = value;

        updateHouseExitPosition();

        if (_view != null)
            _view.update();
    }


    public function get currentPosition():Node
    {
        return _currentPosition;
    }

    public function get houseExitPosition():Node
    {
        return _houseExitPosition;
    }


    public function get foundation():Array
    {
        return _foundation;
    }

    private function setFoundation(value:Array):void
    {
        Debug.assert(value != null);

        if (_foundation == value)
        {
            return;
        }

        var node:Node = null;

        if (_foundation)
        {
            for each(node in _foundation)
            {
                if (node == _houseExitPosition)
                    continue;

                node.traversable = true;
            }
        }

        _foundation = value;

        if (_foundation)
        {
            for each(node in _foundation)
            {
                if (node == _houseExitPosition)
                    continue;

                node.traversable = false;
            }
        }
    }

    public function get readyToUpdate():Boolean
    {
        return ((_level < _levelMax) && (_soldierCount >= _soldierCountMax));
    }

    /*
     * Events
     */

    public function didLevelUp():void
    {
        Debug.assert(this.readyToUpdate);

        this.level++;
    }

    public function didSoldierComeHouse(soldier:Soldier):void
    {
        //review formula for calculate damage
        //TODO: review
        var damage:Number = soldier.type == this.ownerType ? 1 : -soldier.damage / ConstantsSoldierDamage.getNormalSoldierDamage(_ownerType);

        setSoldierCount(_soldierCount + damage);

        if (_soldierCount <= 0)
        {
            setSoldierCount(0);
            setOwnerType(soldier.type);
        }

        _view.didAttackOrHeal(damage);
    }

    //TODO: add count parameter
    public function didSoldierLeaveHouse():void
    {
        setSoldierCount(_soldierCount - 1);
    }

    //! Must call when MOUSE_UP event was fire.
    public function didMouseUp():void
    {
        if (_selectedHouses.length == 0)
            return;

        if (BaseView.viewHovered != null
                && BaseView.viewSelected != null
                && BaseView.viewHovered is HouseBaseView
                && BaseView.viewSelected is HouseBaseView)
        {
            var houseHovered:HouseBase = (BaseView.viewHovered as HouseBaseView).owner;

            //generate from all selected houses
            for each(var houseSelected:HouseBase in _selectedHouses)
            {
                if (houseHovered == houseSelected)
                    continue;

                GameInfo.Instance.soldierGenerator.generateSoldiers(houseSelected, houseHovered);
            }
        }

        clearHouseSelection();
    }

    /*
     * Methods
     */

    //! Default constructor for house
    //! If owner type == null -> type = neutral
    public function HouseBase(soldiersCount:int, ownerType:EHouseOwner = null)
    {
        ownerType = ownerType == null ? EHouseOwner.EHO_NEUTRAL : ownerType;

        _rotateLeftToRight = true;

        _level = 1;

        _soldierCountMax = 25;

        _soldierCount = soldiersCount;

        setOwnerType(ownerType);
    }

    public function initView():void
    {
        Debug.assert(_view == null);

        _view = new HouseBaseView(this);
    }

    public function removeView():void
    {
        Debug.assert(_view != null);

        _view.cleanup();
        _view = null;
    }


    private function updateHouseExitPosition():void
    {
        var houseExitPositionOffset:Point = ConstantsHouseExitPosition.getHouseExitPosition(this);

        if (!_rotateLeftToRight)
        {
            houseExitPositionOffset = new Point(-houseExitPositionOffset.y, -houseExitPositionOffset.x);
        }

        _houseExitPosition = GameInfo.Instance.pathfinder.getNode(_currentPosition.column + houseExitPositionOffset.x,
                _currentPosition.row + houseExitPositionOffset.y);

        _houseExitPosition.traversable = true;
    }

    //! Returns square of specify house
    private function updateFoundation():void
    {
        var squareFrame:Rectangle = ConstantsHouseFoundation.getHouseFoundation(this);

        var squareValue:Array = [];

        for (var currentRow:int = _currentPosition.row + squareFrame.y; currentRow < _currentPosition.row + squareFrame.height + squareFrame.y; currentRow++)
        {
            for (var currentColumn:int = _currentPosition.column + squareFrame.x; currentColumn < _currentPosition.column + squareFrame.width + squareFrame.x; currentColumn++)
            {
                var fundamentalNode:Node = GameInfo.Instance.pathfinder.getNode(currentColumn, currentRow);
                squareValue.push(fundamentalNode);
            }
        }

        setFoundation(squareValue);
    }

    public function magnetizeFromTargetHouse(targetHouse:HouseBase):void
    {
        _view.magnetizeFromTargetHouse(targetHouse);
    }


    /*
     * IDisposable
     */
    public function cleanup():void
    {
        super.cleanup();
    }
}
}
