//
//  ViewController.swift
//  Assignment1_guray_calculator
//
//  Created by Guray Demirezen on 2022-02-07.
//

import UIKit

class ViewController: UIViewController {

    // outler for button created
    @IBOutlet weak var advanceButton: UIButton!
    // outlet for label created
    @IBOutlet weak var inputSection: UILabel!
    // calculator object
    var calc : Calculator?
    //calculator manager object
    var manager : CalculatorManager?
    // variable for button titles
    var buttonTitle : String = ""
    // bool variable for advance mode
    var isAdvanceMode : Bool = false
    // C button boolean variable
    var isCPressed : Bool = true;
    // outlet for text view
    @IBOutlet weak var multipleText: UITextView!
    
    // button clicked action function
    @IBAction func buttonClicked(_ sender: Any) {
        
        // find which button clicked
        if let title = (sender as! UIButton).titleLabel?.text{
            // assign button title
            buttonTitle = title
        }
        // if "=" button clicked
        if(buttonTitle == "="){
            // if "C" button cliked
            if isCPressed{
                // send the '=' symbol to the array
            calc?.push(s: buttonTitle)
                // variable for validation
                var valid1 = true;
                // get the validation from the Calculator class
                if let m = calc?.validation(){
                    // assign the value to the variable
                    valid1 = m
                }
                // if the input is valid
                if valid1{
                // calculate the input
             calc?.calc();
            // get the final result and send to the label
            inputSection.text =  calc?.createString()
            // if advance mode active
            if isAdvanceMode{
                // add the calculator object to the array
                manager?.addCalculator(newCalculator: calc!)
                // display the all result in the text view
                multipleText.text = manager?.createString()
                
            }
                // make the "C" press variable disable
                isCPressed = false;
                
            }
                // if input is not valid
                else{
                    // change the label to invalid
                    inputSection.text = "invalid"
                    multipleText.text = "invalid"
                }
            }
            
        }
        // if user press on the "C" button
        else if (buttonTitle == "C"){
            isCPressed = true;
            // create new Calculator object
            calc = Calculator()
            // clean the array
            calc?.cleanArray()
            // clean the label
            inputSection.text =  calc?.createString()
        }
        // if pressed on other buttons
        else{
            // "C" button active
            if isCPressed{
                // send the symbol to the array
            calc?.push(s: buttonTitle)
                // update the label
        inputSection.text =  calc?.createString()}
            
        }
    }
    
  // click on the advance button
    @IBAction func advanceMode(_ sender: Any) {
        // clean the text view
        multipleText.text = ""
        // change the advance mode variable
        isAdvanceMode = !isAdvanceMode
        // if advance mode is active
        if isAdvanceMode{
            // change the button title and hide the text view
            advanceButton.setTitle("Standart - No History", for: .normal)
            multipleText.isHidden = false;
        }
        else{
            // change the button title and show the text view
            advanceButton.setTitle("Advance - With History", for: .normal)
            multipleText.isHidden = true;
        }
        // create calculatermanager class object
        manager = CalculatorManager()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // create object of classes
        if let m = (UIApplication.shared.delegate as! AppDelegate).calc1{
            calc = m
            
        }
        
        if let m = (UIApplication.shared.delegate as! AppDelegate).manager1{
            manager = m
            
        }
        // hide the text view
        multipleText.isHidden = true;
    }


}

