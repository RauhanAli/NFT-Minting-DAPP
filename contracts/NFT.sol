
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";  
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "hardhat/console.sol";

// interface IBEP20{
//      function transfer(address recipient, uint256 amount) external returns (bool);
//     function allowance(address owner, address spender) external view returns (uint256);
//        function approve(address spender, uint256 amount) external returns (bool);
//        function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
//         function balanceOf(address account) external view returns (uint256);
//         function increaseAllowance(address spender, uint256 addedValue) external returns (bool);
//          function decreaseAllowance(address spender, uint256 addedValue) external returns (bool);
// }

contract NFT is ERC721URIStorage, Ownable{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    IERC20 public tokenAddress;
    address public marketContract;
    address payable nftowner;
     string public baseExtension = ".json";
      string public BASE_URI = "https://gateway.pinata.cloud/ipfs/QmQGA6k84m4LaZTQxYLRTozHV8fkQCnye4oa8yDVr4o7zV";
    uint256 public Maxsupply = 3;

   //  address private vtoken = 0xF80Ca04bE4Af887374e979a5D9242b95021961E1;
   //  address private vud = 0x6c13D85eb24D3697F5965bD723041F24125Dd14e;
    uint256 public mintingRate = 100 * 10 **18;
      event NFTMinted (
        uint256 indexed tokenId,
        string tokenURI
    );
     constructor(address _contractaddress) ERC721("Crypto League Gaming", "CLGNFT") {
        tokenAddress = IERC20(_contractaddress);
        //BASE_URI = tokenURI;
         nftowner = payable(msg.sender);

     }

      function _baseURI() internal view override returns (string memory) {
        return string(abi.encodePacked(BASE_URI, "/"));
    }
    
       
        function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory) {
            require(
                _exists(tokenId),
                "ERC721Metadata: URI query for nonexistent token"
                );
                
                string memory currentBaseURI = _baseURI();
                return bytes(currentBaseURI).length > 0 ? string(abi.encodePacked(currentBaseURI, Strings.toString(tokenId),baseExtension)): "";
        }

      function changebaseURI(string memory baseURI) public onlyOwner {
        BASE_URI = baseURI;
      }

     function createToken(address _to) public payable returns (uint) {
        _tokenIds.increment();
        uint256 newitemId = _tokenIds.current();
        uint256 supply = 2;
        require(supply < Maxsupply);
        // require(msg.value == mintingRate, 'Insufficent Balance');
         tokenAddress.transferFrom(msg.sender,address(this),mintingRate);
        _safeMint(_to,newitemId);
       //_setTokenURI(newitemId, tokenURI);
        return newitemId;
     }

        function withdraw() public payable onlyOwner() {
        tokenAddress.transfer(msg.sender,tokenAddress.balanceOf(address(this)));
     }

}  