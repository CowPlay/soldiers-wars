/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/3/13
 * Time: 12:05 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.base.views
{
import core.controls.ControlBase;
import core.controls.ControlScene;

import flash.display.Bitmap;

import mx.utils.StringUtil;

public class ControlPlayerInfo extends ControlBase
{
    /*
     * Fields
     */
    private var _rootView:gControlPlayerInfo;

    private var _userPicture:Bitmap;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlPlayerInfo(sceneOwner:ControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _rootView = new gControlPlayerInfo();
        addChild(_rootView);

        _rootView.labelPlayerName.text = StringUtil.substitute("{0} {1}", ControlScene.socialManager.userInfo.firstName, ControlScene.socialManager.userInfo.lastName);

        if (ControlScene.socialManager.userInfo.hasPicture)
        {
            _userPicture = ControlScene.socialManager.userInfo.getPictureClone();

            _userPicture.width = _rootView.imageAvatar.width;
            _userPicture.height = _rootView.imageAvatar.height;

            _rootView.imageAvatar.addChild(_userPicture);
        }
    }

    /*
     * IDisposable
     */

    public override function cleanup():void
    {
        _rootView.removeChild(_userPicture);
        _userPicture = null;

        removeChild(_rootView);
        _rootView = null;

        super.cleanup();
    }
}
}
