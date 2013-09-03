package core.socialApi
{
import com.facebook.graph.Facebook;

import core.socialApi.Info.SocialUserInfo;

import flash.events.TimerEvent;
import flash.utils.Timer;

import models.gameInfo.GameInfo;

import mx.utils.StringUtil;

/**
 * ...
 * @author me
 */
public class FBMediator implements IMediator
{
    private const APP_ID:String = "341522739302403";

    private var _callback:Function;
    private var _callbackError:Function;
    private var _flashVars:Object;

    private var _userInfo:SocialUserInfo;
    private var _friendsList:Array;
    private var _userId:String;

    private var _apiConnector:SocialNetworkManager;

    private var _timerLogin:Timer;
    private var _needLoginAgain:Boolean;

    public function FBMediator()
    {

    }

    public function init(completeCallback:Function, errorCallback:Function):void
    {
        _apiConnector = GameInfo.Instance.socialManager;
        _callback = completeCallback;
        _callbackError = errorCallback;

        Facebook.init(APP_ID, onInitComplete);
    }

    private function onInitComplete(response:Object, fail:Object):void
    {

        if (response)
        { //already logged in because of existing session

            getMyInfo();
        }
        else
        {

//                var options:Object = {perms:"publish_stream"};

            _needLoginAgain = true;

            _timerLogin = new Timer(1000);
            _timerLogin.addEventListener(TimerEvent.TIMER, tryLogin);
            _timerLogin.start();
        }
    }

    private function tryLogin(e:TimerEvent):void
    {
        if (!_needLoginAgain)
            return;

        _needLoginAgain = false;

        Facebook.login(onLoginComplete, null);
    }

    private function onLoginComplete(response:Object, fail:Object):void
    {

        if (response)
        {

            _needLoginAgain = false;

            _timerLogin.stop();
            _timerLogin.removeEventListener(TimerEvent.TIMER, tryLogin);
            _timerLogin = null;

            getMyInfo();
        }
        else
        {
            _needLoginAgain = true;

        }
    }

    private function getMyInfo():void
    {
        Facebook.api('/me', onMyInfoComplete, {fields: "id, first_name, last_name, picture"});
    }


    private function onMyInfoComplete(response:Object, fail:Object):void
    {

        if (!response || !(response is Object))
        {
            callErrorFunction();
            return;
        }

        _userInfo = parseUserInfo(response);

        if (!_userInfo)
        {
            callErrorFunction();
            return;
        }

        _userId = _userInfo.id;


        {//get friends info
            Facebook.api('/me/friends', onFriendsInfoComplete, {fields: "id, first_name, last_name, picture, installed"});
        }
    }

    private function onFriendsInfoComplete(response:Object, fail:Object):void
    {
        var list:Array;


        list = parseFriendsInfo(response as Object);

        if (!list)
        {
            callErrorFunction();
            return;
        }

        _friendsList = [];

        for (var i:int = 0; i < list.length; i++)
        {
            if ((list[i] as SocialUserInfo).installed)
                _friendsList.push(list[i]);

            list[i].loadPicture();
        }

        _friendsList = _friendsList.slice(0, 100);

        callCompleteFunction();
    }

    private function parseFriendsInfo(friendsInfoObj:Object):Array
    {
        var result:Array = null;

        if (!friendsInfoObj || !(friendsInfoObj is Array))
            return result;

        var friendsInfo:Array = friendsInfoObj as Array;

        result = [];

        for (var i:int = 0; i < friendsInfo.length; i++)
            result.push(parseUserInfo(friendsInfo[i]));

        return result;
    }


    private static function parseUserInfo(info:Object):SocialUserInfo
    {
        var result:SocialUserInfo = null;

        if (info)
        {
            result = new SocialUserInfo();
            result.firstName = info.first_name as String;
            result.id = info.id as String;
            result.lastName = info.last_name as String;
            result.picUrl = info.picture ? (info.picture.data ? info.picture.data.url as String : null) : null;
            result.installed = info.installed ? true : false;
        }

        return result;
    }

    private function callCompleteFunction():void
    {
        if (_callback != null)
            _callback();
    }

    private function callErrorFunction():void
    {
        if (_callbackError != null)
            _callbackError();
    }

    public function getFriendsList():Array
    {
        return _friendsList;
    }

    public function getUserId():String
    {
        return _userId;
    }

    public function getUserInfo():SocialUserInfo
    {
        return _userInfo;
    }

    public function getFlashVars():Object
    {
        return _flashVars;
    }

    public function showInviteFriendsWindow(onComplete:Function, onError:Function):void
    {
        Facebook.ui("apprequests", { message: "Invite friends" }, onShowInviteFriendsWindowComplete);
    }

    private function onShowInviteFriendsWindowComplete(resp:*):void
    {
    }

    public function getTotalFriends(uid:String = "", count:int = 0, offset:int = 0):void
    {
        Facebook.api('/me/friends', totalFriendsComplete, {fields: "id, first_name, last_name, picture"});
    }

    private function totalFriendsComplete(response:Object, fail:Object):void
    {
        var arrFriends:Array;
        var event:APIEvent;

        arrFriends = parseFriendsInfo(response as Object);
        if (!arrFriends)
        {
            _apiConnector.dispatchEvent(new APIEvent(APIEvent.GET_FRIENDS_FAIL));
            return;
        }

        event = new APIEvent(APIEvent.GET_FRIENDS_SUCCESS);
        event.users = arrFriends;
        _apiConnector.dispatchEvent(event);
    }

    public function postToWall(titleText:String, messageText:String, picUrl:String, linkUrl:String = "", ownerId:String = ""):void
    {
        var param:Object =
        {
            link: "https://apps.facebook.com/comtolenicagremlins/",
            picture: picUrl,
            name: "Happy Catch",
            caption: titleText,
            description: messageText
        };

        Facebook.ui("feed", param, onPostToWallComplete);
        //Facebook.api("/me/feed", onPostToWallComplete, param, "POST");
    }

    private function onPostToWallComplete(response:*):void
    {
    }

    public function transferVotes(money:Number, votes:Number, onComplete:Function, onError:Function):void
    {
        var productLink:String = StringUtil.substitute("http://www.tolenica.com/gremlins/og/currency_euro_pack_{0}.html", money);

        var param:Object =
        {
            action: "purchaseitem",
            product: productLink
        };

        _callback = onComplete;
        _callbackError = onError;

        Facebook.ui("pay", param, onTransferVoteComplete);
    }

    private function onTransferVoteComplete(response:*):void
    {
        if (response.error_code)
        {
            if (_callbackError != null)
                _callbackError();
        }
        else  //purchasing success
        {
            if (_callback != null)
                _callback();
        }
    }
}
}