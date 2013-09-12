/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/5/13
 * Time: 2:58 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.popups.houseVillage
{
import core.Debug;
import core.controls.IControlScene;
import core.controls.implementations.ControlBase;

public class ControlHousePopupHeaderRow extends ControlBase
{
    /*
     * Fields
     */

//    private var _arrayTabs

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlHousePopupHeaderRow(sceneOwner:IControlScene, countTabs:uint)
    {
        super(sceneOwner);

        Debug.assert(countTabs > 0);

        init(countTabs);
    }

    private function init(countTabs:uint):void
    {
        for (var i:uint = 0; i < countTabs; i++)
        {
            var tabActive:gTabHeaderActive = new gTabHeaderActive();

            tabActive.x = i * 50;

            addChild(tabActive);
        }
    }
}
}
