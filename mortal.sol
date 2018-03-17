pragma solidity ^0.4.0;

contract mortal {
  
  address owner;
  
  modifier onlyOwner() {
    if (msg.sender == owner) {
      _;
    } else {
      throw;
    }
  }
  
  function mortal() {
    owner = msg.sender;
  }
  
  function kill() onlyOwner {
    suicide(owner);
  }
  
}