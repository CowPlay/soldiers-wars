/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 12/25/13
 * Time: 3:25 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerAi.aiActions
{
import soldiers.models.game.ManagerGame;
import soldiers.models.game.managerAi.aiActions.attack.AiActionAttack0;
import soldiers.models.game.managerAi.aiActions.attack.AiActionAttack1;
import soldiers.models.game.managerAi.aiActions.defence.AiActionDeffense0;
import soldiers.models.game.managerAi.aiActions.upgrade.AiActionUpgrade0;
import soldiers.models.housesGame.base.HouseG;

public class FactoryAiActions
{
    public static function getAction(data:Object, houseOwner:HouseG, managerGame:ManagerGame):IAiAction
    {
        var result:IAiAction = null;

        Debug.assert(data != null);
        Debug.assert(data.hasOwnProperty("type"));

        var actionClass:Class = null;

        switch (data["type"])
        {
            case EAiAction.EAS_ATTACK_0:
            {
                actionClass = AiActionAttack0;
                break;
            }
            case EAiAction.EAS_ATTACK_1:
            {
                actionClass = AiActionAttack1;
                break;
            }
            case EAiAction.EAS_DEFENSE_0:
            {
                actionClass = AiActionDeffense0;
                break;
            }
            case EAiAction.EAS_UPGRADE_0:
            {
                actionClass = AiActionUpgrade0;
                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }

        result = new actionClass(houseOwner, managerGame);
        result.deserialize(data);

        return result;
    }

    //! Default constructor
    public function FactoryAiActions()
    {
        Debug.assert(false, "Please don't use instance of FactoryAiActions. Use static methods instead.")

    }

}
}
