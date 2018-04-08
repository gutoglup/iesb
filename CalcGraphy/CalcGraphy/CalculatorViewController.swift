//
//  ViewController.swift
//  CalcGraphy
//
//  Created by Augusto Reis on 20/03/2018.
//  Copyright © 2018 Augusto Reis. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
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
    
    var literalExpression: String = ""
    
    private var brainCalculator = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func touchNumber(_ sender: UIButton) {
        literalExpression = ""
        if let digitString = sender.currentTitle,
            let displayValue = displayLabel.text{
            if isTyping {
                self.displayLabel.text = displayValue + digitString
            } else {
                displayLabel.text = "\(digitString)"
                isTyping = true
            }
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        literalExpression = ""
        brainCalculator.setOperand(displayValue!)
        isTyping = false
        if let symbol = sender.currentTitle {
            brainCalculator.performOperation(symbol)
            displayValue = brainCalculator.result
            if brainCalculator.isUnary(symbol){
                literalExpression = symbol.contains("x") ? symbol : "\(symbol)(x)"
            }
        }
    }
    
    @IBAction func showGraph(_ button: UIButton) {
        if literalExpression != "" {
            button.tintColor = UIColor(red: 34/255.0, green: 146/255.0, blue: 31/255.0, alpha: 1)
            self.performSegue(withIdentifier: "graphDetail", sender: nil)
        } else {
            button.tintColor = .red
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GraphViewController {
            destination.brainCalculator = self.brainCalculator
            destination.title = literalExpression
        }
    }
}

