// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract AccountRole {
    function checkesAcct(uint Balance) public pure returns (bool Account){
        
        if (Balance == 0) {
            return true;
        }

        else if (Balance != 0) {
            return false;
            }
            
            
        }
        
    }
    
