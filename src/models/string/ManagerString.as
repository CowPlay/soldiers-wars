/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/6/13
 * Time: 3:51 PM
 * To change this template use File | Settings | File Templates.
 */
package models.string
{
import models.implementations.string.ManagerStringBase;
import models.interfaces.social.IManagerSocial;

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

        //popup bank
        _currentLanguage[EStringType.EST_POPUP_BANK_TITLE] = "Buy coins";
        _currentLanguage[EStringType.EST_POPUP_BANK_BUTTON_BUY] = "Buy";

        //popup no coins
        _currentLanguage[EStringType.EST_POPUP_NO_COINS_TITLE] = "No coins";
        _currentLanguage[EStringType.EST_POPUP_NO_COINS_TEXT0] = "Sorry";
        _currentLanguage[EStringType.EST_POPUP_NO_COINS_TEXT1] = "Not\nenough\ncoins";
        _currentLanguage[EStringType.EST_POPUP_NO_COINS_BUTTON_BUY] = "Buy";

        //popup no stars
        _currentLanguage[EStringType.EST_POPUP_NO_STARS_TITLE] = "No stars";
        _currentLanguage[EStringType.EST_POPUP_NO_STARS_TEXT0] = "Sorry";
        _currentLanguage[EStringType.EST_POPUP_NO_STARS_TEXT1] = "Not\nenough\nstars";

        //popup bonus
        _currentLanguage[EStringType.EST_POPUP_BONUS_TITLE] = "Daily bonus";
        _currentLanguage[EStringType.EST_POPUP_BONUS_TEXT] = "Get presents!";
        _currentLanguage[EStringType.EST_POPUP_BONUS_BUTTON_CLAIM] = "CLAIM";
        _currentLanguage[EStringType.EST_POPUP_BONUS_ITEM_TITLE] = "day";
        _currentLanguage[EStringType.EST_POPUP_BONUS_ITEM_REWARD] = "coins";

        //popup players top
        _currentLanguage[EStringType.EST_POPUP_PLAYERS_TOP_TITLE] = "Players top";
        _currentLanguage[EStringType.EST_POPUP_PLAYERS_TOP_TEXT_FORMAT] = "Your place is {0}";
        _currentLanguage[EStringType.EST_POPUP_PLAYERS_TOP_ITEM_TITLE_FORMAT] = "{0}";
    }

    protected override function initLanguageRussian():void
    {
        super.initLanguageRussian();

        //game
        _currentLanguage[EStringType.EST_GAME_BUTTON_FRIEND_HELP] = "Помощь\nдруга";
        _currentLanguage[EStringType.EST_GAME_BUTTON_OPEN_ALL_WORDS] = "Открыть\nслова";
        _currentLanguage[EStringType.EST_GAME_BUTTON_OPEN_WORD] = "Открыть\nслово";
        _currentLanguage[EStringType.EST_GAME_BUTTON_OPEN_CHAR] = "Открыть\nбукву";

        //popup bank
        _currentLanguage[EStringType.EST_POPUP_BANK_TITLE] = "Купить монет";
        _currentLanguage[EStringType.EST_POPUP_BANK_BUTTON_BUY] = "Купить";

        //popup no coins
        _currentLanguage[EStringType.EST_POPUP_NO_COINS_TITLE] = "Недостаточно монет";
        _currentLanguage[EStringType.EST_POPUP_NO_COINS_TEXT0] = "Внимание!";
        _currentLanguage[EStringType.EST_POPUP_NO_COINS_TEXT1] = "У Вас недостаточно монет\nдля осуществления\nданной покупки";
        _currentLanguage[EStringType.EST_POPUP_NO_COINS_BUTTON_BUY] = "Пополнить";

        //popup no stars
        _currentLanguage[EStringType.EST_POPUP_NO_STARS_TITLE] = "Недостаточно звезд";
        _currentLanguage[EStringType.EST_POPUP_NO_STARS_TEXT0] = "Внимание!";
        _currentLanguage[EStringType.EST_POPUP_NO_STARS_TEXT1] = "У Вас недостаточно звезд\nдля открытия этого\nкроссворда.";

        //popup bonus
        _currentLanguage[EStringType.EST_POPUP_BONUS_TITLE] = "Ежедневный бонус";
        _currentLanguage[EStringType.EST_POPUP_BONUS_TEXT] = "Заходи в игру 5 дней подряд\nи получай подарки!";
        _currentLanguage[EStringType.EST_POPUP_BONUS_BUTTON_CLAIM] = "Забрать награду";
        _currentLanguage[EStringType.EST_POPUP_BONUS_ITEM_TITLE] = "день";
        _currentLanguage[EStringType.EST_POPUP_BONUS_ITEM_REWARD] = "монет";

        //popup players top
        _currentLanguage[EStringType.EST_POPUP_PLAYERS_TOP_TITLE] = "Топ игроков";
        _currentLanguage[EStringType.EST_POPUP_PLAYERS_TOP_TEXT_FORMAT] = "Вы на {0} месте";
        _currentLanguage[EStringType.EST_POPUP_PLAYERS_TOP_ITEM_TITLE_FORMAT] = "{0} место";
    }
}
}
