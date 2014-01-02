/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/6/13
 * Time: 1:44 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerPath
{
public class PathsInfo
{
    /*
     * Fields
     */
    private var _from:GridCell;
    private var _to:GridCell;


    //! Array which contains several paths from start node to end node
    private var _savedPaths:Array;

    /*
     * Properties
     */

    public function  get nodeFrom():GridCell
    {
        return _from;
    }

    public function  get nodeTo():GridCell
    {
        return _to;
    }


    public function get savedPaths():Array
    {
        var result:Array = [];

        for each(var path:Array in _savedPaths)
        {
            var resultPath:Array = [];

            for each(var cell:GridCell in path)
            {
                resultPath.push(cell);
            }

            result.push(resultPath);
        }

        return result;
    }

    /*
     * Methods
     */
    //! Default initializer
    public function PathsInfo(from:GridCell, to:GridCell)
    {
        Debug.assert(from != null);
        Debug.assert(to != null);

        _from = from;
        _to = to;

        _savedPaths = [];
//        generateLines();
    }


    public function addPath(path:Array):void
    {
        Debug.assert(path != null);
        _savedPaths.push(path);
    }

//    private function generateLines():void
//    {
//        var lastLineAngle:Number = ConstantsBase.INDEX_NONE;
//
//        var linePoints:Array = [];
//
//        var startPoint0:Node = null;
//        var endPoint0:Node = null;
//
//        var startPoint1:Node = null;
//        var endPoint1:Node = null;
//
//        for (var i:int = 0; i < _pathPoints.length; i++)
//        {
//            if (startPoint0 == null)
//            {
//                startPoint0 = _pathPoints[i];
//
//                continue;
//            }
//            else if (endPoint0 == null)
//            {
//                endPoint0 = _pathPoints[i];
//                startPoint1 = _pathPoints[i];
//
//                continue;
//            }
//            else if (endPoint1 == null)
//            {
//                endPoint1 = _pathPoints[i];
//            }
//            else
//            {
//                //update points
//                startPoint0 = endPoint0;
//
//                endPoint0 = endPoint1;
//                startPoint1 = endPoint1;
//
//                endPoint1 = _pathPoints[i];
//            }
//
//
//            var angle:Number = getAngleBetweenLines(startPoint0, endPoint0, startPoint1, endPoint1);
//
//            if (angle == lastLineAngle)
//            {
//
//            }
//            else
//            {
//
//            }
//        }
//
////        override protected function step():void {
////            var vector1:Object = {x: B.x - A.x, y:  B.y - A.y};
////            var vector2:Object = {x: D.x - C.x, y:  D.y - C.y};
////
////            var dotProduct:Number = vector1.x * vector2.x + vector1.y * vector2.y;
////
////            var magnitudeAB = Point.distance(A, B);
////            var magnitudeCD = Point.distance(C, D);
//
////            var angle = Math.acos(dotProduct / (magnitudeAB * magnitudeCD));
////            clearText();
////            print("AB = ["  + vector1.x + " " + vector1.y + "]");
////            print("CD = ["  + vector2.x + " " + vector2.y + "]");
////            print("dot product(AB·CD) = "  + dotProduct);
////            print("angle between AB and CD(deg.) = "  + rd(radToDeg(angle)));
////        }
//    }

//    //! Returns angle between 2 lines in degrees
//    private static function getAngleBetweenLines(startPoint0:Node, endPoint0:Node, startPoint1:Node, endPoint1:Node):Number
//    {
//        Debug.assert(startPoint0 != null);
//        Debug.assert(endPoint0 != null);
//        Debug.assert(startPoint1 != null);
//        Debug.assert(endPoint1 != null);
//
//        var result:Number;
//
//        var vectorX0:Number = endPoint0.column - startPoint0.column;
//        var vectorY0:Number = endPoint0.row - startPoint0.row;
//
//        var vectorX1:Number = endPoint1.column - startPoint1.column;
//        var vectorY1:Number = endPoint1.row - startPoint1.row;
//
//        var dotProduct:Number = vectorX0 * vectorX1 + vectorY0 * vectorY1;
//
//        var length0:Number = startPoint0.getDistanceTo(endPoint0);
//        var length1:Number = startPoint1.getDistanceTo(endPoint1);
//
//        result = radToDeg(Math.acos(dotProduct / (length0 * length1)));
//
//        return result;
//    }

//    protected static function radToDeg(n:Number):Number
//    {
//        return n / Math.PI * 180;
//    }
}
}
