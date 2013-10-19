/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 18.10.13
 * Time: 19:01
 * To change this template use File | Settings | File Templates.
 */
//TODO:finish class
package soldiers.controllers.popups.universityMM
{
import controls.IControlScene;
import controls.implementations.ControlBase;

public class ControlPopupUniversityMMItem extends ControlBase
{

    /*
     * Fields
     */
    private var _sourceViewTyped:gPopupBakeryItem;


    /*
     * Properties
     */


    /*
     * Methods
     */

    public function ControlPopupUniversityMMItem(sceneOwner:IControlScene)
    {
        super (sceneOwner);

        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gPopupBakeryItem();
        setSourceView(_sourceViewTyped);
    }
}
}
