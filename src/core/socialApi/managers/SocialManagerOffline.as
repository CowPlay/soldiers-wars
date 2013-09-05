/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/5/13
 * Time: 9:36 AM
 * To change this template use File | Settings | File Templates.
 */
package core.socialApi.managers
{
import core.Debug;
import core.socialApi.*;
import core.socialApi.info.SocialUserInfo;

import flash.events.TimerEvent;
import flash.utils.Timer;

public class SocialManagerOffline extends SocialManagerBase
{

    /*
     * Static fields
     */
    [Embed(source="../../../../html/offline/assets/avatar.gif")]
    private static var _userPictureClass:Class;

    /*
     * Fields
     */
    private var _timerCallback:Timer;

    private var _callbackOnComplete:Function;

    /*
     * Properties
     */

    public override function get type():ESocialNetworkType
    {
        return ESocialNetworkType.ESNT_OFFLINE;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function SocialManagerOffline(onComplete:Function, onError:Function)
    {
        super(onComplete, onError);

        _callbackOnComplete = onComplete;

        init();
    }

    private function init():void
    {
        Debug.assert(_userPictureClass != null, "Not found user picture for offline view");

        _userInfo = new SocialUserInfo();
        _userInfo.id = ConstantsSocial.OFFLINE_USER_ID;
        _userInfo.firstName = ConstantsSocial.OFFLINE_FIRST_NAME;
        _userInfo.lastName = ConstantsSocial.OFFLINE_LAST_NAME;
        _userInfo.installed = true;

        _userInfo.picture = new _userPictureClass();

        timerStart();
    }

    private function timerStart():void
    {
        Debug.assert(_timerCallback == null, "timer already created");
        Debug.assert(_callbackOnComplete != null, "callback onComplete must be non null");

        _timerCallback = new Timer(ConstantsSocial.OFFLINE_CALLBACK_DELAY, 1);
        _timerCallback.addEventListener(TimerEvent.TIMER_COMPLETE, timerStop);
        _timerCallback.start();
    }

    private function timerStop(e:TimerEvent):void
    {
        _timerCallback.stop();
        _timerCallback.removeEventListener(TimerEvent.TIMER_COMPLETE, timerStop);
        _timerCallback = null;

        _callbackOnComplete();

        _callbackOnComplete = null;
    }

    /*
     * ISocialManager
     */

    public override function postToWall(callback:Function, text:String, urlPic:String, title:String = "", urlLink:String = ""):void
    {
        _callbackOnComplete = callback;

        timerStart();
    }


    public override function inviteFriends(callback:Function):void
    {
        _callbackOnComplete = callback;

        timerStart();
    }
}
}
