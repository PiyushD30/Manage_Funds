pragma solidity ^0.8.0;

contract Funds{
    address payable public owner;
    uint public limit;
   constructor() {
        owner = payable (msg.sender);
        limit = 5 ether; 
    }
 function admin_limit (uint newLimit)  public {
        require(msg.sender == owner,"Only the admin can set the limit");
        limit = newLimit;
    }
 function withdraw(uint amount) payable public {
        require(amount <= limit, "Withdrawal limit Exceeded!!!");
       payable(msg.sender).transfer(amount);
    }
    receive() external payable {}
}
