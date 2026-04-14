// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract GameNFT is ERC721 {
    uint256 private _tokenIds;

    mapping(uint256 => string) public characterName;

    constructor() ERC721("GameCharacter", "GCHAR") {}

    function mintCharacter(string memory name) public returns (uint256) {
        require(bytes(name).length > 0, "Name required");

        _tokenIds++;
        uint256 newId = _tokenIds;

        _safeMint(msg.sender, newId);
        characterName[newId] = name;

        return newId;
    }

    function getMyTokenCount(address owner) public view returns (uint256) {
        return balanceOf(owner);
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_ownerOf(tokenId) != address(0), "Token does not exist");

        return string(abi.encodePacked(
            "https://api.example.com/metadata/",
            Strings.toString(tokenId),
            ".json"
        ));
    }
}