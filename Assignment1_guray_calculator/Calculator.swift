//
//  Calculator.swift
//  Assignment1_guray_calculator
//
//  Created by Guray Demirezen on 2022-02-07.
//

import Foundation

class Calculator {
    // array for collect the all input
    var  collectInput : [String] = []
    // variable for  the result
    var result : Int = 0
    // variable for the validation
    var isValid : Bool = true
  
    init(){
        
    }
    
    // push function to push the value to array
    func push(s:String){
        collectInput.append(s)
    }
    // function to clean the array
    func cleanArray(){
        collectInput.removeAll()
    }
    
    // calculation function to do calculation
    func calc() {
        // call validation method
        validation()
        // if is valid do calculation
        if isValid {
        // set the index number zero
        var index : Int = 0
        // get the first element of array
        result = Int (collectInput[index])!;
        // increase the index number
        index += 1
        // while loop for array calculation
        while (index < collectInput.count){
           // switch case block to find te operators
            switch collectInput[index]{
                // if is plus do sum
            case "+":
                index += 1
                result += Int(collectInput[index])!
                // if it is minus do extract
            case "-":
                index += 1
                result -= Int(collectInput[index])!
                // do multiplition
            case "*":
                index += 1
                result *= Int(collectInput[index])!
                // do division
            case "/":
                index += 1
                result /= Int(collectInput[index])!
            default:
                index += 1}
            
        }
            // convert the result to string
             let m : String = String (result)
            // add the result to the array
                push(s: m);
    }
       
        
    }
    // this function is used to create string type of the all input
    func createString() -> String{
        var stringResult : String = ""
        // concatenate the all variable
        for element in collectInput{
            stringResult += element
        }
        return stringResult
    }
    // validation function
    func validation() -> Bool{
        // variable to define operand or operator
        var isOperators : Bool = false
        var isDigit : Bool = false
        var indexNumber : Int = 0;
              // for loop for each array element
        for element in collectInput {
          // increase the index number
                indexNumber += 1;
            // switch case block  for validation
            switch element {
                
                // if it is "=" symbol
            case  "/" :
                
                // if previous one is not operators
                    if !isOperators{
                    isOperators = true;
                        isDigit = false;
                    }
                // if previous one is also operators make it invalid
                    else{
                        isValid = false
                        break
                    }
                // index number must be smaller than array length
                if indexNumber < collectInput.count {
                    // if division by 0 then make it invalid
                if collectInput[indexNumber] == "0"{
                    isValid = false
                    break
                }}
                
                // if it is operators
            case "+","-","*" :
                // if previous one is not operators
                    if !isOperators{
                    isOperators = true;
                        isDigit = false;
                    }
                    else{
                        isValid = false
                        break
                    }
                // if it is operand
            case "1","2","4", "5", "6","7","8", "9", "0" :
                
                // if previous one is not digit number
                    if !isDigit{
                        isDigit = true;
                        isOperators = false;
                        
                    }
                    else{
                        isValid = false
                        break
                    }
                
            
        default:
                isValid = true;
            
        }
            // if it is not valid end the loop
            if !isValid{
                break
            }
            
        
    }
        // size of array must be bigger than 3
        if collectInput.count < 3 {
            isValid = false
        }
                    
    return isValid
}
    
}

