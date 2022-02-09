//
//  CalculatorManager.swift
//  Assignment1_guray_calculator
//
//  Created by Guray Demirezen on 2022-02-08.
//

import Foundation

class CalculatorManager{
    // array list for calculator class
    var calculatorList : [Calculator] = [Calculator]()
    
    // add object to the array
    func addCalculator(newCalculator : Calculator){
        calculatorList.append(newCalculator)
    }
    // create string for text view
    func createString() -> String{
        var stringResult : String = ""
        // loop for array list
        for calc in calculatorList{
            // loop for array of string
            for element1 in calc.collectInput{
                stringResult += element1
            }
            // new line
            stringResult += "\n"
        }
        return stringResult
    }
}
 
