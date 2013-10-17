/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/21/13
 * Time: 1:48 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.village
{
import controllers.EPopupType;
import controllers.ESceneType;
import controllers.popups.houseVillage.ControlPopupHouse;
import controllers.scenes.base.ControlSceneGameBase;
import controllers.scenes.village.views.ControlSceneVillageUI;
import controllers.scenes.village.views.ControlSceneVillageView;

import controls.IControl;

import flash.events.MouseEvent;

import models.GameInfo;

import utils.Utils;

public class ControlSceneVillage extends ControlSceneGameBase
{
    /*
     * Fields
     */
    //scene
    private var _sceneView:IControl;
    private var _uiView:IControl;





    /*
     * Properties
     */

    public override function get type():String
    {
        return ESceneType.EST_VILLAGE;
    }

    /*
     * Events
     */

    public override function prepareLayerScene():void
    {
        super.prepareLayerScene();

        _sceneView = new ControlSceneVillageView(this);
        registerControlScene(_sceneView);
    }

    public override function prepareLayerUI():void
    {
        super.prepareLayerUI();

        _uiView = new ControlSceneVillageUI(sceneOwner);
        registerControlUI(_uiView);
    }

    public override function prepareLayerPopups():void
    {
        super.prepareLayerPopups();

//        registerControlPopup(new ControlPopupHouse(this));
    }

    public function onClick(e:MouseEvent):void
    {
        if (sceneOwner.currentPopup == null)
        {
            showPopup(EPopupType.EPT_VILLAGE_HOUSE);
        }
        else
        {
            hidePopup();
        }
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControlSceneVillage()
    {
    }
}
}
