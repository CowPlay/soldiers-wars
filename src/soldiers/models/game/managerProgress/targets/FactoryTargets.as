/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/24/13
 * Time: 3:15 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerProgress.targets
{
import soldiers.models.game.managerProgress.targets.base.LTBase;
import soldiers.models.game.managerProgress.targets.grab.LTGrab;
import soldiers.models.game.managerProgress.targets.grab.LTGrabAll;
import soldiers.models.game.managerProgress.targets.other.LTNone;

public class FactoryTargets
{
    public static function getTarget(targetData:Object):LTBase
    {
        Debug.assert(targetData != null);

        var targetType:Object = targetData["type"];

        var classTarget:Class = null;

        switch (targetType)
        {
            case ELevelTarget.ELT_NONE:
            {
                classTarget = LTNone;

                break
            }

            case ELevelTarget.ELT_GRAB_ALL:
            {
                classTarget = LTGrabAll;
                break;
            }

            case ELevelTarget.ELT_GRAB:
            {
                classTarget = LTGrab;
                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }

        }

        var result:LTBase = new classTarget();
        result.deserialize(targetData);

        return result;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function FactoryTargets()
    {
        Debug.assert(false, "Please don't use instance of FactoryTargets. Use static methods instead.")
    }

}
}
