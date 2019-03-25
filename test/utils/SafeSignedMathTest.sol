pragma solidity ^0.5.6;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";

import "../../contracts/utils/SafeSignedMath.sol";


contract SafeSignedMathTest {
    using SafeSignedMath for int256;

    function testShouldAdd() external {
        Assert.equal(int256(1000).add(234), 1234, "");
        Assert.equal(int256(1234).add(-234), 1000, "");
        Assert.equal(int256(0).add(123), 123, "");
        Assert.equal(int256(123).add(0), 123, "");
        Assert.equal(int256(0).add(-123), -123, "");
        Assert.equal(int256(-123).add(0), -123, "");
    }

    function testShouldSub() external {
        Assert.equal(int256(1234).sub(234), 1000, "");
        Assert.equal(int256(1000).sub(-234), 1234, "");
        Assert.equal(int256(0).sub(123), -123, "");
        Assert.equal(int256(123).sub(0), 123, "");
        Assert.equal(int256(0).sub(-123), 123, "");
        Assert.equal(int256(-123).sub(0), -123, "");
    }

    function testShouldMul() external {
        Assert.equal(int256(0).mul(1234), 0, "");
        Assert.equal(int256(1234).mul(0), 0, "");
        Assert.equal(int256(20).mul(10), 200, "");
        Assert.equal(int256(-20).mul(10), -200, "");
        Assert.equal(int256(10).mul(-20), -200, "");
        Assert.equal(int256(-10).mul(-20), 200, "");
    }

    function testShouldMulDiv() external {
        Assert.equal(int256(0).muldiv(20, 3), 0, "");
        Assert.equal(int256(20).muldiv(0, 3), 0, "");
        Assert.equal(int256(34).muldiv(13, 3), 147, "");
        Assert.equal(int256(10).muldiv(20, 5), 40, "");
        Assert.equal(int256(10).muldiv(10, 3), 33, "");
        Assert.equal(int256(20).muldiv(10, 3), 66, "");
    }
}