
package core.socialApi
{
import core.socialApi.Info.SocialUserInfo;

import flash.display.DisplayObject;

/**
 * ...
 * @author me
 */
internal interface IMediator
{

    function IMediator();

    function getUserInfo():SocialUserInfo;

    function getUserId():String;

    function getFriendsList():Array;

    function getFlashVars():Object;

    function init(onComplete:Function, onError:Function):void;

    /**
     * Показать окно приглашения друзей
     */
    function showInviteFriendsWindow(onComplete:Function, onError:Function):void;

    /*
     * Запостить на стену
     * @param    messageId - id сообщения из НСИ
     */
    function postToWall(title:String, message:String, picUrl:String, linkUrl:String = "", ownerId:String = ""):void;

    /*
     * @param    votes - сколько голосов пользователь должен заплатить
     * @param    callBack - эта функция вызывается после оплаты, в качестве параметра true если все ок и false если голоса не заплатили
     */
    function transferVotes(money:Number, votes:Number, onComplete:Function, onError:Function):void;

    function getTotalFriends(uid:String = "", count:int = 0, offset:int = 0):void;

}

}