//
//  TriangleViewController.swift
//  TabBarOrganizer
//
//  Created by Augusto Reis on 07/03/2018.
//  Copyright © 2018 Augusto Reis. All rights reserved.
//

import UIKit

class TriangleViewController: UIViewController {

    @IBOutlet weak var triangleView: TriangleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TriangleViewController.navigateToSurpriseView))
        triangleView.addGestureRecognizer(tapGesture)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc func navigateToSurpriseView() {
        self.performSegue(withIdentifier: "surpriseIdentifier", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "surpriseIdentifier", let destination = segue.destination as? SurpriseViewController {
            print("Navegando para Surprise View Controller")
        }
    }
 

}
