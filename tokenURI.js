const hre = require("hardhat");

async function main() {
  try {
    const Contract = await hre.ethers.getContractFactory("NFT");
    const contract = await Contract.attach(
      "YOUR CONTRACT ADDRESS" // The deployed contract address
    );
  
    const uri = await contract.tokenURI(1);
  
    console.log("Token URI: ", uri);
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