// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Demo {
    bool public myBool = true; //state

    // uint256
    uint256 public myUint = 42;

    uint8 public mySmallUint = 2;

    // int256
    int256 public myInt = -42;

    // + - * ** / % == != < > <= >=

    function muFunction(bool _inputBool) public pure {
        bool localBool = false; // local
        if ((localBool && localBool) || localBool == localBool || !localBool) {
            _inputBool = false;
        }
    }

    uint256 public minimum;
    uint256 public maximum;

    function demoMinimum() public {
        minimum = type(uint8).min;
    }

    function demoMaximum() public {
        maximum = type(uint8).max;
    }

    uint8 public myVal = 254;

    function inc() public {
        // myVal++;

        unchecked {
            myVal++;
        }

        // unchecked {
        //     myVal--;
        // }
    }
}
