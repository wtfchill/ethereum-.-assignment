
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {
    // 1. Public variables
    string public name;
    string public symbol;
    uint256 public totalSupply;

    // 2. Mapping of addresses to balances
    mapping(address => uint256) public balances;

    // 3. Mint function
    function mint(address _recipient, uint256 _value) external {
        totalSupply += _value;
        balances[_recipient] += _value;
    }

    // 4. Burn function
    function burn(address _sender, uint256 _value) external {
        require(balances[_sender] >= _value, "Insufficient balance");
        totalSupply -= _value;
        balances[_sender] -= _value;
    }
}
