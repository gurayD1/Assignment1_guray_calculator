//
//  CalculatorManager.swift
//  Assignment1_guray_calculator
//
//  Created by Guray Demirezen on 2022-02-08.
//

import Foundation

class CalculatorManager{
    
    var calculatorList : [Calculator] = [Calculator]()
    
    func addCalculator(newCalculator : Calculator){
        
        calculatorList.append(newCalculator)
        
        
    }
    
    func createString() -> String{
        var stringResult : String = ""
        for calc in calculatorList{
            for element1 in calc.collectInput{
                stringResult += element1
                
            }
            stringResult += "\n"
        }
        return stringResult
    }
}
 
