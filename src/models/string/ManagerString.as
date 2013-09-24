/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/6/13
 * Time: 3:51 PM
 * To change this template use File | Settings | File Templates.
 */
package models.string
{
import flash.utils.Dictionary;

import models.implementations.string.ManagerStringBase;
import models.interfaces.ELanguageType;

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
    public function ManagerString()
    {
        init();
    }

    private function init():void
    {
        initLanguageEnglish();
        initLanguageRussian();
    }

    private function initLanguageEnglish():void
    {
        var languageRus:Dictionary = new Dictionary();

        //game
        languageRus[EStringType.EST_GAME_BUTTON_FRIEND_HELP] = "Friends\nhelp";
        languageRus[EStringType.EST_GAME_BUTTON_OPEN_ALL_WORDS] = "Open\nall words";
        languageRus[EStringType.EST_GAME_BUTTON_OPEN_WORD] = "Open\nword";
        languageRus[EStringType.EST_GAME_BUTTON_OPEN_CHAR] = "Open\nchar";

        //popup bank
        languageRus[EStringType.EST_POPUP_BANK_TITLE] = "Buy coins";
        languageRus[EStringType.EST_POPUP_BANK_BUTTON_BUY] = "Buy";

        //popup no coins
        languageRus[EStringType.EST_POPUP_NO_COINS_TITLE] = "No coins";
        languageRus[EStringType.EST_POPUP_NO_COINS_TEXT0] = "Sorry";
        languageRus[EStringType.EST_POPUP_NO_COINS_TEXT1] = "Not\nenough\ncoins";
        languageRus[EStringType.EST_POPUP_NO_COINS_BUTTON_BUY] = "Buy";

        //popup no stars
        languageRus[EStringType.EST_POPUP_NO_STARS_TITLE] = "No stars";
        languageRus[EStringType.EST_POPUP_NO_STARS_TEXT0] = "Sorry";
        languageRus[EStringType.EST_POPUP_NO_STARS_TEXT1] = "Not\nenough\nstars";

        //popup bonus
        languageRus[EStringType.EST_POPUP_BONUS_TITLE] = "Daily bonus";
        languageRus[EStringType.EST_POPUP_BONUS_TEXT] = "Get presents!";
        languageRus[EStringType.EST_POPUP_BONUS_BUTTON_CLAIM] = "CLAIM";
        languageRus[EStringType.EST_POPUP_BONUS_ITEM_TITLE] = "day";
        languageRus[EStringType.EST_POPUP_BONUS_ITEM_REWARD] = "coins";

        //popup players top
        languageRus[EStringType.EST_POPUP_PLAYERS_TOP_TITLE] = "Players top";
        languageRus[EStringType.EST_POPUP_PLAYERS_TOP_TEXT_FORMAT] = "Your place is {0}";
        languageRus[EStringType.EST_POPUP_PLAYERS_TOP_ITEM_TITLE_FORMAT] = "{0}";

        _languages[ELanguageType.ELT_ENGLISH] = languageRus;
    }

    private function initLanguageRussian():void
    {
        var languageRus:Dictionary = new Dictionary();

        //game
        languageRus[EStringType.EST_GAME_BUTTON_FRIEND_HELP] = "Помощь\nдруга";
        languageRus[EStringType.EST_GAME_BUTTON_OPEN_ALL_WORDS] = "Открыть\nслова";
        languageRus[EStringType.EST_GAME_BUTTON_OPEN_WORD] = "Открыть\nслово";
        languageRus[EStringType.EST_GAME_BUTTON_OPEN_CHAR] = "Открыть\nбукву";

        //popup bank
        languageRus[EStringType.EST_POPUP_BANK_TITLE] = "Купить монет";
        languageRus[EStringType.EST_POPUP_BANK_BUTTON_BUY] = "Купить";

        //popup no coins
        languageRus[EStringType.EST_POPUP_NO_COINS_TITLE] = "Недостаточно монет";
        languageRus[EStringType.EST_POPUP_NO_COINS_TEXT0] = "Внимание!";
        languageRus[EStringType.EST_POPUP_NO_COINS_TEXT1] = "У Вас недостаточно монет\nдля осуществления\nданной покупки";
        languageRus[EStringType.EST_POPUP_NO_COINS_BUTTON_BUY] = "Пополнить";

        //popup no stars
        languageRus[EStringType.EST_POPUP_NO_STARS_TITLE] = "Недостаточно звезд";
        languageRus[EStringType.EST_POPUP_NO_STARS_TEXT0] = "Внимание!";
        languageRus[EStringType.EST_POPUP_NO_STARS_TEXT1] = "У Вас недостаточно звезд\nдля открытия этого\nкроссворда.";

        //popup bonus
        languageRus[EStringType.EST_POPUP_BONUS_TITLE] = "Ежедневный бонус";
        languageRus[EStringType.EST_POPUP_BONUS_TEXT] = "Заходи в игру 5 дней подряд\nи получай подарки!";
        languageRus[EStringType.EST_POPUP_BONUS_BUTTON_CLAIM] = "Забрать награду";
        languageRus[EStringType.EST_POPUP_BONUS_ITEM_TITLE] = "день";
        languageRus[EStringType.EST_POPUP_BONUS_ITEM_REWARD] = "монет";

        //popup players top
        languageRus[EStringType.EST_POPUP_PLAYERS_TOP_TITLE] = "Топ игроков";
        languageRus[EStringType.EST_POPUP_PLAYERS_TOP_TEXT_FORMAT] = "Вы на {0} месте";
        languageRus[EStringType.EST_POPUP_PLAYERS_TOP_ITEM_TITLE_FORMAT] = "{0} место";

        _languages[ELanguageType.ELT_RUSSIAN] = languageRus;
    }
}
}
