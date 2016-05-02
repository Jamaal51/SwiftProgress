//
//  ViewController.swift
//  Calculator_Stanford
//
//  Created by Jamaal Sedayao on 5/2/16.
//  Copyright © 2016 Jamaal Sedayao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = label.text!
            label.text = textCurrentlyInDisplay + digit
        } else {
            label.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    private var displayValue: Double {
        get {
            return Double(label.text!)!
        }
        set {
            label.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
 
    @IBAction private func performOperation(sender: UIButton) {
        if userIsInTheMiddleOfTyping{
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        displayValue = brain.result

    }
}
