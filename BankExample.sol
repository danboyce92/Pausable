pragma solidity ^0.5.2;

contract Bank {

  mapping (address => balances);
  bool private _paused;

  constructor () internal {
    _paused = false;
    owner = msg.sender;
  }

  //Allow to execute when contract is not _paused
  modifier whenNotPaused() {
    require(!_paused);
    _;
  }
  modifier whenPaused() {
    require(_paused);
    _;
  }

  function pause() public onlyOwner {
    _paused = true;
  }
  function unPause() public onlyOwner {
    _paused = false;
  }

  function withdrawAll() public whenNotPaused {
    uint amountToWithdraw = balances[msg.sender];
    balances[msg.sender] = 0;
    require(msg.sender.call.value(amountToWithdraw))
  }

  function emergencyWithdrawal(address emergencyAddress) public onlyOwner whenPaused() {
        //Withdraw to owner
  }

}
