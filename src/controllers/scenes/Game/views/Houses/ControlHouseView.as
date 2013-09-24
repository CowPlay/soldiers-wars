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
package controllers.scenes.game.views.Houses
{
import controls.IControlScene;
import controls.implementations.ControlBase;

import flash.display.Sprite;
import flash.events.MouseEvent;

import models.data.houses.base.EHouseOwner;
import models.data.houses.base.HouseInfo;

import utils.memory.UtilsMemory;

public class ControlHouseView extends ControlBase
{
    /*
     * Fields
     */
    private var _entry:HouseInfo;

    private var _auraEnemy:gAuraEnemy;
    private var _auraPlayer:gAuraPlayer;

    /*
     * Properties
     */

    public function get entry():HouseInfo
    {
        return _entry;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControlHouseView(sceneOwner:IControlScene, entry:HouseInfo)
    {
        super(sceneOwner);

        Debug.assert(entry != null);

        _entry = entry;

        init();
    }

    private function init():void
    {
        setSourceView(new Sprite());

        _auraEnemy = new gAuraEnemy();
        _auraEnemy.visible = false;
        sourceView.addChild(_auraEnemy);

        _auraPlayer = new gAuraPlayer();
        _auraPlayer.visible = false;
        sourceView.addChild(_auraPlayer);

        UtilsMemory.registerEventListener(sourceView, MouseEvent.MOUSE_OVER, this, onHouseMouseOver);
        UtilsMemory.registerEventListener(sourceView, MouseEvent.MOUSE_OUT, this, onHouseMouseOut);
    }

    public override function placeViews():void
    {
        super.placeViews();

        var auraX:int = 65;
        var auraY:int = 0;

        _auraEnemy.x = _auraPlayer.x = auraX;
        _auraEnemy.y = _auraPlayer.y = auraY;
    }

    /*
     * Callbacks
     */

    public function onHouseMouseOver(e:MouseEvent):void
    {
        _auraPlayer.visible = _entry.type == EHouseOwner.EHO_PLAYER;
        _auraEnemy.visible = !_auraPlayer.visible;
    }

    public function onHouseMouseOut(e:MouseEvent):void
    {
        _auraPlayer.visible = false;
        _auraEnemy.visible = false;
    }
}
}
