//
//  ViewController.swift
//  Assignment1_guray_calculator
//
//  Created by Guray Demirezen on 2022-02-07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var advanceButton: UIButton!
    @IBOutlet weak var inputSection: UILabel!
    var calc : Calculator?
    var manager : CalculatorManager?
     var deneme = 0
    var buttonTitle : String = ""
    var isAdvanceMode : Bool = false
    var isCPressed : Bool = true;
    
    @IBOutlet weak var multipleText: UITextView!
    @IBAction func buttonClicked(_ sender: Any) {
        
        if let title = (sender as! UIButton).titleLabel?.text{
            buttonTitle = title
            
        }
        
       // calc?.push(s: buttonTitle)
       // calc?.validation()
       // calc?.calc();
        //inputSection.text =  calc?.createString()
        
        if(buttonTitle == "="){
            //isCPressed = false;
            if isCPressed{
            calc?.push(s: buttonTitle)
                
                var valid1 = true;
                if let m = calc?.validation(){
                    valid1=m
                }
                if valid1{
             calc?.calc();
            inputSection.text =  calc?.createString()
            if isAdvanceMode{
                manager?.addCalculator(newCalculator: calc!)
                
                multipleText.text = manager?.createString()
                
            }
                isCPressed = false;
                
            }
                else{
                    inputSection.text = "invalid"
                    multipleText.text = "invalid"
                }
            }
            
        }
        else if (buttonTitle == "C"){
            isCPressed = true;
            calc = Calculator()
            calc?.cleanArray()
            inputSection.text =  calc?.createString()
        }
        else{
            if isCPressed{
            calc?.push(s: buttonTitle)
           // calc?.validation()
           // calc?.calc();
        inputSection.text =  calc?.createString()}
            
        }
        
      
        
    }
    
  
    @IBAction func advanceMode(_ sender: Any) {
        multipleText.text = ""
        
        isAdvanceMode = !isAdvanceMode
        
        if isAdvanceMode{
            //advanceButton.titleLabel?.text = "Standart - No History"
            advanceButton.setTitle("Standart - No History", for: .normal)
            multipleText.isHidden = false;
        }
        else{
           // advanceButton.titleLabel?.text = "Advance - With History"
            
            advanceButton.setTitle("Advance - With History", for: .normal)
            multipleText.isHidden = true;
        }
        
        manager = CalculatorManager()
        
        //manager?.addCalculator(newCalculator: calc!)
        
       // multipleText.text = manager?.createString()
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        if let m = (UIApplication.shared.delegate as! AppDelegate).calc1{
            calc = m
            
        }
        
        if let m = (UIApplication.shared.delegate as! AppDelegate).manager1{
            manager = m
            
        }
        multipleText.isHidden = true;
    }


}

