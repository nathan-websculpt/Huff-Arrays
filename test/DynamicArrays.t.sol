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
        // uint256 val = 2;
        arr.push();
        assertEq(arr.length(), 1);
        // assertEq(arr.show(0), val);
    }
}

interface DynamicArray {
    function push() external;

    function popLast() external;

    function show(uint256) external view returns (bytes32);

    function length() external view returns (uint256);
}
