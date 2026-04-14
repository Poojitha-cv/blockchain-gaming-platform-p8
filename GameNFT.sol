// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract GameNFT is ERC721 {
    uint256 private _tokenIds;

    mapping(uint256 => string) public characterName;

    constructor() ERC721("GameCharacter", "GCHAR") {}

    function mintCharacter(string memory name) public returns (uint256) {
        _tokenIds++;
        uint256 newId = _tokenIds;

        _safeMint(msg.sender, newId);
        characterName[newId] = name;

        return newId;
    }

    function getMyTokenCount(address owner) public view returns (uint256) {
        return balanceOf(owner);
    }
}