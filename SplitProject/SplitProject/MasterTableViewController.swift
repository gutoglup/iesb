//
//  MasterTableViewController.swift
//  SplitProject
//
//  Created by Augusto Reis on 14/03/2018.
//  Copyright © 2018 Augusto Reis. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    // implementar o delegate do splitviewcontroller
    var colorSelected: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath),
            let text = cell.textLabel?.text {
            let colorSelected = transformColor(stringColor: text)
            performSegue(withIdentifier: "mostraCorSegue", sender: colorSelected)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "mostraCorSegue" {
                if let destination = segue.destination as? DetailViewController{
                    if let color = sender as? UIColor {
                        destination.colorDetail = color
                    }
                }
            }
        }
    }
    
    func transformColor(stringColor: String) -> UIColor {
        switch stringColor {
        case "Azul": return .blue
        case "Vermelho": return .red
        case "Amarelo": return .yellow
        default: return .white
        }
    }
    
}
