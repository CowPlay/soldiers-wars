/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/17/13
 * Time: 4:53 PM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.managerPath
{
//! Represents line of path which contains nodes
public class PathLine
{
    /*
     * Fields
     */

    private var _points:Array;

    /*
     * Properties
     */

    public function get points():Array
    {
        return _points;
    }

    public function get startPoint():GridCell
    {
        return null;
    }

    public function get endPoint():GridCell
    {
        return null;
    }

    /*
     * Methods
     */
    //! Default constructor
    public function PathLine(points:Array)
    {
        Debug.assert(points != null);
        Debug.assert(points.length > 0);

        _points = points;
    }


}
}
