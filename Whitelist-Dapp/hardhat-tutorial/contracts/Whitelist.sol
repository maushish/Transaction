// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract Whitelist{
    //Max no of whitelist addresses that are allowed
    uint8 public maxWhitelistedAddresses;
    //Create a mapping for all the addresses like if an address
    // is whitelisted so we would set its value to true otherwise by default it is true
    mapping (address=>bool) public WhitelistedAddresses;
    // now to track how many addresses have been whitelisted we are
    // gomma use numAddressWhiteListed
    uint8 public numAddressWhiteListed;
    //setting the  max number of whitelisted addresses
    //User will put the value at the time of deployement
    constructor (uint8 _maxWhiteListedAddresses){
        maxWhitelistedAddresses=_maxWhiteListedAddresses;

    }
    /**now a function which adds the user's addresss to the whitelis**/
    function addAddressToWhitelist()public {
        //check if the user has already veen whitelisted
        require(!WhitelistedAddresses[msg.sender],"sender has already been selected");
        //check if the numAddressesWhitelisted<maxWhitelistedAddresses, if not then throw an error
        require(numAddressWhiteListed<maxWhitelistedAddresses, "more addresses can't be addred max users are already in please wait for further announcement");
        //Add the address which called the function to the list of whitelisted addresses
        WhitelistedAddresses[msg.sender]=true;
        //increase the no of whitelisted addresses as more people gets added
        numAddressWhiteListed+=1;
    }

}