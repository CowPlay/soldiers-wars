/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/1/13
 * Time: 12:25 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.scenes.village.views.housesV
{
import controls.IControlScene;
import controls.implementations.ControlBase;

import flash.display.DisplayObjectContainer;

import mx.utils.StringUtil;

import soldiers.models.housesVillage.base.HouseConfigV;
import soldiers.models.housesVillage.base.HouseV;

public class ControlHouseViewV extends ControlBase
{
    /*
     * Fields
     */
    private var _entryBase:HouseV;

    /*
     * Properties
     */

    public function get entryBase():HouseV
    {
        return _entryBase;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function ControlHouseViewV(sceneOwner:IControlScene, entry:HouseV, sourceViewValue:DisplayObjectContainer)
    {
        super(sceneOwner);

        Debug.assert(entry != null);
        Debug.assert(sourceViewValue != null);

        _entryBase = entry;
        _entryBase.view = this;

        for each(var levelConfig:HouseConfigV in _entryBase.configs)
        {
            var levelViewName:String = StringUtil.substitute("level_{0}", levelConfig.level);
            Debug.assert(sourceViewValue.hasOwnProperty(levelViewName));

            sourceViewValue[levelViewName].visible = levelConfig.level == entry.level;
        }

        setSourceView(sourceViewValue);

        init();
    }

    private function init():void
    {

    }
}
}
