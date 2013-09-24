/*
 * Copyright gregory.tkach (c) 2013.
 */

/**
 * Created with IntelliJ IDEA.
 * User: gregorytkach
 * Date: 9/19/13
 * Time: 10:03 PM
 * To change this template use File | Settings | File Templates.
 */
package models.data
{
import models.IPlayerInfo;

public class PlayerInfo implements IPlayerInfo
{
    /*
     * Fields
     */

    private var _currencySoft:Number;
    private var _currencyHard:Number;

    /*
     * Properties
     */

    /*
     * Methods
     */

    //! Default constructor
    public function PlayerInfo()
    {
    }

    /*
     * IPlayerInfo
     */
    public function get currencySoft():Number
    {
        return _currencySoft;
    }

    public function set currencySoft(value:Number):void
    {
        if (_currencySoft == value)
            return;

        _currencySoft = value;
    }

    public function get currencyHard():Number
    {
        return _currencyHard;
    }

    public function set currencyHard(value:Number):void
    {

        if (_currencyHard == value)
            return;

        _currencyHard = value;
    }

    /*
     * ISerializable
     */


    public function serialize():Object
    {
        Debug.assert(false, "Please implement it in derived classes.");


        return null;
    }

    public function deserialize(data:Object):void
    {
        Debug.assert(false, "Please implement it in derived classes.");
    }

    /*
     * IDisposable
     */

    public function cleanup():void
    {
    }
}
}
