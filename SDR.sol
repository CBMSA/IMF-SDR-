
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SDRIssuer {
    string public name = "IMF Special Drawing Rights";
    string public symbol = "SDR";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    address public admin;
    mapping(address => uint256) public balanceOf;

    event Issued(address indexed to, uint256 amount);

    constructor() {
        admin = msg.sender;
        totalSupply = 0;
    }

    function issueSDR(address to, uint256 amount) external {
        require(msg.sender == admin, "Only admin can issue SDR");
        balanceOf[to] += amount;
        totalSupply += amount;
        emit Issued(to, amount);
    }
}
