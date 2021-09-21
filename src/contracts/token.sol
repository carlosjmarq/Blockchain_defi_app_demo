// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Corchea_Token is ERC20 {
	// Local Variables of the contract
	address public minter; 

	// Events (Console Logs) for the contract
	event MinterChanged(address indexed from, address to);

	//Constructor (not necessary in abstracts contracts)
	constructor() payable ERC20('Corchea', 'CCH') {  // ('NAME','SYMBOL')
		minter = msg.sender;

	}

	//methods of the contracts
	function passMinterRole(address dBank) public returns(bool) {
		require(msg.sender == minter, "KABOOM: The sender does not have minter role");
		minter = dBank;
		emit MinterChanged(msg.sender, dBank);
		return true;
	}

	function mint(address account, uint256 amount) public {
		require(msg.sender == minter, "KABOOM: The sender does not have minter role");
		_mint(account, amount);
	}
}