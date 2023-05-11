pragma solidity 0.8.20;

contract Funds//creating a smart contract in which admin is the owner of this contract. Itallowsfunds to be withdrawn from any address unless it exceedes the limit set by the admin which can be changed by the admin only.
{
    address public admin;//creating a variable admin that is public so that people can view who is the admin
    uint public limit;// creating a variable limit that is public so everyone can view the limit of fund withdrawal for a particular transaction
    constructor()
    {
        admin = payable (msg.sender);//owner of the contract is the admin
        limit = 1 ether; //setting default withdrawal limit
    }
    function admin_limit (uint newLimit)  public //creating a function that allows only the admin to change the limit of fund withdrawal
    {
        require(msg.sender == admin,"Only the admin can set the limit");//checking if the user is the admin
        limit = newLimit;//allowing the user to change limit if he/she is the admin
    }
    function withdraw(uint amount) payable public //creating a function that allows fund withdrawal from any address unless the limit set by the admin is exceeded
    {
       require(amount <= limit, "Withdrawal limit Exceeded!!!");//checking if the requested amount is less than the limit set by the admin
       payable(msg.sender).transfer(amount);//transferring funds to the user if it is within the limit set by the admin
    }
    receive() external payable {}//allowing balance to be transferred to the contract from my account in this case - 0x84e62E458A8Fd29af1A4157BF771eF707f8f3283 
}
