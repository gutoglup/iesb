//
//  ViewController.swift
//  DesenhoView
//
//  Created by Augusto Reis on 28/02/2018.
//  Copyright © 2018 Augusto Reis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var triangleView: TriangleView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        let touch = touches.first
        let touchView = touch?.view
        
        if touchView == triangleView {
            if let position = touch?.location(in: self.view) {
                triangleView.center = position
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

