//
//  DetailViewController.swift
//  SplitProject
//
//  Created by Augusto Reis on 14/03/2018.
//  Copyright © 2018 Augusto Reis. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var colorDetail: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = colorDetail
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
