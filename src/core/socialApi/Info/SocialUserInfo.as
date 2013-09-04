package core.socialApi.info
{
import core.Debug;

import flash.display.Loader;
import flash.events.IOErrorEvent;
import flash.net.URLRequest;

public class SocialUserInfo
{
    /*
     * Fields
     */

    public var id:String;
    public var lastName:String;
    public var firstName:String;
    public var picUrl:String;
    public var installed:Boolean;
    public var pic:Loader;

    /*
     * Methods
     */

    //! Default constructor
    public function SocialUserInfo()
    {

    }

    public function loadPicture():void
    {
        if (!picUrl || picUrl == "")
            return;

        pic = new Loader();
        pic.load(new URLRequest(picUrl));
        pic.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onLoadPicError);
    }

    private static function onLoadPicError(e:IOErrorEvent):void
    {
        Debug.assert(false, e.toString());
    }

    //    private function loadPicture(url:String, callback:Function):void
//    {
//        _callbackPicture = callback;
//        _loaderPics.load(new URLRequest(url));
//    }
//
//    private function picErrorHandler(e:IOErrorEvent):void
//    {
//        trace("picture loading error");
//        _callbackPicture(null);
//    }
//
//    private function onPictureLoaded(e:Event):void
//    {
//        var imageInfo:LoaderInfo;
//        var bmd:BitmapData;
//        var bitmap:Bitmap;
//
//        try
//        {
//            imageInfo = LoaderInfo(e.target);
//            bmd = new BitmapData(imageInfo.width, imageInfo.height);
//            bmd.draw(imageInfo.loader.content);
//            bitmap = new Bitmap(bmd);
//
//            if (_callbackPicture != null)
//                _callbackPicture(bitmap);
//        }
//        catch (e:Error)
//        {
//            Debug.assert(false, e.message);
//            _callbackPicture(null);
//        }
//    }
}

}