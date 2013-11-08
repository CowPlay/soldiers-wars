/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/21/13
 * Time: 1:48 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.states.village
{
import controllers.IController;

import controls.IView;

import soldiers.models.states.EStateType;
import soldiers.models.states.base.StateGameBase;
import soldiers.popups.houses.bakery.ControlPopupBakery;
import soldiers.popups.houses.build.ControlPopupBuildHouse;
import soldiers.popups.merlinTower.ControlPopupMerlinTower;
import soldiers.popups.militaryAcademy.ControlPopupMilitaryAcademy;
import soldiers.popups.mineGold.ControlPopupMineGold;
import soldiers.popups.tavern.ControlPopupTavern;
import soldiers.popups.universityMM.ControlPopupUniversityMM;
import soldiers.controllers.village.ControllerVillageUI;
import soldiers.controllers.village.ControllerVillageScene;

public class StateVillage extends StateGameBase
{
    /*
     * Fields
     */
    //scene
    private var _contollerView:IController;
    private var _controllerUI:IController;


    /*
     * Properties
     */

    public override function get type():String
    {
        return EStateType.EST_VILLAGE;
    }

    /*
     * Events
     */

    public override function prepareLayerScene():void
    {
        super.prepareLayerScene();

        this.controllerScene = new ControllerVillageScene();
    }

    public override function prepareLayerUI():void
    {
        super.prepareLayerUI();

        this.controllerUI = new ControllerVillageUI();
    }

    public override function prepareLayerPopups():void
    {
        super.prepareLayerPopups();

        //TODO: implement
//        registerPopup(new ControlPopupBuildHouse());
//        registerPopup(new ControlPopupBakery());
//        registerPopup(new ControlPopupTavern());
//        registerPopup(new ControlPopupUniversityMM());
//        registerPopup(new ControlPopupMilitaryAcademy());
//        registerPopup(new ControlPopupMerlinTower());
//        registerPopup(new ControlPopupMineGold());
    }

    public override function onLoadingEnd():void
    {
        super.onLoadingEnd();

//        showPopup(EPopupType.EPT_VILLAGE_HOUSE_BAKERY);
    }

    /*
     * Methods
     */

    //! Default constructor
    public function StateVillage()
    {
    }
}
}
