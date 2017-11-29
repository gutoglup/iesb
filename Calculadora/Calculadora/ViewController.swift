//
//  ViewController.swift
//  Calculadora
//
//  Created by HC5MAC16 on 29/11/17.
//  Copyright © 2017 ACR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var isTyping = false
    var displayValue: Double? {
        set {
            if let value = newValue {
                displayLabel.text = String(value)
            } else {
                displayLabel.text = "0"
            }
        }
        get {
            return Double(displayLabel.text!)!
        }
    }
    
    private var brainCalculator = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchNumber(_ sender: UIButton) {
        if let digitString = sender.currentTitle,
            let digitNumber = Double(digitString),
            let displayValue = displayValue{
            if isTyping {
                self.displayValue = displayValue + digitNumber
            } else {
                displayLabel.text = "\(digitNumber)"
                isTyping = true
            }
        }
        
        
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        brainCalculator.setOperand(displayValue!)
        if let symbol = sender.currentTitle {
            brainCalculator.performOperation(symbol)
            displayValue = brainCalculator.result
        }
        
    }
    
    
    
    


}

