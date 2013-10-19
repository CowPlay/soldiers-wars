/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/3/13
 * Time: 12:05 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.scenes.base.views
{
import controls.IControlScene;
import controls.implementations.ControlBase;

import flash.display.Bitmap;

import models.interfaces.social.IManagerSocial;
import models.interfaces.social.ISocialUser;

import mx.utils.StringUtil;

public class ControlPlayerInfo extends ControlBase
{
    /*
     * Fields
     */
    private var _sourceViewTyped:gControlPlayerInfo;

    private var _userPicture:Bitmap;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlPlayerInfo(sceneOwner:IControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gControlPlayerInfo();
        setSourceView(_sourceViewTyped);

        var managerSocial:IManagerSocial = GameInfo.instance.managerSocial;

        _sourceViewTyped.labelPlayerName.text = StringUtil.substitute("{0} {1}", managerSocial.userInfo.firstName, managerSocial.userInfo.lastName);

        managerSocial.userInfo.tryLoadPicture(function (socialUser:ISocialUser):void
        {
            _userPicture = socialUser.pictureClone;

            _userPicture.width = _sourceViewTyped.imageAvatar.width;
            _userPicture.height = _sourceViewTyped.imageAvatar.height;

            _sourceViewTyped.imageAvatar.addChild(_userPicture);
        });
    }

    /*
     * IDisposable
     */

    public override function cleanup():void
    {
        _userPicture.bitmapData.dispose();
        _userPicture.parent.removeChild(_userPicture);
        _userPicture = null;

        _sourceViewTyped = null;

        super.cleanup();
    }
}
}
