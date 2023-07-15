#### Типы данных

- enum

```solidity
enum Status {
    Paid,
    Delivered,
    Received
}

Status public currentStatus;
```

- массивы фиксированной длины (индексы двумерных+ массивов читаются задом наперед)

```solidity
uint[3][2] public items;
items = [[3, 4, 5], [6, 7, 8]];
```

```solidity
uint256[10] public items;
```

- массивы с динамической длиной (индексы двумерных+ массивов читаются задом наперед)

```solidity
uint[] public items;

function dynArr() public {
    items.push(4);
    items.push(5);
    len = items.length;
}

// массив в памяти
function sampleMemory() public view returns (uint256[] memory) {
    uint256[] memory tempArray = new uint256[](10);
    tempArray[0] = 1;
    return tempArray;
}
```

- массивы bytes (массивы из последовательности байт) (могут возвращать длину)

```solidity
// fixed
bytes32 public myVar = "test here";

// dynamic
bytes public myDynVar = "test here";

function firstByte() public view returns (bytes1) {
    return myDynVar[0];
}
```

- struct

```solidity
// Struct
struct Payment {
    uint256 amount;
    uint256 timestamp;
    address from;
    string message;
}

struct Balance {
    uint256 totalPayments;
    mapping(uint256 => Payment) payments;
}
```
