/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/12/13
 * Time: 9:33 AM
 * To change this template use File | Settings | File Templates.
 */
package core.controls.implementations
{
import core.Debug;
import core.controls.IControlScene;

import flash.display.DisplayObjectContainer;

public class ControlSpriteBase extends ControlBase
{
    /*
     * Fields
     */

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ControlSpriteBase(sceneOwner:IControlScene, sourceViewValue:DisplayObjectContainer)
    {
        super(sceneOwner);

        Debug.assert(sourceViewValue != null);

        setSourceView(sourceViewValue);
    }
}
}
