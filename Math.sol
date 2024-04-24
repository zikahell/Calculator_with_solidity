// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
import "@openzeppelin/contracts/utils/Strings.sol";

library Mathh{

    
    function Sum(int256 firstNum,int256 secondNum) public pure returns (int256){
        int256 res = firstNum + secondNum;
        return res;
    }
    function Sub(int256 firstNum,int256 secondNum) public pure returns (int256){
        int256 res = firstNum - secondNum;
        return res;
    }
    function Multi(int256 firstNum,int256 secondNum) public pure returns (int256){
        int256 res = firstNum * secondNum;
        return res;
    }
    function Dev(int256 firstNum,int256 secondNum) public pure returns (string memory){
        if (secondNum>firstNum){
        int256 res = firstNum*(10**2) / secondNum;
        string memory ress = Strings.toStringSigned(res);
        bytes memory r = bytes(ress); 
        bytes memory result = concatenateStings(bytes("0."), bytes1(r));
        return string(result);
        }
        else  {
            if(firstNum%secondNum ==0){
                int256 res = firstNum / secondNum;
                string memory ress = Strings.toStringSigned(res);
                return ress;
            }
             else {
                int256 r = firstNum/secondNum;
                string memory re = Strings.toStringSigned(r);
                bytes memory b = bytes(re);
                 int256 res = firstNum*(10) / secondNum;
                 string memory   ress = Strings.toStringSigned(res);
                 bytes memory resss = bytes(ress);
                 bytes1  reminder = getLastLetter(resss); 
                 bytes memory result = concatenateStings(concatenateStings(b,"."), reminder);
                 return string(result);
            }
        }
        
    }
     function getLastLetter(bytes memory strBytes) public pure returns (bytes1) {
        //bytes memory strBytes = bytes(str);
        //require(strBytes.length > 0, "Empty string");
        return strBytes[strBytes.length - 1];
    }

    function concatenateStings(bytes memory a, bytes1 b) public pure returns (bytes memory) {
        return bytes.concat(a,b);
    }
    function truncateStringByIndices(bytes memory strBytes, uint256 _startIndex, uint256 _endIndex) public pure returns (string memory) {
        require(_endIndex >= _startIndex, "End index must be greater than or equal to start index");
        //bytes memory strBytes = bytes(_str);
        
        // Ensure start index is within bounds
        require(_startIndex < strBytes.length, "Start index out of bounds");
        
        // Ensure end index is within bounds
        require(_endIndex < strBytes.length, "End index out of bounds");
        
        bytes memory truncatedBytes = new bytes(_endIndex - _startIndex + 1);
        for (uint256 i = 0; i <= _endIndex - _startIndex; i++) {
            truncatedBytes[i] = strBytes[_startIndex + i];
        }
        return string(truncatedBytes);
    }
    

}
