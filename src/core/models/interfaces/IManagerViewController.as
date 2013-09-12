/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/6/13
 * Time: 11:48 AM
 * To change this template use File | Settings | File Templates.
 */
package core.models.interfaces
{
import core.controls.IControlScene;

import flash.display.MovieClip;

public interface IManagerViewController
{
    /*
     * Properties
     */

    //! Get root view for all scenes
    function get rootView():MovieClip;

    function get currentScene():IControlScene;

    /*
     * Methods
     */

    //! Returns new instance of scene by type
    function createSceneByType(type:String):IControlScene;

    //! Set current scene by type
    function setScene(type:String):void;

}
}
