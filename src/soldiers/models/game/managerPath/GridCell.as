package soldiers.models.game.managerPath{import views.IView;import core.DisposableObject;import flash.display.DisplayObjectContainer;import flash.display.Sprite;public class GridCell extends DisposableObject{    /*     * Fields     */    //Our interface variables since we inherit from MovieClip x and y are already set    private var _parentNode:GridCell;    private var _f:Number;    private var _g:Number;    private var _h:Number;    private var _traversable:Boolean = true;    private var _row:int;    private var _column:int;    private var _view:IView;    /*     * Properties     */    public function get view():IView    {        return _view;    }    public function set view(value:IView):void    {        _view = value;    }    public function get parentNode():GridCell    {        return _parentNode;    }    public function set parentNode(value:GridCell):void    {        _parentNode = value;    }    public function get f():Number    {        return _f;    }    public function set f(value:Number):void    {        _f = value;    }    public function get g():Number    {        return _g;    }    public function set g(value:Number):void    {        _g = value;    }    public function get h():Number    {        return _h;    }    public function set h(value:Number):void    {        _h = value;    }    public function get traversable():Boolean    {        return _traversable;    }    public function set traversable(value:Boolean):void    {        if (_traversable == value)            return;        _traversable = value;    }    public function get row():int    {        return _row;    }    public function get column():int    {        return _column;    }    /*     * Methods     */    //! Default constructor    public function GridCell(column:int, row:int)    {        _row = row;        _column = column;        _traversable = true;    }    public function drawDebugData(color:uint):void    {        Debug.assert(false);//        _view.sourceView.graphics.clear();//        _view.graphics.lineStyle(2);//        _view.graphics.beginFill(color);//        _view.graphics.drawCircle(0, 0, _view.height / 4);//        _view.graphics.endFill();    }    public function toString():String    {        return String(_row) + ":" + String(_column);    }    public function getDistanceTo(other:GridCell):Number    {        Debug.assert(other != null);        return Math.sqrt(Math.pow(this.row - other.row, 2) + Math.pow(this.column - other.column, 2));    }    public override function cleanup():void    {        _view = null;        _parentNode = null;        super.cleanup();    }}}