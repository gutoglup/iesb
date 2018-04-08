//
//  RootSplitViewController.swift
//  CalcGraphy
//
//  Created by Augusto Reis on 27/03/2018.
//  Copyright © 2018 Augusto Reis. All rights reserved.
//

import UIKit

class RootSplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        preferredDisplayMode = .allVisible
        
        self.delegate = self
        // Do any additional setup after loading the view.
        
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
}
