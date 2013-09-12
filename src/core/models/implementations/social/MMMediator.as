package core.models.implementations.social
{
public class MMMediator // implements IMediator
{
//    private const API_KEY:String = "05bc6731187dcff686a90f06472d265b";//"9aa7bc60767159320bf24debca0ffdac";//
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
//    public function MMMediator()
//    {
//
//    }
//
//    public function init(completeCallback:Function, errorCallback:Function):void
//    {
//        _apiConnector = GameInfo.Instance.socialManager;
//        _callback = completeCallback;
//        _callbackError = errorCallback
//        _userId = _flashVars.vid;
//
//        MailruCall.addEventListener(Event.COMPLETE, mailruReadyHandler);
//        MailruCall.init('flash-app', API_KEY);
//        //_userId	= MailruCall.exec('mailru.session.vid');
//    }
//
//    private function mailruReadyHandler(e:Event):void
//    {
//        /*if (!MailruCall.isInit)
//         callErrorFunction();*/
//
//        getUserFriends();
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
//        MailruCall.exec("mailru.common.friends.getAppUsers", friendsIdsHandler, { ext: false });
//    }
//
//    private function friendsIdsHandler(response:*):void
//    {
//        var uids:String;
//        var arrUids:Array;
//
//        if (!response)
//        {
//            callErrorFunction();
//            return;
//        }
//
//        arrUids = (response as Array);
//        arrUids = arrUids.slice(0, 80);
//        uids = _userId;
//        for (var i:int = 0; i < arrUids.length; i++)
//            uids += "," + arrUids[i].uid;
//
//        MailruCall.exec("mailru.common.users.getInfo", getFriendIdsHandler, uids);
//    }
//
//    private function getFriendIdsHandler(response:*):void
//    {
//        var friendInfo:SocialUserInfo;
//
//        if (!response || !(response is Array))
//        {
//            callErrorFunction();
//            return;
//        }
//
//        _friendsList = [];
//        for (var i:int = 0; i < response.length; i++)
//        {
//            friendInfo = new SocialUserInfo();
//            friendInfo.firstName = response[i].first_name;
//            friendInfo.lastName = response[i].last_name;
//            friendInfo.picUrl = response[i].pic;
//            friendInfo.id = response[i].uid;
//            friendInfo.loadPicture();
//
//            _friendsList.push(friendInfo);
//        }
//
//        getMainUser(_friendsList);
//        callCompleteFunction();
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
//        MailruCall.exec("mailru.app.friends.invite");
//    }
//
//    public function postToWall(titleText:String, messageText:String, picUrl:String, linkUrl:String = "", ownerId:String = ""):void
//    {
//        var param:Object;
//
//        param = {
//            "title": titleText,
//            "text": messageText,
//            "img_url": picUrl
//        };
//
//        MailruCall.exec("mailru.common.stream.post", postToWallComplete, param);
//    }
//
//    private function postToWallComplete(resp:*):void
//    {
//
//    }
//
//    private function wallPostHandler(response:*):void
//    {
//        callCompleteFunction();
//    }
//
//    public function getTotalFriends(uid:String = "", count:int = 0, offset:int = 0):void
//    {
//        MailruCall.exec("mailru.common.friends.getExtended", totalFriendsHandler);
//    }
//
//    private function totalFriendsHandler(resp:*):void
//    {
//        var event:APIEvent;
//
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
//        userInfo.picUrl = (info.pic_big && info.pic_big is String) ? info.pic_big : "";
//        userInfo.id = info.uid ? String(info.uid) : "";
//
//        return userInfo;
//    }
//
//    public function transferVotes(currency:Number, votes:Number, onComplete:Function, onError:Function):void
//    {
//        var param:Object;
//        _callback = onComplete;
//        _callbackError = onError;
//
//        param = {
//            service_id: currency,
//            service_name: currency.toString() + "евриков",
//            mailiki_price: votes
//        };
//
//        MailruCall.addEventListener(MailruCallEvent.INCOMING_PAYMENT, buyCallBack);
//        MailruCall.exec("mailru.app.payments.showDialog", buyCallBack, param);
//    }
//
//    private function buyCallBack(e:MailruCallEvent):void
//    {
//        MailruCall.removeEventListener(MailruCallEvent.INCOMING_PAYMENT, buyCallBack);
//        callCompleteFunction();
//    }
}

}