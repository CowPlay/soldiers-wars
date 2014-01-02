/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 10/1/13
 * Time: 12:25 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.village.housesV
{
import views.IView;
import views.implementations.ViewBase;

import flash.display.DisplayObjectContainer;

import mx.utils.StringUtil;

import soldiers.models.housesVillage.base.HouseLevelInfoV;
import soldiers.models.housesVillage.base.HouseV;

public class ControlHouseViewV extends ViewBase
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
    public function ControlHouseViewV(parent:IView, entry:HouseV, sourceViewValue:DisplayObjectContainer)
    {
        super(parent, sourceViewValue);

        Debug.assert(entry != null);
        Debug.assert(sourceViewValue != null);

        _entryBase = entry;
        _entryBase.view = this;

        for each(var levelConfig:HouseLevelInfoV in _entryBase.levelsInfo)
        {

            var levelViewName:String = StringUtil.substitute("level_{0}", levelConfig.level);
            Debug.assert(sourceViewValue.hasOwnProperty(levelViewName), StringUtil.substitute("Not found view with name: {0}", levelViewName));

            sourceViewValue[levelViewName].visible = levelConfig.level == entry.level;
        }

        init();
    }

    private function init():void
    {

    }
}
}
