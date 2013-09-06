/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 7/2/13
 * Time: 8:06 PM
 * To change this template use File | Settings | File Templates.
 */
package core.models.resources
{
import core.Debug;
import core.IDisposable;
import core.Utils;

import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLRequest;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;

public class LoaderSWF implements IDisposable
{

    /*
     * Static fields
     */

    //key - scene type, value - specify loader.
    private static var _loaders:Array = [];


    /*
     * Static methods
     */

    public static function getClass(className:String):Class
    {
        var result:Class = null;

        for each(var loader:LoaderSWF in _loaders)
        {
            if (!loader.hasClass(className))
                continue;

            result = loader.getClass(className);
        }

        Debug.assert(result != null);

        return result;
    }

    /*
     * Fields
     */
    private var _libName:String;
    private var _request:URLRequest;
    private var _context:LoaderContext;
    private var _callbackComplete:Function;

    private var _loader:Loader;
    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function LoaderSWF(libName:String)
    {
        Debug.assert(libName != null);

        _loader = new Loader();
        _loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        _loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
        _loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);

        _libName = libName;

        _request = new URLRequest(_libName);

        _context = new LoaderContext(false, ApplicationDomain.currentDomain);

        _loaders.push(this);
    }

    //! completeHandler signature - completeHandler(e:Event):void
    public function load(callback:Function):void
    {
        Debug.assert(callback != null);

        _callbackComplete = callback;

        _loader.load(_request, _context);
    }

    private function completeHandler(e:Event):void
    {
        _loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, completeHandler);

        _callbackComplete();
    }

    private function ioErrorHandler(e:IOErrorEvent):void
    {
        _loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);

        Debug.assert(false, "ResourceLoader::ioErrorHandler" + e.text);
    }

    private function securityErrorHandler(e:Event):void
    {
        _loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);

        Debug.assert(false, "ResourceLoader::securityErrorHandler.");
    }

    private function hasClass(className:String):Boolean
    {
        return  _loader.contentLoaderInfo.applicationDomain.hasDefinition(className);
    }

    private function getClass(className:String):Class
    {
        return _loader.contentLoaderInfo.applicationDomain.getDefinition(className) as Class;
    }


    /*
     * IDisposable
     */

    public function cleanup():void
    {
        Utils.removeValue(_loaders, this);

        _loader.unload();
        //todo:implement
        Debug.assert(false);
    }
}
}
