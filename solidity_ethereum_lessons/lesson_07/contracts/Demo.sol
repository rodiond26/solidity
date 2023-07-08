// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Demo {
    address owner;

    event Paid(address indexed _from, uint256 _amount, uint256 _timestamp);

    constructor() {
        owner = msg.sender;
    }

    // функция зачисления средств на контракт
    function pay() public payable {
        emit Paid(msg.sender, msg.value, block.timestamp);
    }

    // address demoAddr;

    modifier onlyOwner(address _to) {
        require(msg.sender == owner, "you are not the owner");
        require(_to != address(0), "incorrect address");
        _; // выход из модификатора
    }

    // функция снятия средств с контракта
    function withdraw(address payable _to) external {
        // panic
        assert(msg.sender != owner);

        // if + revert
        require(msg.sender == owner, "you are not an owner");

        // только условие
        if (msg.sender != owner) {
            revert("you are not an owner");
        }

        _to.transfer(address(this).balance);
    }

    receive() external payable {
        pay();
    }
}
