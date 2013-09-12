package core.models.implementations.social.info
{
import core.Debug;
import core.models.GameInfoBase;

import flash.display.Bitmap;
import flash.display.BitmapData;

public class SocialUserInfo
{
    /*
     * Static creators
     */

    [Embed(source="avatar.gif")]
    private static var _userPictureClass:Class;

    public static function createSocialUserInfo(idValue:String, firstNameValue:String, lastNameValue:String, isInstalledValue:Boolean, urlPicture:String = null):SocialUserInfo
    {
        Debug.assert(_userPictureClass != null, "Not found user picture for offline view");

        var result:SocialUserInfo = new SocialUserInfo();

        result._id = idValue;
        result._firstName = firstNameValue;
        result._lastName = lastNameValue;
        result._isInstalled = isInstalledValue;

        if (urlPicture == null)
        {
            result._picture = new _userPictureClass();
        }
        else
        {
            GameInfoBase.Instance.loaderPicture.loadPicture(urlPicture, result.onLoadPictureComplete);
        }

        return result;
    }

    /*
     * Fields
     */


    private var _id:String;
    private var _lastName:String;
    private var _firstName:String;
    private var _isInstalled:Boolean;

    private var _picture:Bitmap;


    /*
     * Properties
     */

    private function onLoadPictureComplete(pictureValue:Bitmap):void
    {
        Debug.assert(pictureValue != null);

        _picture = pictureValue;
    }

    public function get id():String
    {
        return _id;
    }

    public function get lastName():String
    {
        return _lastName;
    }

    public function get firstName():String
    {
        return _firstName;
    }

    public function get isInstalled():Boolean
    {
        return _isInstalled;
    }

    //! Always returns clone of original picture
    public function get pictureClone():Bitmap
    {
        if (_picture == null)
            return null;

        var result:Bitmap = null;

        var bmpDataClone:BitmapData = _picture.bitmapData.clone();
        result = new Bitmap(bmpDataClone);

        return result;
    }

    /*
     * Methods
     */

    //! Default constructor
    function SocialUserInfo()
    {
    }
}

}