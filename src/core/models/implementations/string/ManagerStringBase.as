/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/6/13
 * Time: 2:48 PM
 * To change this template use File | Settings | File Templates.
 */
package core.models.implementations.string
{
import core.Debug;
import core.models.GameInfoBase;
import core.models.interfaces.ELanguageType;
import core.models.interfaces.IManagerString;
import core.utils.Utils;

import flash.utils.Dictionary;

import models.GameInfo;

public class ManagerStringBase implements IManagerString
{
    /*
     * Static fields
     */
    //key - ELanguageType, value - char array
    private static var _alphabets:Dictionary = createAlphabets();

    /*
     * Static methods
     */

    private static function createAlphabets():Dictionary
    {
        var result:Dictionary = new Dictionary();

        result[ELanguageType.ELT_ENGLISH] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
        result[ELanguageType.ELT_RUSSIAN] = ["А", "Б", "В", "Г", "Д", "Е", "Ж", "З", "И", "Й", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ч", "Ш", "Щ", "Ъ", "Ы", "Ь", "Э", "Ю", "Я" ];

        return result;
    }

    /*
     * Fields
     */
    protected var _languages:Dictionary;
    protected var _currentLanguage:Dictionary;
    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ManagerStringBase()
    {
        _languages = new Dictionary();
    }

    /*
     * IManagerString
     */

    public function localizedString(type:String):String
    {
        var result:String = null;

        if (_currentLanguage == null)
            _currentLanguage = _languages[GameInfo.Instance.managerSocial.currentLanguage];

        result = _currentLanguage[type];

        Debug.assert(result != null);

        return result;
    }

    public function get randomChar():String
    {
        var result:String = null;

        var alphabet:Array = _alphabets[GameInfoBase.Instance.managerSocial.currentLanguage];

        result = alphabet[Utils.randomFromTo(0, alphabet.length - 1)];

        return result;
    }
}
}
