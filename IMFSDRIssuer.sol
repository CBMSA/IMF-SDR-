// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SDRIssuer {
    address public admin;
    mapping(address => uint256) public sdrBalances;

    constructor() {
        admin = msg.sender;
    }

    function assignSDR(address recipient, uint256 amount) external {
        require(msg.sender == admin, "Only admin can assign SDR");
        sdrBalances[recipient] += amount;
    }

    function getSDRBalance(address recipient) external view returns (uint256) {
        return sdrBalances[recipient];
    }
}
