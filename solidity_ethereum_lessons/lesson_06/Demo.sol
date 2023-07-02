// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Demo {
    string message = "hello"; // state
    uint256 public balance1;

    // пример call view
    function getBalance() public view returns (uint256 balance) {
        balance = address(this).balance;
        return balance;
    }

    // так можно
    function getMessage() external view returns (string memory) {
        return message;
    }

    // так нельзя
    // function getMessagePure() external pure returns (string memory) {
    //     return message;
    // }

    // так можно
    function rate(uint256 amount) public pure returns (uint256) {
        return amount * 3;
    }

    function setMessage(string memory newMessage) external {
        message = newMessage;
    }

    function pay() external payable {
        // можно без тела
        balance1 += msg.value;
    }

    receive() external payable {

    }

    fallback() external payable {
        
    }
}
