// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {MerkleAirdrop} from "../src/MerkleAirdrop.sol";
import {BagelToken} from "../src/BagelToken.sol";
import {DeployMerkleAirdrop} from "../script/DeployMerkleAirdrop.s.sol";

contract MerkleAirdropTest is Test {
    MerkleAirdrop public airdrop;
    BagelToken public token;
    bytes32 public ROOT = 0xaa5d581231e596618465a56aa0f5870ba6e20785fe436d5bfb82b08662ccc7c4;
    uint256 constant AMOUNT_TO_CLAIM = 25 ether;
    uint256 constant AMOUNT_TO_MINT = AMOUNT_TO_CLAIM * 4;
    bytes32[] public PROOF = [
        bytes32(0x0fd7c981d39bece61f7499702bf59b3114a90e66b51ba2c53abdf7b62986c00a),
        bytes32(0xe5ebd1e1b5a5478a944ecab36a9a954ac3b6b8216875f6524caa7a1d87096576)
    ];
    address gaspayer;
    address user;
    uint256 userPrivKey;

    function setUp() public {
        //deploy without deploy script
        // token = new BagelToken();
        // airdrop = new MerkleAirdrop(ROOT, token);
        // token.mint(address(airdrop), AMOUNT_TO_MINT);
        (user, userPrivKey) = makeAddrAndKey("user");

        DeployMerkleAirdrop deployer = new DeployMerkleAirdrop();
        (airdrop, token) = deployer.run();
        gaspayer = makeAddr("gasPayer");
    }

    function testUsersCanClaim() public {
        uint256 startingBalance = token.balanceOf(user);

        bytes32 digestedMessage = airdrop.getMessageHash(user, AMOUNT_TO_CLAIM);

        //sign a digested message by user
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(userPrivKey, digestedMessage);

        vm.prank(gaspayer);
        airdrop.claim(user, AMOUNT_TO_CLAIM, PROOF, v, r, s);

        uint256 endingBalance = token.balanceOf(user);
        console.log("Ending Balance :", endingBalance);
        assertEq(endingBalance - startingBalance, AMOUNT_TO_CLAIM);
    }
}
