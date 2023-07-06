// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Demo {
    string public myStr = "test"; // storage
    address public myAddr = 0x5B38;

    function demo() public {
        string memory myTempStr = "temp"; // temporary
        myStr = "new value";
    }

    function getBalance(address targetAddress) public view returns (uint) {
        return targetAddress.balance;
    }

    function transferTo(address targetAddress, uint amount) public {
        address payable _to = payable(targetAddress);
        _to.transfer(amount);
    }

    function receiveFunds() public payable {}
}
