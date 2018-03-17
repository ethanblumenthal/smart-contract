pragma solidity ^0.4.0;

import "mortal.sol";

contract myContract is mortal {
    
  uint myVariable;
  
  function myContract() payable {
    myVariable = 5;
  }
  
  function setVariable(uint myNewVariable) onlyOwner {
    myVariable = myNewVariable;
  }
  
  function getMyVariable() constant returns(uint) {
    return myVariable;
  }
  
  function getMyContractBalance() constant returns(uint) {
    return this.balance;
  }

  function () payable {
      
  }
    
}