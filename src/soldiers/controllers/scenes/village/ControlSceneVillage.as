/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/21/13
 * Time: 1:48 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.scenes.village
{
import controls.IControl;

import flash.events.MouseEvent;

import soldiers.controllers.EPopupType;
import soldiers.controllers.ESceneType;
import soldiers.controllers.popups.MilitaryAcademy.ControlPopupMilitaryAcademy;
import soldiers.controllers.popups.houses.bakery.ControlPopupBakery;
import soldiers.controllers.popups.houses.build.ControlPopupBuildHouse;
import soldiers.controllers.popups.tavern.ControlPopupTavern;
import soldiers.controllers.popups.universityMM.ControlPopupUniversityMM;
import soldiers.controllers.scenes.base.ControlSceneGameBase;
import soldiers.controllers.scenes.village.views.ControlSceneVillageUI;
import soldiers.controllers.scenes.village.views.ControlSceneVillageView;

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

        registerControlPopup(new ControlPopupBuildHouse(this));
        registerControlPopup(new ControlPopupBakery(this));
        registerControlPopup(new ControlPopupTavern(this));
        registerControlPopup(new ControlPopupUniversityMM(this));
        registerControlPopup(new ControlPopupMilitaryAcademy(this));
    }

    public override function onLoadingEnd():void
    {
        super.onLoadingEnd();

        showPopup(EPopupType.EPT_VILLAGE_HOUSE_MILITARYACADEMY);
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
