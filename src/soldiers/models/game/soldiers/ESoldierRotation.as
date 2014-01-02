/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 6/5/13
 * Time: 12:31 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.game.soldiers
{
import soldiers.models.game.managerPath.GridCell;

public class ESoldierRotation
{
    public static const ESR_UP:int = 1;
    public static const ESR_UP_RIGHT:int = 2;
    public static const ESR_RIGHT:int = 3;
    public static const ESR_DOWN_RIGHT:int = 4;
    public static const ESR_DOWN:int = 5;
    public static const ESR_DOWN_LEFT:int = 6;
    public static const ESR_LEFT:int = 7;
    public static const ESR_UP_LEFT:int = 8;

//    TODO: detect rotation by x, y length and sign
    public static function getRotation(from:GridCell, to:GridCell):int
    {
        Debug.assert(from != null);
        Debug.assert(to != null);
        Debug.assert(from.row != to.row || from.column != to.column);

        var result:int;

        if (from.row > to.row)
        {
            if (from.column == to.column)
            {
                result = ESoldierRotation.ESR_DOWN;
            }
            else if (from.column < to.column)
            {
                result = ESoldierRotation.ESR_DOWN_RIGHT;
            }
            else
            {
                result = ESoldierRotation.ESR_DOWN_LEFT;
            }
        }
        else if (from.row < to.row)
        {
            if (from.column == to.column)
            {
                result = ESoldierRotation.ESR_UP;
            }
            else if (from.column < to.column)
            {
                result = ESoldierRotation.ESR_UP_RIGHT;
            }
            else
            {
                result = ESoldierRotation.ESR_UP_LEFT;
            }
        }
        else
        {
            if (from.column > to.column)
            {
                result = ESoldierRotation.ESR_LEFT;
            }
            else
            {
                result = ESoldierRotation.ESR_RIGHT;
            }
        }

        return result;
    }
}
}
