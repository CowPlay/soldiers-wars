/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 21.10.13
 * Time: 10:55
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.popups.merlinTower
{
import controls.IControl;
import controls.IControlScene;
import controls.implementations.ControlBase;

import flash.geom.Point;

public class ControlPopupMerlinTowerItem extends ControlBase
{
    /*
     *Fields
     */
    private var _sourceViewTyped:gPopupMerlinTowerItem;

    private var _skillViews:Array;

    /*
     *Properties
     */

    /*
     *Methods
     */
    public function ControlPopupMerlinTowerItem(sceneOwner:IControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gPopupMerlinTowerItem();
        setSourceView(_sourceViewTyped);

        _skillViews = [];

        var skillView0:IControl = new SkillView(sceneOwner);
        skillView0.sourceView.x = 35;
        skillView0.sourceView.y = -115;
        _sourceViewTyped.addChild(skillView0.sourceView);
        _skillViews.push(skillView0);

        var skillView1:IControl = new SkillView(sceneOwner);
        skillView1.sourceView.x = -35;
        skillView1.sourceView.y = -115;
        _sourceViewTyped.addChild(skillView1.sourceView);
        _skillViews.push(skillView1);

        var skillView2:IControl = new SkillView(sceneOwner);
        _sourceViewTyped.addChild(skillView2.sourceView);
        _skillViews.push(skillView2);

        var skillView3:IControl = new SkillView(sceneOwner);
        _sourceViewTyped.addChild(skillView3.sourceView);
        _skillViews.push(skillView3);

        var skillView4:IControl = new SkillView(sceneOwner);
        _sourceViewTyped.addChild(skillView4.sourceView);
        _skillViews.push(skillView4);

        var skillView5:IControl = new SkillView(sceneOwner);
        _sourceViewTyped.addChild(skillView5.sourceView);
        _skillViews.push(skillView5);

        var skillView6:IControl = new SkillView(sceneOwner);
        _sourceViewTyped.addChild(skillView6.sourceView);
        _skillViews.push(skillView6);

    }
    //TODO:finish method
    public override function placeViews():void
    {
        super.placeViews();

        var skillStandard:IControl = _skillViews [0];

        var startPosition:Point = new Point(-35, -115);

        for (var i:int = 0; i < 7; i++)
        {
            var objectToIndex:IControl = _skillViews[i];
            objectToIndex.placeViews();

            objectToIndex.sourceView.x = startPosition.x;
            objectToIndex.sourceView.y = startPosition.y;

            if (i > 0 && i < 3)
            {
                startPosition.y = -40 ;
            }
            else
            {
                if (i > 2 && i < 6)
                {
                    startPosition.x = 0;
                    startPosition.y = 0;
                }
                else
                {
                    if(i == 6)
                    {
                        startPosition.x = 0;
                        startPosition.y = 70;
                    }

                }
            }

        }
    }

    /*
     * IActionDelegate
     */
}
}
