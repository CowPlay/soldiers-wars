/**
 * Created with IntelliJ IDEA.
 * User: developer
 * Date: 6/10/13
 * Time: 8:47 PM
 * To change this template use File | Settings | File Templates.
 */
package src
{
import core.Debug;
import core.IDisposable;

import models.Game.*;
import models.Players.Player;

//! Base class of all game types
public class GameBase implements IDisposable
{
    /*
     * Fields
     */
    private var _isFinishOrDone:Boolean;

    protected var _gameOwner:Player;
    protected var _gameOwnerOpponent:Player;

    /*
     * Properties
     */

    public function get isFinishOrDone():Boolean
    {
       return _isFinishOrDone;
    }

    public function get gameOwner():Player
    {
        return _gameOwner;
    }

    public function get gameOwnerOpponent():Player
    {
        return _gameOwnerOpponent;
    }

    public function get type():EGameType
    {
        Debug.assert(false);
        return null;
    }

    /*
     * Events
     */

    public function didPlayerWin(winner:Player):void
    {
        Debug.assert(winner != null);

        _isFinishOrDone = true;
    }

    /*
     * Methods
     */

    //! Default constructor
    public function GameBase()
    {
    }

    //! Destructor
    public function cleanup():void
    {
        _gameOwner.cleanup();
        _gameOwnerOpponent.cleanup();
    }
}
}
