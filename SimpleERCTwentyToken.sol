// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleERCTwentyToken is ERC20, Ownable {
    uint256 initSupply = 100 * 10**uint256(decimals());

    // events for mint and burn; did not create event for transfer as it 
    // is already available in ERC20
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed account, uint256 value);
    
    constructor() ERC20("SimpleERCTwenty", "SET") Ownable(_msgSender()) {
        // set the initial supply
        _mint(_msgSender(), initSupply);
    }

    // mint function to mint tokens to a provided address; only owner can mint
    // did not create onlyOwner modifier as it is already available in Ownable
    function mint(address _account, uint256 _value) public onlyOwner {
        _mint(_account, _value);
        emit Mint(_account, _value);
    }

    // burn function to burn tokens; any user can burn
    function burn(uint256 _value) public {
        _burn(_msgSender(), _value);
        emit Burn(_msgSender(), _value);
    }

    // transfer tokens from one address to another
    function transfer(address _to, uint256 _value) public override returns (bool) {
        _transfer(_msgSender(), _to, _value);
        emit Transfer(_msgSender(), _to, _value);
        return true; 
    }
}
  