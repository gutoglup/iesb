//
//  CalculatorBrain.swift
//  Calculadora
//
//  Created by HC5MAC16 on 29/11/17.
//  Copyright © 2017 ACR. All rights reserved.
//

import UIKit

typealias UnaryOperation = (Double) -> Double
typealias BinaryOpeartion = (Double, Double) -> Double

struct CalculatorBrain {
    
    var result : Double {
        get {
            return self.accumulator!
        }
    }
    var accumulator: Double?
    private var pbo: PendingBinaryOperation?
    private var operations: [String: Operation] = [
    "π": Operation.constant(Double.pi),
    "e": Operation.constant(M_E),
        "√":Operation.unary(sqrt),
        "±": Operation.unary({$0}),
        "x²": Operation.unary({$0*$0}),
        "x³": Operation.unary({$0*$0*$0}),
        "log10": Operation.unary({log10($0)}),
        "sen": Operation.unary({sin($0)}),
        "cos": Operation.unary({cos($0)}),
        "tan": Operation.unary({tan($0)}),
        "x": Operation.binary({$0 * $1}),
        "+": Operation.binary({$0 + $1}),
        "-": Operation.binary({$0 - $1}),
        "÷": Operation.binary({$0 / $1}),
        "=": Operation.equals
        
    ]
    
    private enum Operation {
        case constant(Double)
        case unary(UnaryOperation)
        case binary(BinaryOpeartion)
        case equals
    }
    
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    mutating func performOperation(_ mathematicalSymbol: String) {
        if let operation = operations[mathematicalSymbol] {
            switch operation {
            case .constant(let constant) :
                accumulator = constant
            case .unary(let function):
                if let accumulator = accumulator {
                    self.accumulator = function(accumulator)
                }
            case .binary(let function): if let accumulator = accumulator {
                pbo = PendingBinaryOperation(firstOperand: accumulator, function: function)
                }
            case .equals: performPendingBinaryOperation()
            }
            
        }
    }
    
    private mutating func performPendingBinaryOperation() {
        if let accumulator = accumulator {
            self.accumulator = pbo?.perform(with: accumulator)
        }
    }
    
    private struct PendingBinaryOperation {
        let firstOperand: Double
        let function: BinaryOpeartion
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
}
