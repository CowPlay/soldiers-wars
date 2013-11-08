/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 21.10.13
 * Time: 10:55
 * To change this template use File | Settings | File Templates.
 */
package soldiers.popups.merlinTower
{
import controls.IView;
import controls.implementations.ControlBase;

import flash.geom.Point;

import models.interfaces.states.IState;

public class ControlPopupMerlinTowerItem extends ControlBase
{
    /*
     *Fields
     */
    private var _sourceView:gPopupMerlinTowerItem;

    private var _skillViews:Array;

    /*
     *Properties
     */

    /*
     *Methods
     */
    public function ControlPopupMerlinTowerItem(parent:IView)
    {
        _sourceView = new gPopupMerlinTowerItem();
        super(parent, _sourceView);

        init();
    }

    private function init():void
    {
        _skillViews = [];

        for (var i:int = 0; i < 7; i++)
        {
            var skillView:IView = new SkillView(this);
            _sourceView.addChild(skillView.sourceView);
            _skillViews.push(skillView);
        }

    }


    public override function placeViews():void
    {
        Debug.assert(_skillViews.length == 7);

        super.placeViews();

        var skillStandard:IView;
        skillStandard = _skillViews [0];

        var startPosition:Point = new Point(-35, -115);

        for (var i:int = 0; i < 7; i++)
        {
            var objectToIndex:IView = _skillViews[i];
            objectToIndex.placeViews();

            objectToIndex.sourceView.x = startPosition.x;
            objectToIndex.sourceView.y = startPosition.y;

            if (i < 3)
            {
                startPosition.y += objectToIndex.sourceView.height + 16;

                if (i == 2)
                {
                    startPosition.x = 35;
                    startPosition.y = -115;
                }
            }
            else
            {
                if (i > 1 && i < 5)
                {
                    startPosition.y += objectToIndex.sourceView.height + 16;
                }
                else
                {
                    if (i == 5)
                    {
                        startPosition.x = 0;
                        startPosition.y = 120;
                    }

                }
            }
        }
    }

    /*
     * IActionDelegate
     */


    public override function cleanup():void
    {
        for each(var skill:IView in _skillViews)
        {
            skill.cleanup();
            skill = null;
        }
        _skillViews = null;

        _sourceView = null;

        super.cleanup();
    }
}
}
