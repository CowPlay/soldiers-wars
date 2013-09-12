/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/5/13
 * Time: 9:36 AM
 * To change this template use File | Settings | File Templates.
 */
package core.models.implementations.social.managers
{
import core.Debug;
import core.models.implementations.social.ConstantsSocial;
import core.models.implementations.social.info.SocialUserInfo;
import core.models.interfaces.ELanguageType;
import core.models.interfaces.ESocialNetworkType;

import flash.events.TimerEvent;
import flash.utils.Timer;

public class SocialManagerOffline extends SocialManagerBase
{

    /*
     * Static fields
     */

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

    public override function get currentLanguage():String
    {
        return ELanguageType.ELT_ENGLISH;
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
        _userInfo = SocialUserInfo.createSocialUserInfo(ConstantsSocial.OFFLINE_USER_ID, ConstantsSocial.OFFLINE_FIRST_NAME, ConstantsSocial.OFFLINE_LAST_NAME, true);

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
