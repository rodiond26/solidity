// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyShop {
    // владелец контракта
    address public contractOwner;

    // хранение информации о переводах
    mapping (address => uint) public payments;

    constructor(){
        // присваивание владельца контракта тому, кто разместил контракт
        contractOwner = msg.sender;
    }

    // автоматическое зачисление денег на счет контракта из-за payble
    function payForItem() public payable {
        // хранение значений на счете
        payments[msg.sender] = msg.value;
    }

    // списать все
    function withdrawAll() public {
        address payable _to = payable(contractOwner);
        address _thisContract = address(this);
        // у адреса есть баланс
        _to.transfer(_thisContract.balance);
    }
}
