// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract SimpleStoreTest is Test {
    /// @dev Address of the SimpleStore contract.
    DynamicArray public arr;

    /// @dev Setup the testing environment.

    function setUp() public {
        arr = DynamicArray(HuffDeployer.config().deploy("DynamicArray"));
    }

    function testLength() public {
        uint x = arr.length();
        console2.log(x);
        assertEq(x, 0);
    }

    function testPush() public {
        arr.push();
        assertEq(arr.length(), 1);
    }

    function testPushMultipleItems() public {
        arr.push();
        assertEq(arr.length(), 1);
        arr.push();
        assertEq(arr.length(), 2);
        arr.push();
        assertEq(arr.length(), 3);
    }

    function testPop() public {
        arr.push();
        assertEq(arr.length(), 1);
        arr.popLast();
        assertEq(arr.length(), 0);
    }

    function testMultiplePops() public {
        arr.push();
        assertEq(arr.length(), 1);
        arr.push();
        assertEq(arr.length(), 2);

        arr.popLast();
        assertEq(arr.length(), 1);
        arr.popLast();
        assertEq(arr.length(), 0);
    }
}

interface DynamicArray {
    function push() external;

    function popLast() external;

    function show(uint256) external view returns (bytes32);

    function length() external view returns (uint256);
}
