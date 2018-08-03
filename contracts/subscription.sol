/* Contract of basica subscription

*/

pragma solidity ^0.4.24;

import "./Token.sol";
import "zeppelin-solidity/contracts/ownership/Ownable.sol";

contract Subscription is Ownable {

  Token token;
  mapping (address => uint) public users;
  address crowdsale;

  event signedUp(address who);
  event signedOut(address who);
  event banned(address who);

  constructor(address _token, address _owner, address _crowdsale) public {

    token = Token(_token);
    owner = _owner;
    crowdsale = _crowdsale;


  }

  function signUp() public{

    uint am = 1 * 1 ether;
    token.transferFrom(msg.sender,this,am);
    users[msg.sender]=am;
    signedUp(msg.sender);
  }

  function signOut() public{
    uint am = 1 * 1 ether;
    token.transfer(msg.sender,am);
    users[msg.sender]=0;
    signedOut(msg.sender);
  }

  function banUser(address _user) public onlyOwner {

    uint am = 1 * 1 ether;
    token.transfer(crowdsale,am);
    users[_user]=0;
    banned(msg.sender);

  }


}