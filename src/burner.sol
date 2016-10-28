pragma solidity ^0.4.2;

import 'ds-token/token.sol';
import 'supply_manager.sol';

contract DSTokenBurner
{
    DSToken _token;
    DSTokenSupplyManager _supply_manager;
    function DSTokenBurner(DSToken token, DSTokenSupplyManager supply_manager) {
        _token = token;
        _supply_manager = supply_manager;
    }
    function burn(uint amount) {
        _token.transferFrom(msg.sender, this, amount);
        _supply_manager.destroy(amount);
    }
    function burn() {
        _supply_manager.destroy(_token.balanceOf(this));
    }
}
