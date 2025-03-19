# NFT Music Distribution

## Overview
The **NFT Music Distribution** smart contract enables musicians to mint, sell, and receive royalties from their music as NFTs on the Ethereum blockchain. This decentralized platform empowers artists by giving them full control over their music ownership and earnings.

## Features
- **Artist Registration**: Musicians can register as artists and provide a biography.
- **NFT Minting**: Artists can mint music NFTs with metadata stored on IPFS.
- **NFT Sales**: Buyers can purchase music NFTs directly from artists.
- **Royalties**: Artists earn royalties on secondary sales.
- **Platform Fee**: A small percentage of each sale goes to the platform.
- **Fund Withdrawals**: Artists can withdraw earnings at any time.
- **Ownership Transfers**: Buyers can resell NFTs at their preferred price.
- **Admin Controls**: The contract owner can update platform fees and transfer ownership.

## Smart Contract Details

### **Structs**
- **MusicNFT**: Contains details like ID, title, artist, price, IPFS hash, creator, royalty percentage, and sale status.
- **Artist**: Stores artist name, biography, verification status, total sales, and royalties earned.

### **Mappings**
- `musicNFTs`: Maps NFT IDs to their metadata.
- `artists`: Maps artist addresses to their details.
- `artistNFTs`: Maps artist addresses to their minted NFT IDs.
- `artistBalance`: Tracks artist earnings.
- `isArtist`: Checks if an address is a registered artist.

## Installation & Deployment

### **Requirements**
- Node.js & npm
- Hardhat
- Solidity 0.8.9 or later

### **Installation**
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/NFT-Music-Distribution.git
   cd NFT-Music-Distribution
   ```
2. Install dependencies:
   ```sh
   npm install
   ```
3. Compile the contract:
   ```sh
   npx hardhat compile
   ```
4. Deploy the contract (modify for your network):
   ```sh
   npx hardhat run scripts/deploy.js --network goerli
   ```

## Functions

### **Public Functions**
- `registerArtist(string _name, string _biography)`: Registers an artist.
- `mintNFT(string _title, string _ipfsHash, uint256 _price, uint256 _royaltyPercentage)`: Mints an NFT.
- `buyNFT(uint256 _nftId)`: Purchases an NFT.
- `resellNFT(uint256 _nftId, uint256 _newPrice)`: Resells an NFT.
- `withdrawFunds()`: Withdraws artist earnings.
- `getNFTDetails(uint256 _nftId)`: Fetches NFT details.

### **Owner Functions**
- `verifyArtist(address _artistAddress)`: Verifies an artist.
- `updatePlatformFee(uint256 _newFeePercentage)`: Updates the platform fee.
- `transferOwnership(address _newOwner)`: Transfers contract ownership.

## Events
- `NFTMinted(uint256 indexed id, address indexed creator, string title, uint256 price)`
- `NFTSold(uint256 indexed id, address indexed seller, address indexed buyer, uint256 price)`
- `RoyaltyPaid(uint256 indexed id, address indexed creator, uint256 amount)`
- `ArtistRegistered(address indexed artistAddress, string name)`
- `FundsWithdrawn(address indexed recipient, uint256 amount)`

## Future Scope
- Integration with **Metaverse Concerts**
- AI-powered **Music Curation**
- Fan **Engagement & Rewards**
- **Cross-Blockchain Compatibility**


