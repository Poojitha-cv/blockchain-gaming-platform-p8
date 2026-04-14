// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoinFlipGame {

    event GameResult(address player, bool won, uint256 blockNumber);

    function flip(bool playerChoice) public payable returns (bool won) {
        require(msg.value > 0, "Send ETH to play");

        bool result = (uint256(
            keccak256(abi.encodePacked(block.prevrandao, msg.sender))
        ) % 2 == 0);

        won = (playerChoice == result);

        if (won) {
            require(address(this).balance >= msg.value * 2, "Not enough contract balance");

            (bool sent, ) = payable(msg.sender).call{value: msg.value * 2}("");
            require(sent, "Failed to send reward");
        }

        emit GameResult(msg.sender, won, block.number);
    }

    receive() external payable {}
}