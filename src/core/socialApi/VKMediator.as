package core.socialApi
{
import core.Debug;
import core.socialApi.Info.SocialUserInfo;
import core.socialApi.vk.APIConnection;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLRequest;
import flash.system.LoaderContext;
import flash.utils.ByteArray;

import models.gameInfo.GameInfo;

/**
* ...
* @author me
*/
internal class VKMediator //implements IMediator
{
//    private var _callback:Function;
//    private var _callbackError:Function;
//    private var _flashVars:Object;
//
//    private var _userInfo:SocialUserInfo;
//    private var _friendsList:Array;
//    private var _userId:String;
//
//    private var _callbackPicture:Function;
//    private var _picsLoader:Loader;
//    private var _context:LoaderContext;
//    private var _friendsUids:Array;
//    private var _currFriend:Number;
//
//    private var _apiConnector:SocialNetworkManager;
//    private var _vkConnector:APIConnection;
//
//    public function VKMediator()
//    {
//    }
//
//    public function init(completeCallback:Function, errorCallback:Function):void
//    {
//        _callback = completeCallback;
//        _callbackError = errorCallback;
//        _flashVars = Main.stageValue.loaderInfo.parameters;
//        _apiConnector = GameInfo.Instance.socialManager;
//
//        if (!_flashVars.viewer_id)
//        {
//            _flashVars.viewer_id = ConstantsSocial.VIEWER_ID; //ME
//            _flashVars.api_id = ConstantsSocial.API_ID;
//            _flashVars.auth_key = ConstantsSocial.AUTH_KEY;
//            _flashVars.secret = ConstantsSocial.SECRET;
//            _flashVars.api_url = ConstantsSocial.API_URL;
//            _flashVars.user_id = ConstantsSocial.USER_ID;
//            _flashVars.sid = "59186844ad6ebaafd1b2e8fb81fcd10f5e5c9b480e575f0240ae47ea04b3f2bd5100a0232dddbabbf05ca";
//        }
//        _userId = _flashVars.viewer_id;
//
//        _context = new LoaderContext(true);
//        _picsLoader = new Loader();
//        _picsLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, picLoadHandler);
//        _picsLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, picErrorHandler);
//
//        _vkConnector = new APIConnection(_flashVars);
//
//        getUserFriends();
//    }
//
//
//
//    private function onError(response:*):void
//    {
//        trace("some API error");
//        callErrorFunction();
//    }
//
//    private function callCompleteFunction():void
//    {
//        if (_callback != null)
//            _callback();
//    }
//
//    private function callErrorFunction():void
//    {
//        if (_callbackError != null)
//            _callbackError();
//    }
//
//    private function getMainUser(users:Array):void
//    {
//        for (var i:int = 0; i < users.length; i++)
//            if (users[i].id == _userId)
//            {
//                _userInfo = users[i];
//                users.splice(i, 1);
//                break;
//            }
//    }
//
//    private function getUserFriends():void
//    {
//        _vkConnector.api("friends.getAppUsers", { }, friendsIdsHandler, onError);
//    }
//
//    private function friendsIdsHandler(response:Array):void
//    {
//        var uids:String;
//
//        if (!response)
//        {
//            callErrorFunction();
//            return;
//        }
//
//        _friendsUids = response;
//        uids = _userId;
//        if (_friendsUids && _friendsUids.length)
//            uids += "," + _friendsUids.join(",");
//
//        _vkConnector.api("users.get", { uids: uids, fields: "uid,first_name,last_name,photo" }, getFriendIdsHandler, onError);
//    }
//
//    private function getFriendIdsHandler(response:Array):void
//    {
//        var friendInfo:SocialUserInfo;
//
//        if (!response || !response.length)
//        {
//            callErrorFunction();
//            return;
//        }
//
//        _friendsList = [];
//
//        for (var i:int = 0; i < response.length; i++)
//        {
//            friendInfo = new SocialUserInfo();
//
//            friendInfo.firstName = response[i].first_name;
//            friendInfo.lastName = response[i].last_name;
//            friendInfo.picUrl = response[i].photo;
//            friendInfo.id = response[i].uid;
//            friendInfo.loadPicture();
//
//            _friendsList.push(friendInfo);
//        }
//
//        getMainUser(_friendsList);
//        callCompleteFunction();
//
//        //_currFriend	= 0;
//        //loadPicture(_friendsList[0].picUrl, friendPicLoaded);
//    }
//
//    private function friendPicLoaded(picture:Bitmap):void
//    {
//        if (picture)
//            _friendsList[_currFriend].pic = picture;
//
//        _currFriend++;
//
//        if (_currFriend < _friendsList.length)
//            loadPicture(_friendsList[_currFriend].picUrl, friendPicLoaded);
//        else
//        {
//            getMainUser(_friendsList);
//            callCompleteFunction();
//        }
//    }
//
//    private function loadPicture(url:String, callback:Function):void
//    {
//        _callbackPicture = callback;
//        _picsLoader.load(new URLRequest(url));
//    }
//
//    private function picErrorHandler(e:IOErrorEvent):void
//    {
//        trace("picture loading error");
//        _callbackPicture(null);
//    }
//
//    private function loader2ByteArray(event:Event):void
//    {
//        var lInfo:LoaderInfo = LoaderInfo(event.target);
//        var ba:ByteArray = lInfo.bytes;
//        var reloader:Loader = new Loader();
//        reloader.loadBytes(ba);
//        reloader.contentLoaderInfo.addEventListener(Event.COMPLETE, picLoadHandler);
//    }
//
//    private function picLoadHandler(e:Event):void
//    {
//        var imageInfo:LoaderInfo;
//        var bmd:BitmapData;
//        var bitmap:Bitmap;
//
//        try
//        {
//            imageInfo = LoaderInfo(e.target);
//            bmd = new BitmapData(imageInfo.width, imageInfo.height);
//            bmd.draw(imageInfo.loader.content);
//            bitmap = new Bitmap(bmd);
//
//            if (_callbackPicture != null)
//                _callbackPicture(bitmap);
//        }
//        catch (e:Error)
//        {
//            Debug.assert(false, e.message);
//            _callbackPicture(null);
//        }
//    }
//
//    public function getTotalFriends(uid:String = "", count:int = 0, offset:int = 0):void
//    {
//        var params:Object;
//
//        params = {};
//
//        if (uid != "")
//            params.uid = uid;
//
//        if (count)
//            params.count = count;
//
//        if (offset)
//            params.offset = offset;
//
//        params.fields = "uid,first_name,last_name,photo_big";
//
//        _vkConnector.api("friends.get", params, friendsGetHandler, friendsGetError);
//    }
//
//    private function friendsGetError(response:*):void
//    {
//        _apiConnector.dispatchEvent(new APIEvent(APIEvent.GET_FRIENDS_FAIL));
//    }
//
//    private function friendsGetHandler(response:*):void
//    {
//        var event:APIEvent;
//
//        if (!response || !(response is Array))
//        {
//            _apiConnector.dispatchEvent(new APIEvent(APIEvent.GET_FRIENDS_FAIL));
//            return;
//        }
//
//        event = new APIEvent(APIEvent.GET_FRIENDS_SUCCESS);
//        event.users = getUsersInfo(response as Array);
//        _apiConnector.dispatchEvent(event);
//    }
//
//    private function getUsersInfo(apiInfo:Array):Array
//    {
//        var users:Array;
//
//        if (!apiInfo)
//            return null;
//
//        users = [];
//        for (var i:int = 0; i < apiInfo.length; i++)
//            users.push(getApiInfo(apiInfo[i]));
//
//        return users;
//    }
//
//    private function getApiInfo(info:Object):SocialUserInfo
//    {
//        var userInfo:SocialUserInfo;
//
//        userInfo = new SocialUserInfo();
//        userInfo.firstName = (info.first_name && info.first_name is String) ? info.first_name : "";
//        userInfo.lastName = (info.last_name && info.last_name is String) ? info.last_name : "";
//        userInfo.picUrl = (info.photo_big && info.photo_big is String) ? info.photo_big : "";
//        userInfo.id = info.uid ? String(info.uid) : "";
//
//        return userInfo;
//    }
//
//    public function getFriendsList():Array
//    {
//        return _friendsList;
//    }
//
//    public function getUserId():String
//    {
//        return _userId;
//    }
//
//    public function getUserInfo():SocialUserInfo
//    {
//        return _userInfo;
//    }
//
//    public function getFlashVars():Object
//    {
//        return _flashVars;
//    }
//
//    public function showInviteFriendsWindow(onComplete:Function, onError:Function):void
//    {
//        _callback = onComplete;
//        _callbackError = onError;
//        _vkConnector.callMethod("showInviteBox", { }, onInviteHandler, this.onError);
//    }
//
//    private function onInviteHandler(response:Object):void
//    {
//        callCompleteFunction();
//    }
//
//    public function postToWall(titleText:String, messageText:String, picUrl:String, linkUrl:String = "", ownerId:String = ""):void
//    {
//        var params:Object =
//        {
//            attachments: picUrl,
//            message: messageText,
//            owner_id: ownerId == "" ? null : ownerId
//        };
//
//        _vkConnector.api("wall.post", params, onPostToWallComplete, onPostToWallError);
//    }
//
//    private static function onPostToWallComplete(response:*):void
//    {
//        Debug.log("vk.com post wall success");
//    }
//
//    private static function onPostToWallError(response:*):void
//    {
//        Debug.log("vk.com post wall failed");
//    }
//
//    public function transferVotes(money:Number, votes:Number, onComplete:Function, onError:Function):void
//    {
//        var transferItem:String;
//        transferItem = "euro" + money.toString();
//
//        _callback = onComplete;
//        _callbackError = onError;
//
//        _vkConnector.callMethod("showOrderBox", { type: 'item', item: transferItem });
//        _vkConnector.addEventListener("onOrderSuccess", orderSuccessHandler);
//    }
//
//    private function orderSuccessHandler(response:*):void
//    {
//        _vkConnector.removeEventListener("onOrderSuccess", orderSuccessHandler);
//        callCompleteFunction();
//    }
}
}