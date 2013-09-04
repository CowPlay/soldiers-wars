/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/4/13
 * Time: 4:35 PM
 * To change this template use File | Settings | File Templates.
 */
package core.models.resources
{
import core.Debug;

import flash.display.Loader;

public class LoaderPictureInfo
{
    /*
     * Fields
     */

    public var loader:Loader;
    public var onComplete:Function;
    public var onError:Function;
    public var width:uint;
    public var height:uint;

    /*
     * Methods
     */

    //! Default constructor
    public function LoaderPictureInfo(loaderValue:Loader, onCompleteCallback:Function, onErrorCallback:Function, widthValue:uint, heightValue:uint)
    {
        loader = loaderValue;
        onComplete = onCompleteCallback;
        onError = onErrorCallback;
        width = widthValue;
        height = heightValue;
    }
}
}
