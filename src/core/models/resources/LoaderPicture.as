/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/4/13
 * Time: 4:13 PM
 * To change this template use File | Settings | File Templates.
 */
package core.models.resources
{
import core.Debug;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLRequest;

import mx.utils.StringUtil;

public class LoaderPicture
{
    /*
     * Fields
     */

    private var _loaders:Array;


//    private var _loaderContext:LoaderContext;
    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function LoaderPicture()
    {
        _loaders = [];
//        _loaderContext = new LoaderContext(true, ApplicationDomain.currentDomain, SecurityDomain.currentDomain);
    }


    //! @param onCompete - callback which fires when picture load successfully. Must have signature foo(picture:Bitmap):void
    public function loadPicture(url:String, onComplete:Function, onError:Function = null, width:uint = 0, height:uint = 0):void
    {
        Debug.assert(url != "" && url != null);
        Debug.assert(onComplete != null);

        var loader:Loader = new Loader();

        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadPictureComplete);
        loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onLoadPictureError);

        var request:URLRequest = new URLRequest(url);

        var loaderInfo:LoaderPictureInfo = new LoaderPictureInfo(loader, onComplete, onError, width, height);
        _loaders.push(loaderInfo);

        loader.load(request);
    }

    private function onLoadPictureComplete(e:Event):void
    {
        var loaderInfo:LoaderInfo = LoaderInfo(e.target);

        var loaderPictureInfo:LoaderPictureInfo = popLoader(loaderInfo.loader);

        var w:uint = loaderPictureInfo.width > 0 ? loaderPictureInfo.width : loaderInfo.width;
        var h:uint = loaderPictureInfo.height > 0 ? loaderPictureInfo.height : loaderInfo.height;

        var bmpData:BitmapData = new BitmapData(w, h);

        bmpData.draw(loaderInfo.loader.content);

        var bmp:Bitmap = new Bitmap(bmpData);

        var onComplete:Function = loaderPictureInfo.onComplete;

        onComplete(bmp);
    }

    private function onLoadPictureError(e:IOErrorEvent):void
    {
        var loaderInfo:LoaderInfo = LoaderInfo(e.currentTarget);

        Debug.log(StringUtil.substitute("Fail to load picture: {0}", loaderInfo.loaderURL));

        var loaderPictureInfo:LoaderPictureInfo = popLoader(loaderInfo.loader);

        var onError:Function = loaderPictureInfo.onError;

        if (onError != null)
            onError();
    }

    //! Remove loader  picture info from _loaders for specify target and return info.
    private function popLoader(target:Loader):LoaderPictureInfo
    {
        var result:LoaderPictureInfo;

        for (var i:uint; i < _loaders.length; i++)
        {
            var item:LoaderPictureInfo = _loaders[i];

            if (item.loader == target)
            {
                result = _loaders[i];
                _loaders.splice(i, 1);

                break;
            }
        }

        Debug.assert(result != null);

        return result;
    }
}
}
