/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/3/13
 * Time: 12:05 PM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.base.views
{
import core.Debug;
import core.controls.ControlBase;
import core.controls.ControlScene;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;

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



        //TODO: add hasPicture
//        if(ControlScene.socialManager.userInfo.pictureClone != null)
        {
            _userPicture = ControlScene.socialManager.userInfo.getPictureClone();
            _userPicture.width = 50;
            _userPicture.height = 50;
            _rootView.addChild(_userPicture);
        }
    }


    private function onUserAvatarLoaded(bmp:Bitmap):void
    {
        Debug.assert(bmp != null);
    }


    /*
     * IDisposable
     */

    public override function cleanup():void
    {
        removeChild(_rootView);
        _rootView = null;

        super.cleanup();
    }
}
}
