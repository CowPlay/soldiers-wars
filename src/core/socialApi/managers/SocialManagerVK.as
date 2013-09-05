package core.socialApi.managers
{
import core.models.GameInfo;
import core.socialApi.*;
import core.Debug;
import core.socialApi.info.SocialUserInfo;
import core.socialApi.vk.APIConnection;

/**
 * ...
 * @author me
 */
public class SocialManagerVK extends SocialManagerBase
{
    /*
     * Fields
     */

    private var _apiConnection:APIConnection;

    private var _friendsFields:String;

    //callbacks
    private var _callbackPostToWall:Function;
    private var _callbackInviteFriends:Function;

    /*
     * Properties
     */

    public override function get type():ESocialNetworkType
    {
        return ESocialNetworkType.ESNT_VK;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function SocialManagerVK(onComplete:Function, onError:Function)
    {
        super(onComplete, onError);

        init(onComplete, onError);
    }

    protected function init(onComplete:Function, onError:Function):void
    {
        _friendsFields = "uid,first_name,last_name,photo_100";

        _apiConnection = new APIConnection(_flashVars);

        _requestsArray = [];

        _requestsArray.push(initSocialUserInfo);

        if (ConstantsSocial.SOCIAL_ACCESS_FRIENDS)
        {
            _requestsArray.push(initFriendsAll);
            _requestsArray.push(initFriendsInstalled);
            _requestsArray.push(initFriendsNotInstalled);
        }

        _requestsArray.push(onComplete);

        applyNextRequest();
    }

    private function applyNextRequest():void
    {
        var request0:Function = _requestsArray.shift();
        request0();
    }

    private function initSocialUserInfo():void
    {
        var params:Object =
        {
            uids: _flashVars.viewer_id,
            fields: _friendsFields
        };

        _apiConnection.api("users.get", params, onInitSocialUserInfoComplete, onInitSocialUserInfoError);
    }

    private function onInitSocialUserInfoComplete(response:*):void
    {
        Debug.log("initSocialUserInfo complete");

        Debug.assert(response != null, "Response must be non null");
        Debug.assert(response is Array && response.length == 1, "Response must have Array type");

        _userInfo = getUserInfoFromResponse((response as Array)[0]);

        applyNextRequest();
    }

    private function onInitSocialUserInfoError(response:*):void
    {
        Debug.log(response.hasOwnProperty("error_msg") ? response.error_msg : "initSocialUserInfo error");

        applyNextRequest();
    }

    private function initFriendsAll():void
    {
        var params:Object =
        {
            count: ConstantsSocial.SOCIAL_FRIENDS_COUNT,
            fields: _friendsFields
        };

        _apiConnection.api("friends.get", params, onFriendsGetComplete, onFriendsGetError);
    }

    private function onFriendsGetComplete(response:*):void
    {
        Debug.log("initFriendsAll success");

        if (response == null)
        {
            Debug.log("initFriendsAll empty response");
        }

        if (!(response is Array))
        {
            Debug.log("initFriendsAll response are not Array");
        }

        _friendsListAll = [];

        for (var i:int = 0; i < response.length; i++)
        {
            _friendsListAll.push(getUserInfoFromResponse(response[i]));
        }

        applyNextRequest();
    }

    private function onFriendsGetError(response:*):void
    {
        Debug.log(response.hasOwnProperty("error_msg") ? response.error_msg : "initFriendsAll error");

        applyNextRequest();
    }

    private function initFriendsInstalled():void
    {
        _apiConnection.api("friends.getAppUsers", null, onInitFriendsInstalledComplete, onInitFriendsInstalledError);
    }

    private function onInitFriendsInstalledComplete(response:*):void
    {
        Debug.log("initFriendsInstalled success");

        applyNextRequest();
    }

    private function onInitFriendsInstalledError(response:*):void
    {
        Debug.log(response.hasOwnProperty("error_msg") ? response.error_msg : "initFriendsInstalled error");

        applyNextRequest();
    }

    private function initFriendsNotInstalled():void
    {
        _friendsListNotInstalled = [];

        for each(var friend:SocialUserInfo in _friendsListAll)
        {
            if (!friend.installed)
            {
                _friendsListNotInstalled.push(friend);
            }
        }

        applyNextRequest();
    }

    private static function getUserInfoFromResponse(response:*):SocialUserInfo
    {
        var userInfo:SocialUserInfo;

        userInfo = new SocialUserInfo();

        userInfo.firstName = response.hasOwnProperty("first_name") ? response.first_name : "";
        userInfo.lastName = response.hasOwnProperty("last_name") ? response.last_name : "";
        userInfo.id = response.hasOwnProperty("uid") ? String(response.uid) : "";

        //load picture
        userInfo.urlPicture = response.hasOwnProperty("photo_100") ? response.photo_100 : "";

        return userInfo;
    }

    /*
     * Public methods
     */

    public override function postToWall(callback:Function, text:String, urlPic:String, title:String = "", urlLink:String = ""):void
    {
        var params:Object =
        {
            attachments: urlPic,
            message: text
        };

        _callbackPostToWall = callback;

        _apiConnection.api("wall.post", params, onPostToWallComplete, onPostToWallError);
    }

    private function onPostToWallComplete(response:*):void
    {
        Debug.log("postToWall success");

        if (_callbackPostToWall != null)
            _callbackPostToWall();
    }

    private function onPostToWallError(response:*):void
    {
        Debug.log(response.hasOwnProperty("error_msg") ? response.error_msg : "postToWall error");

        if (_callbackPostToWall != null)
            _callbackPostToWall();
    }

    public override function inviteFriends(callback:Function):void
    {
        _callbackInviteFriends = callback;

        _apiConnection.callMethod("showInviteBox", null, onInviteFriendsComplete, onInviteFriendsError);
    }

    private function onInviteFriendsComplete(response:*):void
    {
        Debug.log("inviteFriends success");

        if (_callbackInviteFriends != null)
            _callbackInviteFriends();
    }

    private function onInviteFriendsError(response:*):void
    {
        Debug.log(response.hasOwnProperty("error_msg") ? response.error_msg : "inviteFriends error");

        if (_callbackInviteFriends != null)
            _callbackInviteFriends();
    }

//
//    public function transferVotes(money:Number, votes:Number, onComplete:Function, onError:Function):void
//    {
//        var transferItem:String;
//        transferItem = "euro" + money.toString();
//
//        _callback = onComplete;
//        _callbackError = onError;
//
//        _apiConnection.callMethod("showOrderBox", { type: 'item', item: transferItem });
//        _apiConnection.addEventListener("onOrderSuccess", orderSuccessHandler);
//    }

}
}