package core.socialApi
{
import core.socialApi.Info.SocialUserInfo;

import flash.events.EventDispatcher;

/**
 * ...
 * @author me
 */
public class SocialNetworkManager
{
    private var _connector:IMediator;
    private static var _network:ESocialNetworkType;

    private static var instance:SocialNetworkManager;

    private var _disptacher:EventDispatcher;

    public static var isNetwork:Boolean;
    public static var isOffline:Boolean;

    private var _initCallback:Function;

    /*
     * Properties
     */

    public static function get network():ESocialNetworkType
    {
        return _network;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function SocialNetworkManager()
    {
    }

    public function init(onComplete:Function = null):void
    {
        var flashVars:Object = Main.stageValue.loaderInfo.parameters;

        _disptacher = new EventDispatcher();

        _initCallback = onComplete;

        SOCIAL::VK
        {
            _network = ESocialNetworkType.ESNT_VK;
            isOffline = false;
            isNetwork = true;
            _connector = null;//new VKMediator();
            _connector.init(onComplete, initErrorHandler);
        }

        SOCIAL::FACEBOOK
        {
            _network = ESocialNetworkType.ESNT_FB;
            isOffline = false;
            isNetwork = true;
            _connector = new FBMediator();
            _connector.init(onComplete, initErrorHandler);
        }

        SOCIAL::OK
        {
            _network = ESocialNetworkType.ESNT_OK;
            isOffline = false;
            isNetwork = true;
            _connector = null;//new OKMediator();
            _connector.init(onComplete, initErrorHandler);
        }

        SOCIAL::MM
        {
            _network = ESocialNetworkType.ESNT_MM;
            isOffline = false;
            isNetwork = true;
            _connector = null;//new MMMediator();
            _connector.init(onComplete, initErrorHandler);
        }

        SOCIAL::OFFLINE
        {
            _network = ESocialNetworkType.ESNT_OFFLINE;
            isOffline = false;
            isNetwork = false;
            _connector = null;//new VKMediator();
            _connector.init(onComplete, initErrorHandler);
        }
    }

    private function initErrorHandler():void
    {
        isOffline = true;

        if (_initCallback != null)
            _initCallback();
    }

    public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
    {
        _disptacher.addEventListener(type, listener, useCapture, priority, useWeakReference);
    }

    public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
    {
        _disptacher.removeEventListener(type, listener, useCapture);
    }

    public function hasEventListener(type:String):Boolean
    {
        return _disptacher.hasEventListener(type);
    }

    internal function dispatchEvent(event:APIEvent):void
    {
        _disptacher.dispatchEvent(event);
    }

    public function getUserInfo():SocialUserInfo
    {
        if (isOffline)
            return new SocialUserInfo();

        return _connector.getUserInfo();
    }

    public function getUserId():String
    {
        return _connector.getUserId();
    }

    public function getFriendsList():Array
    {
        if (isOffline)
            return [];

        return _connector.getFriendsList();
    }

    public function getFlashVars():Object
    {
        return _connector.getFlashVars();
    }

    public function showInviteFriendsWindow(onComplete:Function = null, onError:Function = null):void
    {
        _connector.showInviteFriendsWindow(onComplete, onError);
    }

    public function postToWall(title:String, message:String, picUrl:String, linkUrl:String = "", ownerId:String = ""):void
    {
        //TODO: view link URL. It never used.
        _connector.postToWall(title, message, picUrl, ownerId);
    }

    public function transferVotes(money:Number, votes:Number, onComplete:Function = null, onError:Function = null):void
    {
        _connector.transferVotes(money, votes, onComplete, onError);
    }

    public function getTotalFriends(uid:String = "", count:int = 0, offset:int = 0):void
    {
        _connector.getTotalFriends(uid, count, offset);
    }


}
}