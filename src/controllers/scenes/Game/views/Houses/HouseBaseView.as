/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 5/31/13
 * Time: 10:58 AM
 * To change this template use File | Settings | File Templates.
 */
package controllers.scenes.game.views.houses
{
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.GlowFilter;
import flash.geom.ColorTransform;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.utils.setTimeout;

//! Represents view\controller of house base
public class HouseBaseView
{
//    /*
//     * Fields
//     */
//    private var _textFieldSoldiersCount:TextField;
//    private var _textFormat:TextFormat;
//
//    //! Represents house view
//    private var _houseView:Sprite;
//
//    private var _auraView:Sprite;
//
//    private var _indicatorLevelUp:MovieClip;
//
//    private var _arrowView:ArrowView;
//
//
//    /*
//     * Properties
//     */
//    public function get arrow():ArrowView
//    {
//        return _arrowView;
//    }
//
//    /*
//     * Events
//     */
//
//    //TODO: move to update
//    public function didHousePlayerSelectionChanged(isSelect:Boolean):void
//    {
//        Debug.assert(_owner.ownerType == EHouseOwner.EHO_PLAYER);
//
//        _auraView.visible = isSelect;
//        _arrowView.show(isSelect);
//    }
//
//    //! Must call when owner type was changed
//    private function didOwnerTypeChanged():void
//    {
//        _ownerType = _owner.ownerType;
//
//        tryCreateAuraView();
//
//        tryCreateArrowView();
//
//        tryCreateHouseView();
//
//        tryCreateTextFieldSoldierCount();
//
//        tryCreateLevelUpIndicator();
//    }
//
//    private function didSoldiersCountChanged():void
//    {
//        _ownerSoldiersCount = _owner.soldierCount;
//
//        _textFieldSoldiersCount.text = String(_ownerSoldiersCount);
//        _textFieldSoldiersCount.setTextFormat(_textFormat);
//
//        if (_indicatorLevelUp)
//        {
//            //show/hide level up indicator
//            _indicatorLevelUp.visible = _owner.readyToUpdate;
//        }
//    }
//
//
//    private function didOwnerLevelChanged():void
//    {
//        _ownerLevel = _owner.level;
//
//        tryCreateHouseView();
//
//        tryCreateTextFieldSoldierCount();
//
//        if (_indicatorLevelUp)
//        {
//            //show/hide level up indicator
//            _indicatorLevelUp.visible = _owner.readyToUpdate;
//        }
//    }
//
//    //TODO: implement constaint for last time attack
//    public function didAttackOrHeal(damage:Number):void
//    {
//        var glowFilter:GlowFilter = new GlowFilter(damage < 0 ? 0xff0000 : 0x00ff00, 0.5, 12, 12);
//
//        this.filters = [glowFilter];
//
//        setTimeout(didAttackFinished, 200);
//    }
//
//    private function didAttackFinished():void
//    {
//        this.filters = [];
//    }
//
//    /*
//     * Methods
//     */
//
//
//    //! Default constructor
//    public function HouseBaseView(owner:HouseBase)
//    {
//        Debug.assert(owner != null);
//
//        _owner = owner;
//
//        tryCreateArrowView();
//
//        _houseEventHandler = new Sprite();
//
//        addChild(_houseEventHandler);
//
//        this.eventHandler = _houseEventHandler;
//    }
//
//
//    public  function update():void
//    {
//            didOwnerTypeChanged();
//            didOwnerLevelChanged();
//
//            didSoldiersCountChanged();
//
//        _houseView.scaleX = _owner.rotateLeftToRight ? 1 : -1;
//    }
//
//    /*
//     * Creators
//     */
//
//    private function tryCreateHouseView():void
//    {
//        //! Remove old house view if need
//        if (_houseView != null)
//        {
//            _houseEventHandler.removeChild(_houseView);
//            _houseView = null;
//        }
//
//        //Change house view
//        {
//            var houseClass:Class = ResourceLoader.getClass(ResourceManagerHouses.getHouseViewClass(_owner));
//            _houseView = new houseClass();
//
//            _houseEventHandler.addChild(_houseView);
//
//            _houseView.visible = Debug.SHOW_HOUSE;
//        }
//    }
//
//    private function tryCreateArrowView():void
//    {
//        if (_arrowView != null)
//        {
//            SceneGame(SceneBase.currentScene).didArrowRemove(this);
//
//            _arrowView.cleanup();
//            _arrowView = null;
//        }
//
//        if (_ownerType == EHouseOwner.EHO_PLAYER)
//        {
//            _arrowView = new ArrowView();
//
//            SceneGame(SceneBase.currentScene).didArrowCreate(this);
//        }
//    }
//
//    private function tryCreateAuraView():void
//    {
//        //! Remove old aura view if need
//        if (_auraView != null)
//        {
//            _houseEventHandler.removeChild(_auraView);
//            _auraView = null;
//        }
//
//        //change aura view
//        var auraClass:Class = ResourceLoader.getClass(ResourceManagerSceneGame.getHouseAura(_ownerType));
//
//        _auraView = new auraClass();
//        _auraView.visible = false;
//
//        _houseEventHandler.addChild(_auraView);
//    }
//
//    private function tryCreateLevelUpIndicator():void
//    {
//        if (_indicatorLevelUp != null)
//        {
//            _houseEventHandler.removeChild(_indicatorLevelUp);
//            _indicatorLevelUp = null;
//        }
//
//        if (_ownerType == EHouseOwner.EHO_PLAYER)
//        {
//            var indicatorClass:Class = ResourceLoader.getClass(ResourceManagerSceneGame.indicatorLevelUp);
//
//            _indicatorLevelUp = new indicatorClass();
//            _indicatorLevelUp.x = 11;
//            _indicatorLevelUp.y = -37;
//
//            _houseEventHandler.addChild(_indicatorLevelUp);
//
//            _indicatorLevelUp.visible = _owner.readyToUpdate;
//        }
//    }
//
//    private function tryCreateTextFieldSoldierCount():void
//    {
//        if (_textFieldSoldiersCount != null)
//        {
//            _houseEventHandler.removeChild(_textFieldSoldiersCount);
//            _textFieldSoldiersCount = null;
//        }
//
//        _textFieldSoldiersCount = new TextField();
//
//        _textFormat = new TextFormat();
//        _textFormat.font = "Arial";
//        _textFormat.size = 10;
//        _textFormat.bold = true;
//
//
//        _textFieldSoldiersCount.text = String(_owner.soldierCount);
//        _textFieldSoldiersCount.setTextFormat(_textFormat);
//        _textFieldSoldiersCount.selectable = false;
//        _textFieldSoldiersCount.width = 30;
//        _textFieldSoldiersCount.textColor = 0xFFFFFF;
//
//
//        _textFieldSoldiersCount.x = 0;
//        _textFieldSoldiersCount.y = -70;
//
//        _houseEventHandler.addChild(_textFieldSoldiersCount);
//    }
//
//
//    /*
//     * BaseView
//     */
//
//
//    protected  function showDebugData(e:Event):void
//    {
//
//        if (Debug.SHOW_HOUSE_FOUNDATION)
//        {
//            for each(var node:Node in _owner.foundation)
//            {
//                node.drawDebugData(0x222222);
//            }
//        }
//
//        if (Debug.SHOW_HOUSE_POSITION)
//        {
////            first create new instance of ColorTransform class
//            var ct:ColorTransform = new ColorTransform();
////            then assign our inputColor value to ColorTransforms color public property
//            ct.color = 0xB82631;
////            at the end assign the ColorTransform class to out destination object which is guineaPig
//            _owner.currentPosition.view.transform.colorTransform = ct;//  drawDebugData(0xB82631);
//
//            _owner.currentPosition.drawDebugData(0xB82631);
//        }
//
//        if (Debug.SHOW_HOUSE_EXIT)
//        {
//            _owner.houseExitPosition.drawDebugData(0xFFFF00);
//        }
//
//
//        super.showDebugData(e);
//    }
//
//
//    public function magnetizeFromTargetHouse(targetHouse:HouseBase):void
//    {
//        _arrowView.magnetizeFromTargetHouse(targetHouse);
//    }
//
//
//    /*
//     * Event handlers
//     */
//
//
//    protected  function didMouseOver(e:MouseEvent):void
//    {
//        _auraView.visible = true;
//
//        //hide arrow
//        if (_owner.ownerType == EHouseOwner.EHO_PLAYER)
//        {
//            _arrowView.show(false);
//        }
//
//
//        super.didMouseOver(e);
//    }
//
//    protected  function didMouseOut(e:MouseEvent):void
//    {
//        if (_owner.ownerType == EHouseOwner.EHO_PLAYER && HouseBase.selectedHouses.length > 0)
//        {
//            HouseBase.selectHousePlayer(_owner);
//        }
//        else
//        {
//            _auraView.visible = false;
//        }
//
//        super.didMouseOut(e);
//    }
//
//
//    protected  function didMouseDown(e:MouseEvent):void
//    {
//        if (_ownerType == EHouseOwner.EHO_PLAYER)
//        {
//            HouseBase.selectHousePlayer(_owner);
//        }
//
//        super.didMouseDown(e);
//    }
//
//
//    //! Override from ButtonBase
//    protected  function didMouseUp(e:MouseEvent):void
//    {
//        //generate soldiers, update view
//        _owner.didMouseUp();
//
//        _auraView.visible = true;
//
//        super.didMouseUp(e);
//    }
//
//    protected  function didMouseUpOut(e:MouseEvent):void
//    {
//        HouseBase.clearHouseSelection();
//
//        super.didMouseUpOut(e);
//    }
//
//    protected  function didMouseMove(e:MouseEvent):void
//    {
//        var mouseEvent:MouseEvent = e as MouseEvent;
//
//        updateArrowSize(mouseEvent);
//
//        super.didMouseMove(e);
//
//        if (HouseBase.selectedHouses.length > 0)
//        {
//            for each(var houseBase:HouseBase in HouseBase.selectedHouses)
//            {
//                if (houseBase != _owner)
//                {
//                    houseBase.magnetizeFromTargetHouse(_owner);
//                }
//
//            }
//        }
//    }
//
//    protected  function didMouseMoveOut(e:MouseEvent):void
//    {
//        var mouseEvent:MouseEvent = e as MouseEvent;
//
//        updateArrowSize(mouseEvent);
//
//        super.didMouseMoveOut(e);
//    }
//
//    private static function updateArrowSize(e:MouseEvent):void
//    {
//        for each(var house:HouseBase in HouseBase.selectedHouses)
//        {
//            if (house.view._arrowView != null)
//            {
//                house.view._arrowView.updateArrowSize(e);
//            }
//        }
//    }
//
//    protected  function didMouseDoubleClick(e:MouseEvent):void
//    {
//        if (_owner.readyToUpdate && _owner.ownerType == EHouseOwner.EHO_PLAYER)
//        {
//            _owner.didLevelUp();
//        }
//
//        super.didMouseDoubleClick(e);
//    }
}
}
