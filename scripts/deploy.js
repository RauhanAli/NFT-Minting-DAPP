const hre = require("hardhat");
const BASE_URI = "ipfs://QmQGA6k84m4LaZTQxYLRTozHV8fkQCnye4oa8yDVr4o7zV";
//const PRICE = "500000000000000000" // 

async function main() {
  try {
    const NFT = await hre.ethers.getContractFactory("NFT");
    const nft = await NFT.deploy("0x2F984E550b1880bBD1ea0802f2446a77D1dD8009");
    await nft.deployed();
  
    console.log(`contract deployed at ${nft.address}`); 
  } catch (error) {
    console.log(error);
  }  
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });