const hre = require("hardhat");

async function main() {
  try {
    const Contract = await hre.ethers.getContractFactory("NFT");
    const contract = await Contract.attach(
      "CONTRACT ADDRESS" // The deployed contract address
    );
    
    let overrides = {
      value: ethers.utils.parseEther((0.5).toString()),
    };
    const tx = await contract.mint("TEST WALLET ADDRESS");
  
    console.log("Minted: ", tx);
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