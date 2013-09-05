/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/3/13
 * Time: 3:59 PM
 * To change this template use File | Settings | File Templates.
 */
package core.socialApi.managers
{
import core.socialApi.*;
import core.Debug;
import core.socialApi.info.SocialUserInfo;

public class SocialManagerBase implements ISocialManager
{
    /*
     * Fields
     */
    protected var _flashVars:Object;

    protected var _friendsListAll:Array;
    protected var _friendsListInstalled:Array;
    protected var _friendsListNotInstalled:Array;

    protected var _userInfo:SocialUserInfo;

    protected var _requestsArray:Array;

    /*
     * Properties
     */

    public function get type():ESocialNetworkType
    {
        Debug.assert(false, "Please override it in derived classes");
        return null;
    }

    public function get flashVars():Object
    {
        return _flashVars;
    }

    public function get friendsListAll():Array
    {
        return _friendsListAll;
    }

    //! Returns friends which already installed app
    public function get friendsListInstalled():Array
    {
        return _friendsListInstalled;

    }

    //! Returns friends which not have install app
    public function get friendsListNotInstalled():Array
    {
        return _friendsListNotInstalled;
    }

    public function get userInfo():SocialUserInfo
    {
        return _userInfo;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function SocialManagerBase(onComplete:Function, onError:Function)
    {
        Debug.assert(onComplete != null);

        _flashVars = Main.stageValue.loaderInfo.parameters;
    }

    /*
     * Stubs
     */

    public function inviteFriends(callback:Function):void
    {
        Debug.assert(false, "Please override it in derived classes");
    }

    public function postToWall(callback:Function, text:String, urlPic:String, title:String = "", urlLink:String = ""):void
    {
        Debug.assert(false, "Please override it in derived classes");
    }

    public function transferVotes(money:Number, votes:Number, onComplete:Function, onError:Function):void
    {
        Debug.assert(false, "Please override it in derived classes");
    }
}
}
