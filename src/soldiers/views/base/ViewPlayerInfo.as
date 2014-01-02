/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/3/13
 * Time: 12:05 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.base
{
import controllers.IController;

import flash.display.Bitmap;

import models.interfaces.social.IManagerSocial;
import models.interfaces.social.ISocialUser;

import mx.utils.StringUtil;

import soldiers.GameInfo;

import views.implementations.ViewBase;

public class ViewPlayerInfo extends ViewBase
{
    /*
     * Fields
     */
    private var _sourceView:gViewPlayerInfo;

    private var _userPicture:Bitmap;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ViewPlayerInfo(controller:IController)
    {
        _sourceView = new gViewPlayerInfo();
        super(controller, _sourceView);

        init();
    }

    private function init():void
    {
        var managerSocial:IManagerSocial = GameInfo.instance.managerSocial;

        _sourceView.labelPlayerName.text = StringUtil.substitute("{0} {1}", managerSocial.userInfo.firstName, managerSocial.userInfo.lastName);

        managerSocial.userInfo.tryLoadPicture(function (socialUser:ISocialUser):void
        {
            if (isCleanuped)
                return;

            _userPicture = socialUser.pictureClone;

            _userPicture.width = _sourceView.imageAvatar.width;
            _userPicture.height = _sourceView.imageAvatar.height;

            _sourceView.imageAvatar.addChild(_userPicture);
        });
    }

    /*
     * IDisposable
     */

    public override function cleanup():void
    {
        if (_userPicture != null)
        {
            _userPicture.bitmapData.dispose();
            _userPicture.parent.removeChild(_userPicture);
            _userPicture = null;
        }

        _sourceView = null;

        super.cleanup();
    }
}
}
