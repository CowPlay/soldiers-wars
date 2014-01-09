/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/6/13
 * Time: 3:51 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.string
{
import models.implementations.string.ManagerStringBase;
import models.interfaces.social.IManagerSocial;

import soldiers.models.game.managerProgress.targets.ELevelTarget;

public class ManagerString extends ManagerStringBase
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ManagerString(managerSocial:IManagerSocial)
    {
        super(managerSocial);
    }

    protected override function initLanguageEnglish():void
    {
        super.initLanguageEnglish();

        //game
        _currentLanguage[EStringType.EST_GAME_BUTTON_FRIEND_HELP] = "Friends\nhelp";
        _currentLanguage[EStringType.EST_GAME_BUTTON_OPEN_ALL_WORDS] = "Open\nall words";
        _currentLanguage[EStringType.EST_GAME_BUTTON_OPEN_WORD] = "Open\nword";
        _currentLanguage[EStringType.EST_GAME_BUTTON_OPEN_CHAR] = "Open\nchar";

    }

    protected override function initLanguageRussian():void
    {
        super.initLanguageRussian();

        //game
        _currentLanguage[ELevelTarget.ELT_GRAB_ALL] = "Grab all. Rest:{0}";

        _currentLanguage[ELevelTarget.ELT_TARGET_NOT_GRAB] = "Not grab target {0}";
        _currentLanguage[ELevelTarget.ELT_TARGET_GRAB] = "Grab target {0}";

        _currentLanguage[ELevelTarget.ELT_OWNER_GRAB_ALL] = "Grab all {0}. Rest:{1}";
        _currentLanguage[ELevelTarget.ELT_OWNER_NOT_GRAB_ANY] = "Not grab any {0}";
        _currentLanguage[ELevelTarget.ELT_OWNER_NOT_MISSING_ANY] = "{0} not missing any";

        _currentLanguage[ELevelTarget.ELT_TIME_LIMIT] = "Time left {0}";
        _currentLanguage[ELevelTarget.ELT_TIME_PLAY] = "Need play {0}";

        _currentLanguage[ELevelTarget.ELT_NONE] = "none";

    }
}
}
