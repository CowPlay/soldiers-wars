/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/3/13
 * Time: 9:38 AM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.base.views
{
import controllers.scenes.base.SceneBase;

import flash.display.MovieClip;

public class SceneBaseUI extends MovieClip
{
    /*
     * Fields
     */
    private var _owner:SceneBase;
    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function SceneBaseUI(owner:SceneBase)
    {
        _owner = owner;

        init();
    }

    private function init():void
    {

    }

}
}
