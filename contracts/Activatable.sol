// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Activatable is Ownable {
    event Activate(address indexed _sender);
    event Deactivate(address indexed _sender);

    bool public active = false;

    modifier whenActive() {
        require(active, "");
        _;
    }

    modifier whenNotActive() {
        require(!active, "");
        _;
    }

    function activate() public whenNotActive onlyOwner {
        active = true;
        emit Activate(msg.sender);
    }

    function deactivate() public whenActive onlyOwner {
        active = false;
        emit Deactivate(msg.sender);
    }
}