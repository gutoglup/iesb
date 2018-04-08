//
//  GraphViewController.swift
//  CalcGraphy
//
//  Created by Augusto Reis on 20/03/2018.
//  Copyright © 2018 Augusto Reis. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController {
    
    @IBOutlet weak var graphView: GraphView! {
        didSet{
            graphView.delegate = self
        }
    }
    
    var brainCalculator: CalculatorBrain?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        graphView.originOfGraph = CGPoint(x: graphView.bounds.midX, y: graphView.bounds.midY)
        graphView.scale = 5
    }

    @IBAction func pinchAction(_ gesture: UIPinchGestureRecognizer) {
        if gesture.state == .changed {
            graphView.scale *= gesture.scale
            gesture.scale = 1
        }
    }

    @IBAction func tapAction(_ gesture: UITapGestureRecognizer) {
        graphView.originOfGraph = gesture.location(in: graphView)
    }
    
    @IBAction func panAction(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: graphView)
        graphView.originOfGraph = CGPoint(x: graphView.centerOfGraph.x + translation.x, y: graphView.centerOfGraph.y + translation.y)
        gesture.setTranslation(CGPoint.zero, in: graphView)
    }
    
}

extension GraphViewController: GraphDelegate {
    func requestY(toX: Double) -> Double {
        if let lastExpression = brainCalculator?.lastExpression {
            return lastExpression(toX)
        }
        return 0
    }
}
