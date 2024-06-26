// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
import "contracts/calc.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

/**
 * @title Calculator
 * @dev Ahmed Hesham
 */
contract Calculator {

    address private owner;
    int256 private firstNum;
    int256 private secondNum;
    //uint256 private first;
    //uint256 private second;
    int256 [] private result;
    
    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    constructor() {
        
        owner = msg.sender; // 'msg.sender' is sender of current call, contract deployer for a constructor
        
    }
    
    


    function setFirstNumber(int256 num) public  {
        firstNum = num;
    }
    function setSecondNumber(int256 num) public {
        secondNum = num;
    }

    function Sum() public  isOwner  {
        int256 ress = Mathh.Sum(firstNum,secondNum);
        result.push(ress);
        //return ress;
    } 
    function Sub() public  isOwner  {
        int256 ress = Mathh.Sub(firstNum,secondNum);
        result.push(ress);
        //return ress;
    } 
    function Multi() public  isOwner  {
        int256 ress = Mathh.Multi(firstNum,secondNum);
        result.push(ress);
        //return ress;
    } 
    function Dev(int256 first, int256 second) public view  isOwner returns (string memory) {
        string memory ress = Mathh.Dev(first,second);
        //result.push(ress);
        return ress;
    } 
    function getLastResult() public view isOwner returns (int256){
        uint256 len = result.length;
        int256 res = result[len-1];
        return res;
    }
  }





























    
