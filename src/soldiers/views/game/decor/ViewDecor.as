/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/5/14
 * Time: 11:33 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.decor
{
import controllers.IController;

import flash.display.DisplayObjectContainer;
import flash.geom.Point;

import soldiers.GameInfo;

import soldiers.models.game.decor.Decor;
import soldiers.models.game.decor.EDecorType;
import soldiers.models.game.managerPath.GridCell;

import views.implementations.ViewBase;

public class ViewDecor extends ViewBase
{
    /*
     * Static methods
     */

    private static function getClass(type:String):Class
    {
        var result:Class = null;


        switch (type)
        {
            case EDecorType.EDT_0:
            {
                result = gDecor00;
                break;
            }
            default :
            {
                Debug.assert(false);
                break;
            }
        }

        return result;
    }

    /*
     * Fields
     */
    private var _position:Point;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function ViewDecor(controller:IController, entry:Decor)
    {
        var sourceClass:Class = getClass(entry.type);
        var source:DisplayObjectContainer = new sourceClass;
        super(controller, source);

        _position = entry.position;
    }


    override public function placeViews(fullscreen:Boolean):void
    {
        super.placeViews(fullscreen);

        var cellEntry:GridCell = GameInfo.instance.managerGame.managerPath.getCell(_position);
        source.x = cellEntry.view.source.x;
        source.y = cellEntry.view.source.y;
    }
}
}
