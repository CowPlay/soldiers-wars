/*
 * Copyright gregory.tkach (c) 2014.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 1/7/14
 * Time: 12:19 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.views.game.ui
{
import controllers.IController;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import views.implementations.ViewBase;

public class ViewProgress extends ViewBase
{
    /*
     * Fields
     */
    private var _source:DisplayObjectContainer;

    private var _targetsViews:Array;
    private var _targetsTexts:Array;

    private var _targetRadius:uint;

    private var _targets1Count:uint;
    private var _targets2Count:uint;
    private var _targets3Count:uint;

    /*
     * Events
     */
    public function onTargetChangeStatus(index:uint, complete:Boolean, text:String = "text"):void
    {
        var targetView:Sprite = _targetsViews[index];

        targetView.graphics.beginFill(complete ? 0x00ff00 : 0xff0000);
        targetView.graphics.drawCircle(0, 0, _targetRadius);
        targetView.graphics.endFill();

        var targetText:TextField = _targetsTexts[index];
        targetText.text = text;
    }


    /*
     * Methods
     */

    //! Default constructor
    public function ViewProgress(controller:IController, targets1Count:uint, targets2Count:uint, targets3Count:uint)
    {
        _source = new Sprite();
        super(controller, _source);

        _targets1Count = targets1Count;
        _targets2Count = targets2Count;
        _targets3Count = targets3Count;

        init();
    }

    private function init():void
    {
        _targetRadius = 15;

        var textFormat:TextFormat = new TextFormat("Verdana", 10, null, true);

        _targetsViews = [];
        _targetsTexts = [];

        var count:uint = _targets1Count + _targets2Count + _targets3Count;

        for (var i:uint = 0; i < count; i++)
        {
            var targetView:Sprite = new Sprite();
            targetView.graphics.beginFill(0x000000);
            targetView.graphics.drawCircle(0, 0, _targetRadius);
            targetView.graphics.endFill();

            _source.addChild(targetView);

            _targetsViews.push(targetView);

            var targetText:TextField = new TextField();
            targetText.defaultTextFormat = textFormat;
            targetText.text = "TEXT";
            targetText.autoSize = TextFieldAutoSize.LEFT;
            targetText.selectable = false;

            _source.addChild(targetText);

            _targetsTexts.push(targetText);

        }
    }

    override public function placeViews(fullscreen:Boolean):void
    {
        var startX:uint = _targetRadius;
        var startY:uint = _targetRadius;

        var count:uint = _targets1Count + _targets2Count + _targets3Count;

        for (var i:uint = 0; i < count; i++)
        {
            var additionalOffset:uint = 0;

            if (i == (_targets1Count - 1) || i == (_targets1Count + _targets2Count - 1))
            {
                additionalOffset = 10;
            }

            var targetView:Sprite = _targetsViews[i];
            targetView.x = startX;
            targetView.y = startY;

            var targetText:TextField = _targetsTexts[i];

            targetText.x = targetView.x + _targetRadius;
            targetText.y = targetView.y - targetText.textHeight / 2;

            startY += targetView.height + additionalOffset;
        }


        super.placeViews(fullscreen);
    }
}
}
