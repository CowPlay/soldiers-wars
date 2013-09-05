package core.socialApi.managers
{
import core.socialApi.*;
import core.socialApi.info.SocialUserInfo;

/**
 * ...
 * @author me
 */
public interface ISocialManager
{

    /*
     * Properties
     */

    //! Returns current social network type
    function get type():ESocialNetworkType;

    //! Returns application flash vars
    function get flashVars():Object;

    //! Returns all friends
    function get friendsListAll():Array;

    //! Returns friends which already installed app
    function get friendsListInstalled():Array;

    //! Returns friends which not have install app
    function get friendsListNotInstalled():Array;

    function get userInfo():SocialUserInfo;

    /*
     * Methods
     */

    //! Default constructor
    function ISocialManager(onComplete:Function, onError:Function);

    function inviteFriends(callback:Function):void;

    //! @param    messageId - id сообщения из НСИ
    function postToWall(callback:Function, text:String, urlPic:String, title:String = "", urlLink:String = ""):void;

    //! @param    votes - сколько голосов пользователь должен заплатить
    //! @param    callBack - эта функция вызывается после оплаты, в качестве параметра true если все ок и false если голоса не заплатили
    function transferVotes(money:Number, votes:Number, onComplete:Function, onError:Function):void;
}

}