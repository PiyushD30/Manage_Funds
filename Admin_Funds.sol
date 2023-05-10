pragma solidity 0.8.20;

contract Funds{
    address payable public admin;
    uint public limit;
   constructor() {
        admin = payable (msg.sender);
        limit = 1 ether; 
    }
 function admin_limit (uint newLimit)  public {
        require(msg.sender == admin,"Only the admin can set the limit");
        limit = newLimit;
    }
 function withdraw(uint amount) payable public {
        require(amount <= limit, "Withdrawal limit Exceeded!!!");
       payable(msg.sender).transfer(amount);
    }
    receive() external payable {}
}
