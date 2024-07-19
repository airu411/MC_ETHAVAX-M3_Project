// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract SimpleERCTwentyToken is ERC20, ERC20Burnable, Ownable {
    uint256 initSupply = 100 * 10**uint256(decimals());

    event Minted(address indexed to, uint256 amount);
    event Burned(address indexed from, uint256 amount);

    constructor() ERC20("SimpleERCTwenty", "SET") Ownable(msg.sender) {
        _mint(msg.sender, initSupply);
    }

    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }

    function burn(uint256 _amount) public override {
        super.burn(_amount);
        emit Burned(msg.sender, _amount);
    }   

    function burnFrom(address _from, uint256 _amount) public override {
        super.burnFrom(_from, _amount);
        emit Burned(_from, _amount);
    }
}
