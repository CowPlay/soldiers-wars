/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/21/13
 * Time: 1:48 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.states.village
{
import controllers.IController;

import views.IView;

import flashx.textLayout.factory.StringTextLineFactory;

import soldiers.controllers.popups.houses.build.ControllerPopupBuildHouse;
import soldiers.controllers.popups.houses.bakery.ControllerPopupBakery;
import soldiers.controllers.popups.houses.tavern.ControllerPopupTavern;
import soldiers.popups.EPopupType;

import soldiers.states.EStateType;
import soldiers.states.base.StateGameBase;
import soldiers.views.popups.houses.bakery.ViewPopupBakery;
import soldiers.views.popups.houses.build.ViewPopupBuildHouse;
import soldiers.popups.merlinTower.ControlPopupMerlinTower;
import soldiers.popups.militaryAcademy.ControlPopupMilitaryAcademy;
import soldiers.popups.mineGold.ControlPopupMineGold;
import soldiers.views.popups.houses.tavern.ViewPopupTavern;
import soldiers.popups.universityMM.ControlPopupUniversityMM;
import soldiers.controllers.village.ControllerVillageUI;
import soldiers.controllers.village.ControllerVillageScene;

public class StateVillage extends StateGameBase
{
    /*
     * Fields
     */

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

        registerPopup(new ControllerPopupBuildHouse());
        registerPopup(new ControllerPopupBakery());
        registerPopup(new ControllerPopupTavern());
//        registerPopup(new ControlPopupUniversityMM());
//        registerPopup(new ControlPopupMilitaryAcademy());
//        registerPopup(new ControlPopupMerlinTower());
//        registerPopup(new ControlPopupMineGold());
    }

    public override function onLoadingEnd():void
    {
        super.onLoadingEnd();
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
