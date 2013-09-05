package core.socialApi.info
{
import core.Debug;
import core.Utils;
import core.models.GameInfo;

import flash.display.Bitmap;
import flash.display.BitmapData;

public class SocialUserInfo
{
    /*
     * Fields
     */


    public var id:String;
    public var lastName:String;
    public var firstName:String;
    public var installed:Boolean;

    private var _picture:Bitmap;


    /*
     * Properties
     */

    public function set urlPicture(url:String):void
    {
        Debug.assert(_picture == null, "Picture already loaded");

        GameInfo.Instance.loaderPicture.loadPicture(url, onLoadPictureComplete);
    }

    private function onLoadPictureComplete(pictureValue:Bitmap):void
    {
        Debug.assert(pictureValue != null);

        _picture = pictureValue;
    }

    public function get hasPicture():Boolean
    {
        return _picture != null;
    }

    public function set picture(value:Bitmap):void
    {
        if (_picture == value)
            return;

        _picture = value;
    }


    /*
     * Methods
     */

    //! Default constructor
    public function SocialUserInfo()
    {
    }

    //! Always returns clone of original picture
    public function getPictureClone():Bitmap
    {
        if (_picture == null)
            return null;

        var result:Bitmap = null;

        var bmpDataClone:BitmapData = _picture.bitmapData.clone();
        result = new Bitmap(bmpDataClone);

        return result;
    }
}

}