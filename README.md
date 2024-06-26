# MyToken Smart Contract

## Overview

`MyToken` is a simple ERC-20-like token implemented in Solidity. It includes basic functionality for minting and burning tokens.

## Contract Details

### Variables

1. **name**: A `string` representing the name of the token.
2. **symbol**: A `string` representing the symbol of the token.
3. **totalSupply**: A `uint256` representing the total supply of tokens.
4. **balances**: A mapping from addresses to their respective balances.

### Functions

#### `mint(address _recipient, uint256 _value)`

Mints new tokens and assigns them to the specified recipient address.

- **_recipient**: The address of the recipient.
- **_value**: The amount of tokens to mint.

#### `burn(address _sender, uint256 _value)`

Burns tokens from the specified sender address, reducing the total supply.

- **_sender**: The address from which tokens will be burned.
- **_value**: The amount of tokens to burn.

### Usage

1. **Minting Tokens**: Call the `mint` function with the recipient's address and the amount of tokens to mint. This will increase the total supply and the recipient's balance.

2. **Burning Tokens**: Call the `burn` function with the sender's address and the amount of tokens to burn. This will decrease the total supply and the sender's balance. Note that the sender must have a balance greater than or equal to the amount being burned.

## Example

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {
    string public name = "MyToken";
    string public symbol = "MTK";
    uint256 public totalSupply;

    mapping(address => uint256) public balances;

    function mint(address _recipient, uint256 _value) external {
        totalSupply += _value;
        balances[_recipient] += _value;
    }

    function burn(address _sender, uint256 _value) external {
        require(balances[_sender] >= _value, "Insufficient balance");
        totalSupply -= _value;
        balances[_sender] -= _value;
    }
}
//
```
## License

This project is licensed under the MIT License - see the LICENSE.md file for details

