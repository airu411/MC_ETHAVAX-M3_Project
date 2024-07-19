// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract SimpleERCTwentyToken is ERC20, ERC20Burnable, Ownable {
    uint256 initSupply = 100 * 10**uint256(decimals());

    constructor() ERC20("SimpleERCTwenty", "SET") Ownable(msg.sender) {
        _mint(msg.sender, initSupply);
    }

    function mint(address _account, uint256 _value) public onlyOwner {
        _mint(_account, _value);
    }
}
  