//
//  ViewController.swift
//  ThreadExemple
//
//  Created by Augusto Reis on 21/03/2018.
//  Copyright © 2018 Augusto Reis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let enderecoDaImagem = "https://upload.wikimedia.org/wikipedia/commons/8/85/Sky-3.jpg"
    
    var imagem: UIImage? {
        didSet{
            DispatchQueue.main.async(execute: updateImage)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    fileprivate func updateImage() {
        guard let img = self.imagem else { return }
        imageView.image = img
        self.activityIndicator.stopAnimating()
    }
    
    fileprivate func executeDownload() {
        if let url = URL(string: enderecoDaImagem) {
            do {
                let data = try Data(contentsOf: url)
                imagem = UIImage(data: data)
            }
            catch {
                debugPrint(error)
                DispatchQueue.main.async(execute: activityIndicator.stopAnimating)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.activityIndicator.startAnimating()
        let globalQueue = DispatchQueue.global(qos: .userInitiated)
        globalQueue.async(execute: executeDownload)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

