// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoinFlipGame {
    event GameResult(address player, bool won, uint256 blockNumber);

    function flip(bool playerChoice) public returns (bool won) {
        bool result = (block.timestamp % 2 == 0);
        won = (playerChoice == result);
        emit GameResult(msg.sender, won, block.number);
        return won;
    }
}