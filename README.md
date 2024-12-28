# Merkle Airdrop

A guided project to implement a Merkle Airdrop smart contract system. This project allows token distribution using Merkle proofs for efficient and secure claiming.

## Features
- **MerkleAirdrop Contract**: Enables users to claim their tokens if they are part of a Merkle tree.
- **BagelToken Contract**: A sample ERC20 token used for the airdrop.
- **GenerateInput Script**: This script generates a JSON file containing addresses and their corresponding values as input for building a Merkle Tree. This file serves as the basis for creating Merkle Proofs.
- **MakeMerkle Script**: This script uses the input JSON file to construct a Merkle Tree, generate Merkle Proofs along with the Root and Leaf nodes, and stores the results in a JSON output file.

- **Deployment Script**: Deploys both `MerkleAirdrop` and `BagelToken` contracts and transfers tokens to the airdrop contract.
- **Claim Script**: Demonstrates how to claim tokens using valid proofs and signatures.
- **Testing Suite**: Includes test cases to verify the correctness of the airdrop mechanism.

## Technology Stack
- **Solidity**: Smart contract programming language.
- **Foundry**: Development and testing framework.
- **OpenZeppelin Contracts**: Standard libraries for security and utility.

## Installation and Usage
1. **Clone the repository**:
    ```bash
    git clone https://github.com/emtothed/merkle-airdrop-foundry.git
    cd merkle-airdrop-foundry
    ```
2. **Install dependencies**:
    ```bash
    forge install
    ```
3. **Run tests**:
    ```bash
    forge test -vv
    ```
4. **Deploy contracts**:
    ```bash
    forge script script/DeployMerkleAirdrop.s.sol --rpc-url <network-url> --broadcast
    ```
5. **Claim tokens**:
    ```bash
    forge script script/ClaimAirdrop.s.sol --rpc-url <network-url> --broadcast
    ```
## Structure
- **src/**: Contains the main smart contracts (MerkleAirdrop.sol, BagelToken.sol).
- **script/**: Deployment and claim scripts.
- **test/**: Unit tests for the contracts.
  
## Notes
This project was created as part of a guided learning experience to explore the Merkle proof-based airdrop mechanism.

## License
This project is licensed under the MIT License.


