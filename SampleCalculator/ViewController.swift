//
//  ViewController.swift
//  SampleCalculator
//
//  Created by NareshNaidu on 31/05/17.
//  Copyright © 2017 NareshNaidu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var dispaly: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if  userIsInTheMiddleOfTyping {
        let currentlyDisplay = dispaly.text!
        dispaly.text = currentlyDisplay + digit
        }else {
        dispaly.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    var displayValue: Double {
        get{
            return Double(dispaly.text!)!
        }
        set{
            dispaly.text = String(newValue)
        }
    }
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
    
    }
    
    
}

