/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 11/13/13
 * Time: 5:29 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.game.houses
{
import controllers.implementations.Controller;

import flash.events.MouseEvent;

import soldiers.GameInfo;
import soldiers.controllers.EControllerUpdate;
import soldiers.models.game.ManagerGame;
import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;
import soldiers.views.game.houses.ViewHouseG;

import views.IView;

public class ControllerHouseG extends Controller
{
    /*
     * Fields
     */
    private var _entry:HouseG;
    private var _view:ViewHouseG;

    private var _managerGame:ManagerGame;

    private var _enableSelection:Boolean;

    /*
     * Properties
     */

    public function get entry():HouseG
    {
        return _entry;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControllerHouseG(entry:HouseG)
    {
        _entry = entry;
        Debug.assert(_entry != null);

        _view = new ViewHouseG(this, entry);
        super(_view);

        init();
    }

    private function init():void
    {
        _managerGame = GameInfo.instance.managerGame;

        update(EControllerUpdate.ECU_HOUSE_OWNER_CHANGED);
        update(EControllerUpdate.ECU_HOUSE_SOLDIERS_CHANGED);
        update(EControllerUpdate.ECU_HOUSE_LEVEL_CHANGED);

        _enableSelection = true;
//        update(EControllerUpdateBase.ECUT_ENTRY_UPDATED);
    }

    public override function update(type:String):void
    {
        switch (type)
        {
            case EControllerUpdate.ECU_HOUSE_OWNER_CHANGED:
            {
                _view.houseViewPlayer.visible = _entry.ownerType == EHouseOwner.EHO_PLAYER;
                _view.houseViewEnemy.visible = !_view.houseViewPlayer.visible;

                updateIconLevelUp();

                GameInfo.instance.managerGame.onHouseOwnerChanged();

                break;
            }
            case EControllerUpdate.ECU_HOUSE_SOLDIERS_CHANGED:
            {
                _view.labelSoldiers.text = _entry.soldierCount.toString();

                updateIconLevelUp();

                break;
            }
            case EControllerUpdate.ECU_HOUSE_LEVEL_CHANGED:
            {
                _view.setLevel(_entry.level, _entry.houseConfig.levelMax);

                updateIconLevelUp();

                break;
            }

            default :
            {
                Debug.assert(false);
                break;
            }
        }
    }

    private function updateIconLevelUp():void
    {
        if (_entry.ownerType == EHouseOwner.EHO_PLAYER)
        {
            if (_entry.canLevelUpgrade)
            {
                _view.viewIconLevelUp.show();
            }
            else
            {
                _view.viewIconLevelUp.hide();
            }
        }
        else
        {
            _view.viewIconLevelUp.hide();
        }
    }

    public override function onViewMouseOver(view:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewMouseOver(view, e);

        switch (view)
        {
            case _view:
            {
                if (entry.ownerType == EHouseOwner.EHO_PLAYER)
                {
                    _view.viewAuraPlayer.visible = true;
                }
                else
                {
                    _view.viewAuraEnemy.visible = true;
                }

                result = true;

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

    public override function onViewClicked(view:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewClicked(view, e);

        if (!result)
        {
            switch (view)
            {
                case _view.viewIconLevelUp:
                {
                    _entry.levelUpgrade();

                    break;
                }
                case _view:
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

        return result;
    }


    public override function onViewMouseDown(view:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewMouseDown(view, e);

        if (!result)
        {
            switch (view)
            {
                case _view.viewIconLevelUp:
                {
                    //do nothing
                    _enableSelection = false;

                    break;
                }
                case _view:
                {
                    if (entry.ownerType == EHouseOwner.EHO_PLAYER && _enableSelection)
                    {
                        _managerGame.onPlayerSelectHouse(_managerGame.gameOwner, entry);
                    }


                    result = true;

                    break;
                }
                default :
                {
                    Debug.assert(false);
                    break;
                }
            }
        }

        return result;
    }

    public override function onViewMouseUp(target:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewMouseUp(target, e);

        _enableSelection = true;

        if (!result)
        {
            if (!result)
            {
                switch (view)
                {
                    case _view:
                    {
                        if (_managerGame.isAnyHouseSelected(_managerGame.gameOwner))
                        {
                            _managerGame.onPlayerGenerateSoldiers(_managerGame.gameOwner, entry);
                        }

                        result = true;
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

        return result;
    }

    public override function onViewMouseUpOut(v:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewMouseUp(v, e);

        _enableSelection = true;

        if (!result)
        {
            _view.viewAuraPlayer.visible = false;
            _view.viewAuraEnemy.visible = false;

            _managerGame.clearHousesSelection(GameInfo.instance.managerGame.gameOwner);

        }

        return result;
    }

    public override function onViewMouseOut(v:IView, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onViewMouseUp(v, e);

        if (!result)
        {
            if (entry.ownerType == EHouseOwner.EHO_PLAYER)
            {
                if (_managerGame.isAnyHouseSelected(_managerGame.gameOwner) && !entry.isSelect)
                {
                    _managerGame.onPlayerSelectHouse(_managerGame.gameOwner, entry);
                }

                _view.viewAuraPlayer.visible = _entry.isSelect;
            }
            else
            {
                _view.viewAuraEnemy.visible = false;
            }
        }

        return result;
    }
}
}
