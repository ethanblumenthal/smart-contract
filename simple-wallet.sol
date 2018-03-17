pragma solidity ^0.4.0;

import "mortal.sol";

contract simpleWallet is mortal {

    mapping(address => Permission) permittedAddresses;

    event someoneAddedSomeoneToTheSendersList(address thePersonWhoAdded, address thePersonWhoIsAllowedNow, uint thisMuchHeCanSend);

    struct Permission {
      bool isAllowed;
      uint maxTransferAmount;
    }

    function addAddressToSendersList(address permitted, uint maxTransferAmount) onlyOwner {
      permittedAddresses[permitted] = Permission(true, maxTransferAmount);
      someoneAddedSomeoneToTheSendersList(msg.sender, permitted, maxTransferAmount);
    }

    function sendFunds(address receiver, uint amountInWei) public {
      if (permittedAddresses[msg.sender].isAllowed) {
        bool isAmountReallySent = receiver.send(amountInWei);
        if (!isAmountReallySent) {
          throw;
        }
      } else {
        throw;
      }
    }

    function removeAddressFromSendersList(address theAddress) {
      delete permittedAddresses[theAddress];
    }

    function () payable {}

}