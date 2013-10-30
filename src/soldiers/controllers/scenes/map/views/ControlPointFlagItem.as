/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: user
 * Date: 31.10.13
 * Time: 14:12
 * To change this template use File | Settings | File Templates.
 */
package soldiers.controllers.scenes.map.views
{
import controls.IControl;
import controls.IControlScene;
import controls.implementations.ControlBase;
import controls.implementations.ControlSpriteBase;

import flash.events.MouseEvent;

import soldiers.models.GameInfo;

public class ControlPointFlagItem extends ControlBase
{
    /*
     *Fields
     */
    private var _sourceViewTyped:gFlag;

    private var _buttonFlag:ControlSpriteBase;

    private var _stars:Array;

    /*
     *Properties
     */

    /*
     *Methods
     */
    public function ControlPointFlagItem(sceneOwner:IControlScene)
    {
        super(sceneOwner);

        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gFlag();
        setSourceView(_sourceViewTyped);

        _buttonFlag = new ControlSpriteBase(sceneOwner, _sourceViewTyped.flag);
        _buttonFlag.actionDelegate = this;

        _stars = [];


    }

    public function addStars(count:int):void
    {

        if (count > 0)
        {
            var star0:IControl = new ControlStar(sceneOwner);
            star0.sourceView.x = 0;
            star0.sourceView.y = 15;
            _sourceViewTyped.point.addChild(star0.sourceView);
            _stars.push(star0);
        }
        if (count > 1)
        {
            var star1:IControl = new ControlStar(sceneOwner);
            star1.sourceView.x = 15;
            star1.sourceView.y = 20;
            _sourceViewTyped.point.addChild(star1.sourceView);
            _stars.push(star1);
        }
        if (count > 2)
        {
            var star2:IControl = new ControlStar(sceneOwner);
            star2.sourceView.x = 30;
            star2.sourceView.y = 15;
            _sourceViewTyped.point.addChild(star2.sourceView);
            _stars.push(star2);
        }
    }

    public override function cleanup():void
    {
        _buttonFlag.cleanup();
        _buttonFlag = null;

        for each(var star:IControl in _stars)
        {
            star.cleanup();
            star = null;
        }

        _sourceViewTyped = null;

        super.cleanup();
    }

    /*
     *ActionDelegate
     */
    public override function onControlMouseClick(target:IControl, e:MouseEvent):Boolean
    {
        var result:Boolean = super.onControlMouseClick(target, e);

        if (!result)
        {
            switch (target)
            {
                case _buttonFlag:
                {
                    GameInfo.instance.startStubGame();
                    result = true;
                    break;
                }
                default :
                {
                    Debug.assert(false);
                    break;
                }
            }
        }

        return result;

    }
}
}

