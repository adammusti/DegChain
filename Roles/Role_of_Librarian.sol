// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract LibrarianRole {
    function checkesLib(uint Numb_of_collected_books) public pure returns (bool Return_All_books){
        
        if (Numb_of_collected_books == 0) {
            return true;
        }

        else if (Numb_of_collected_books != 0) {
            return false;
            }
            
            
        }
        
    }
    
