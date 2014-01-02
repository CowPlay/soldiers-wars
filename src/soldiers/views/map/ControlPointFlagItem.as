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
package soldiers.views.map
{
import views.IView;
import views.implementations.ViewBase;

import flash.events.MouseEvent;

import soldiers.GameInfo;

public class ControlPointFlagItem extends ViewBase
{
    /*
     *Fields
     */
    private var _sourceViewTyped:gFlag;

    private var _buttonFlag:ViewBase;

    private var _stars:Array;

    /*
     *Properties
     */

    /*
     *Methods
     */
    public function ControlPointFlagItem(parent:IView)
    {
        super(parent);

        init();
    }

    private function init():void
    {
        _sourceViewTyped = new gFlag();
        setSourceView(_sourceViewTyped);

        _buttonFlag = new ViewBase(this, _sourceViewTyped.flag);
        //TODO: implement
//        _buttonFlag.controller = this;

        _stars = [];
    }

    public function addStars(count:int):void
    {

        if (count > 0)
        {
            var star0:IView = new ControlStar(this);
            star0.source.x = 0;
            star0.source.y = 15;
            _sourceViewTyped.point.addChild(star0.source);
            _stars.push(star0);
        }
        if (count > 1)
        {
            var star1:IView = new ControlStar(this);
            star1.source.x = 15;
            star1.source.y = 20;
            _sourceViewTyped.point.addChild(star1.source);
            _stars.push(star1);
        }
        if (count > 2)
        {
            var star2:IView = new ControlStar(this);
            star2.source.x = 30;
            star2.source.y = 15;
            _sourceViewTyped.point.addChild(star2.source);
            _stars.push(star2);
        }
    }

    public override function cleanup():void
    {
        _buttonFlag.cleanup();
        _buttonFlag = null;

        for each(var star:IView in _stars)
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
    public override function onControlMouseClick(target:IView, e:MouseEvent):Boolean
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

