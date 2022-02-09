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
           // switch case block to find te operand
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
    }
        // convert the result to string
         let m : String = String (result)
        // add the result to the array
            push(s: m);
        
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
        var isOperands : Bool = false
              // for loop for each array element
        for element in collectInput {
            // switch case block  for validation
            switch element {
                
                // if it is operators
            case "+","-","*", "/" :
                
                    if !isOperators{
                    isOperators = true;
                        isOperands = false;
                    }
                    else{
                        isValid = false
                        break
                    }
                // if it is operand
            case "1","2","4", "5", "6","7","8", "9", "0" :
                
                    if !isOperands{
                        isOperands = true;
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

