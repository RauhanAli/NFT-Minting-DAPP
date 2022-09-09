
import { ethers } from 'ethers'
import { useEffect, useState } from 'react'
import axios from 'axios'
import Web3Modal from 'web3modal'
import {
    nftAddress
}from  '../config'

import NFT from '../artifacts/contracts/NFT.sol/NFT.json'