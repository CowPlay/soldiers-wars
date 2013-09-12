/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/6/13
 * Time: 2:39 PM
 * To change this template use File | Settings | File Templates.
 */
package core.models.interfaces
{

public interface IManagerString
{
    //! Returns localized string for specify string type
    function localizedString(type:String):String;

    //! Returns random char for current language
    function get randomChar():String;
}
}
