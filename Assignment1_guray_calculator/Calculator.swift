//
//  Calculator.swift
//  Assignment1_guray_calculator
//
//  Created by Guray Demirezen on 2022-02-07.
//

import Foundation

class Calculator {
    
    var  collectInput : [String] = []
    var result : Int = 0
    var isValid : Bool = true
  
    
    init(){
        
    }
    
    func push(s:String){
        
        collectInput.append(s)
        
    }
    
    func cleanArray(){
        
        collectInput.removeAll()
        
    }
    func calc() {
        validation()
        print(isValid)
        if isValid {
            
        
        var index : Int = 0
        
        result = Int (collectInput[index])!;
        index += 1
        
        while (index < collectInput.count){
           
            switch collectInput[index]{
                
            case "+":
                index += 1
                result += Int(collectInput[index])!
            case "-":
                index += 1
                result -= Int(collectInput[index])!
            case "*":
                index += 1
                result *= Int(collectInput[index])!
            case "/":
                index += 1
                result /= Int(collectInput[index])!
            default:
                index += 1
            }
        }
            
        }
         let m : String = String (result)
            push(s: m);
        
       
        
       
        
    }
    
    func createString() -> String{
        var stringResult : String = ""
        for element in collectInput{
            stringResult += element
        }
        return stringResult
    }
    
    func validation() -> Bool{
       // var isValid : Bool = false
        var isOperators : Bool = false
        var isOperands : Bool = false
                    
        for element in collectInput {
            
            switch element {
                
            case "+","-","*", "/" :
                
                    if !isOperators{
                    isOperators = true;
                        isOperands = false;
                    }
                    else{
                        isValid = false
                        break
                    }
                
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
            if !isValid{
                break
            }
            
        
    }
        if collectInput.count < 3 {
            isValid = false
        }
                    
    return isValid
}
    
}

