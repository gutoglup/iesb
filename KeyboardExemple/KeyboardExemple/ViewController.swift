//
//  ViewController.swift
//  KeyboardExemple
//
//  Created by Augusto Reis on 21/03/2018.
//  Copyright © 2018 Augusto Reis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var entradaTexto: UITextField! {
        didSet{
            self.entradaTexto.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardAppear(_:)), name: Notification.Name.UIKeyboardDidShow, object: view.window)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardDisappear(_:)), name: Notification.Name.UIKeyboardDidHide, object: view.window)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(entradaTexto.resignFirstResponder))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardAppear(_ sender: Notification) {
        if let frame = sender.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect {
            bottomConstraint.constant += frame.size.height
        }
    }
    
    @objc private func keyboardDisappear(_ sender: Notification) {
        if let frame = sender.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? CGRect {
            bottomConstraint.constant -= frame.size.height
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isFirstResponder {
            textField.resignFirstResponder()
        }
        return true
    }
}

