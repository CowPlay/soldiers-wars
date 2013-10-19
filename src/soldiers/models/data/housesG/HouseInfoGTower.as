/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 6/14/13
 * Time: 10:20 AM
 * To change this template use File | Settings | File Templates.
 */
package soldiers.models.data.housesG
{
public class HouseInfoGTower extends HouseInfoG
{
    /*
     * Fields
     */

//    private var _soldierToShut:Soldier;
//    private var _tweenShutMoveX:Tween;
//    private var _tweenShutMoveY:Tween;
//    private var _bullet:Sprite;


    /*
     * Properties
     */

    public override function get type():String
    {
        return EHouseGType.EHGT_TOWER;
    }

    /*
     * Methods
     */

    //! If owner type == null -> type = neutral
    public function HouseInfoGTower()
    {
        super()
    }


//    public function shutOnSoldier(soldier:Soldier):void
//    {
////        _soldierToShut = soldier;
////        var bulletClass:Class = ResourceManagerRename.getBulletClassByOwner(this);
////        _bullet = new bulletClass();
////        _bullet.x = view.x;
////        _bullet.y = view.y - view.height;
////        _tweenShutMoveX = new Tween(_bullet, 'x', None.easeNone, _bullet.x, soldier.soldierView.x, 0.2, true);
////        _tweenShutMoveY = new Tween(_bullet, 'y', None.easeNone, _bullet.y, soldier.soldierView.y, 0.2, true);
////        _tweenShutMoveX.addEventListener(TweenEvent.MOTION_FINISH, didShutFinish);
//    }

//    private function didShutFinish(e:Event):void
//    {
////        _bullet = null;
////
////        if (_soldierToShut.soldierView != null)
////        {
////            _soldierToShut.soldierView.removeTweenEventListener();
////            _soldierToShut.cleanup();
////        }
////        _tweenShutMoveX.removeEventListener(TweenEvent.MOTION_FINISH, didShutFinish);
//    }
}
}
