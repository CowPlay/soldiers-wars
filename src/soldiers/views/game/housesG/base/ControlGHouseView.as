/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/22/13
 * Time: 9:46 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.housesG.base
{
import controllers.IController;

import controls.EControllerUpdateBase;
import controls.IView;
import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.text.TextField;

import soldiers.models.housesGame.base.EHouseOwner;
import soldiers.models.housesGame.base.HouseG;

public class ControlGHouseView extends ControlBase
{
    /*
     * Fields
     */
    protected var _sourseView:DisplayObjectContainer;
    protected var _houseView:DisplayObjectContainer;
    protected var _houseViewEnemy:DisplayObjectContainer;
    protected var _houseViewPlayer:DisplayObjectContainer;
    protected var _labelSoldiers:TextField;

    private var _entry:HouseG;

    //TODO:implement
//    private var _auraEnemy:gAuraEnemy;
//    private var _auraPlayer:gAuraPlayer;

    private var _auraPosition:Point;
    /*
     * Properties
     */

    public function get entry():HouseG
    {
        return _entry;
    }


    public function get auraPosition():Point
    {
        return _auraPosition;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControlGHouseView(controller:IController, entry:HouseG)
    {
        _sourseView = new Sprite();
        super(controller, _sourseView);

        Debug.assert(entry != null);

        _entry = entry;

        init();
    }

    private function init():void
    {
//        _auraEnemy = new gAuraEnemy();
//        _auraEnemy.visible = false;
//        _sourseViewTyped.addChild(_auraEnemy);
//
//        _auraPlayer = new gAuraPlayer();
//        _auraPlayer.visible = false;
//        _sourseViewTyped.addChild(_auraPlayer);

        _auraPosition = new Point(65, 0);
    }

    protected function setHouseView(value:DisplayObjectContainer):void
    {
        //TODO: add levels
        Debug.assert(value.hasOwnProperty("viewPlayer"));
        Debug.assert(value.hasOwnProperty("viewEnemy"));
        Debug.assert(value.hasOwnProperty("labelSoldiers"));

        value.mouseEnabled = false;

        _houseView = value;
        _houseViewEnemy = value["viewEnemy"];
        _houseViewPlayer = value["viewPlayer"];
        _labelSoldiers = value["labelSoldiers"];


        _sourseView.addChild(_houseView);

        update(EControllerUpdateBase.ECUT_ENTRY_UPDATED);
    }


    public override function placeViews(isFullscreen:Boolean):void
    {
        super.placeViews(isFullscreen);

//        _auraEnemy.x = _auraPlayer.x = _auraPosition.x;
//        _auraEnemy.y = _auraPlayer.y = _auraPosition.y;
    }

    public override function update(type:String = ""):void
    {
        switch (type)
        {
            case EControllerUpdateBase.ECUT_ENTRY_UPDATED:
            {
                _labelSoldiers.text = _entry.soldierCount.toString();

                _houseViewPlayer.visible = _entry.ownerType == EHouseOwner.EHO_PLAYER;
                _houseViewEnemy.visible = !_houseViewPlayer.visible;
//                switch (_entry.ownerType)
//                {
//                    case EHouseOwner.EHO_PLAYER:
//                    {
//                        if (_entry.isSelect)
//                        {
//                            _auraPlayer.visible = true;
//                        }
//                        break;
//                    }
//                    default :
//                    {
//                        //do nothing
//                        break;
//                    }
//                }

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
     * Callbacks
     */

    public override function onMouseOver(e:MouseEvent):void
    {
//        _auraPlayer.visible = _entry.isSelect || _entry.ownerType == EHouseOwner.EHO_PLAYER;
//        _auraEnemy.visible = !_auraPlayer.visible;

        super.onMouseOver(e);
    }

    public override function onMouseOut(e:MouseEvent):void
    {
//        _auraPlayer.visible = false;
//        _auraEnemy.visible = false;

        super.onMouseOut(e);
    }
}
}
