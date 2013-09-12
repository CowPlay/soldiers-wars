package core.models.implementations.social
{
public class OKMediator //implements IMediator
{
//    private const API_KEY:String = "E5AE16E2AEC47BB7A6C2A352";
//
//    private var _callback:Function;
//    private var _callbackError:Function;
//    private var _flashVars:Object;
//
//    private var _userInfo:SocialUserInfo;
//    private var _friendsList:Array;
//    private var _userId:String;
//
//    private var _apiConnector:SocialNetworkManager;
//
//    public function OKMediator()
//    {
//    }
//
//    public function init(completeCallback:Function, errorCallback:Function):void
//    {
//        _apiConnector = GameInfo.Instance.socialManager;
//        _callback = completeCallback;
//        _callbackError = errorCallback
//        _userId = _flashVars.logged_user_id;
//
//        Odnoklassniki.initialize(Main.stageValue, API_KEY);
//        Odnoklassniki.addEventListener(ApiServerEvent.CONNECTED, getUserFriends);
//        Odnoklassniki.addEventListener(ApiServerEvent.CONNECTION_ERROR, onError);
//        Odnoklassniki.addEventListener(ApiServerEvent.PROXY_NOT_RESPONDING, onError);
//        Odnoklassniki.addEventListener(ApiServerEvent.NOT_YET_CONNECTED, onError);
//    }
//
//    private function onError(e:ApiServerEvent):void
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
//    private function getUserFriends(e:ApiServerEvent):void
//    {
//        Odnoklassniki.callRestApi("friends.getAppUsers", friendsIdsHandler, {  }, "JSON", "POST");
//    }
//
//    private function friendsIdsHandler(response:*):void
//    {
//        var uids:String;
//        var friendsUids:Array;
//
//        if (!response)
//        {
//            callErrorFunction();
//            return;
//        }
//
//        friendsUids = (response.uids as Array);
//        friendsUids = friendsUids.slice(0, 98);
//        uids = _userId;
//        if (friendsUids && friendsUids.length)
//            uids += "," + friendsUids.toString();
//
//        Odnoklassniki.callRestApi("users.getInfo", getFriendIdsHandler, { uids: uids, fields: "uid, first_name, last_name, pic_1" }, "JSON", "POST");
//    }
//
//    private function cutArray(arr:Array, length:int):void
//    {
//        if (!arr)
//            return;
//
//        while (arr.length > length)
//            arr.pop();
//    }
//
//    private function getFriendIdsHandler(response:*):void
//    {
//        var friendInfo:SocialUserInfo;
//
//        if (!response || !response.length)
//        {
//            callErrorFunction();
//            return;
//        }
//
//        _friendsList = getUsersInfo(response as Array);
//        for (var i:int = 0; i < _friendsList.length; i++)
//            (_friendsList[i] as SocialUserInfo).loadPicture();
//
//        getMainUser(_friendsList);
//        callCompleteFunction();
//    }
//
//    private function getUsersInfo(getInfoArray:Array):Array
//    {
//        var users:Array;
//
//        if (!getInfoArray)
//            return null;
//
//        users = [];
//        for (var i:int = 0; i < getInfoArray.length; i++)
//            users.push(getApiInfo(getInfoArray[i]));
//
//        return users;
//    }
//
//    private function getApiInfo(getInfoObject:Object):SocialUserInfo
//    {
//        var apiInfo:SocialUserInfo;
//
//        apiInfo = new SocialUserInfo();
//        apiInfo.firstName = (getInfoObject.first_name) ? String(getInfoObject.first_name) : "";
//        apiInfo.lastName = (getInfoObject.last_name) ? String(getInfoObject.last_name) : "";
//        apiInfo.picUrl = (getInfoObject.pic_1) ? String(getInfoObject.pic_1) : "";
//        apiInfo.id = (getInfoObject.uid) ? String(getInfoObject.uid) : "";
//
//        return apiInfo;
//    }
//
//    public function getFriendsList():Array
//    {
//        return _friendsList;
//    };
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
//    public function inviteFriends(onComplete:Function, onError:Function):void
//    {
//        Odnoklassniki.showInvite();
//    }
//
//    public function getTotalFriends(uid:String = "", count:int = 0, offset:int = 0):void
//    {
//        Odnoklassniki.callRestApi("friends.get", totalFriendsIdsHandler, {  }, "JSON", "POST");
//    }
//
//    private function totalFriendsIdsHandler(resp:*):void
//    {
//        var ids:String;
//        if (!resp || !(resp is Array))
//        {
//            _apiConnector.dispatchEvent(new APIEvent(APIEvent.GET_FRIENDS_FAIL));
//            return;
//        }
//
//        cutArray(resp as Array, 99);
//        ids = getStringFromArray(resp as Array);
//
//        Odnoklassniki.callRestApi("users.getInfo", totalFriendsInfoHandler, { uids: ids, fields: "uid, first_name, last_name, pic_1" }, "JSON", "POST");
//    }
//
//    private function totalFriendsInfoHandler(resp:*):void
//    {
//        var event:APIEvent;
//        if (!resp || !(resp is Array))
//        {
//            _apiConnector.dispatchEvent(new APIEvent(APIEvent.GET_FRIENDS_FAIL));
//            return;
//        }
//
//        event = new APIEvent(APIEvent.GET_FRIENDS_SUCCESS);
//        event.users = getUsersInfo(resp as Array);
//        _apiConnector.dispatchEvent(event);
//    }
//
//    private function getStringFromArray(arr:Array):String
//    {
//        if (!arr)
//            return "";
//
//        return arr.join(",");
//    }
//
//    public function postToWall(titleText:String, messageText:String, picUrl:String, linkUrl:String = "", ownerId:String = ""):void
//    {
//        var attachment:Object = { caption: "Картинка", media: [
//            { href: "link", src: picUrl, type: "image" }
//        ] }
//        var actionLinks:Array = [
//            { text: 'Перейти к приложению', href: 'http://www.odnoklassniki.ru/game/greemlinfishing' }
//        ];
//
//        Stream.publish(titleText, messageText, wallPostHandler, ownerId, attachment, actionLinks);
//    }
//
//    private function wallPostHandler(response:*):void
//    {
//        callCompleteFunction();
//    }
//
//    public function transferVotes(currency:Number, votes:Number, onComplete:Function, onError:Function):void
//    {
//        _callback = onComplete;
//        _callbackError = onError;
//        Odnoklassniki.addEventListener(ApiCallbackEvent.CALL_BACK, buyCallBack);
//        Odnoklassniki.showPayment(currency + " евриков", "Еврики служат для покупки снаряжения и открытия локаций", currency.toString(), votes, null, null, null, "true");
//    }
//
//    private function buyCallBack(e:ApiCallbackEvent):void
//    {
//        callCompleteFunction();
//    }
}

}