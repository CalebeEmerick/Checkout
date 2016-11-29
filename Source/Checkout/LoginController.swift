//
//  LoginController.swift
//  Checkout
//
//  Created by Calebe Emerick on 28/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

// MARK: - LoginController -

final class LoginController : UITableViewController {

    @IBOutlet fileprivate weak var userTextField: UITextField! { didSet { setTextFieldStyle(for: userTextField, with: "Usuário") } }
    @IBOutlet fileprivate weak var passwordTextField: UITextField! { didSet { setTextFieldStyle(for: passwordTextField, with: "Senha") } }
    
    @IBAction private func enterAction(_ sender: UIButton) { }
}

// MARK: - Life Cycle -

extension LoginController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeBackgroundGradient()
    }
}

// MARK: - Methods -

extension LoginController {
    
    fileprivate func setTextFieldStyle(for textField: UITextField, with placeholder: String) {

        View.setPlaceholderColor(for: textField, with: placeholder, color: Color(hexString: "#fff", alpha: 0.5).color)
    }
    
    fileprivate func makeBackgroundGradient() {
        
        let gradient = CAGradientLayer()
        let colorsArray: [CGColor] = [
            
            Color(hexString: "#00adef", alpha: 0.9).cgColor,
            Color(hexString: "#00adef", alpha: 0.7).cgColor,
            Color(hexString: "#00adef", alpha: 0.5).cgColor
        ]
        
        gradient.colors = colorsArray
        gradient.locations = [0.0, 0.75, 1]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.frame = view.frame
        view.layer.insertSublayer(gradient, at: 0)
    }
}

// MARK: - UITextField Delegate -

extension LoginController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userTextField {
            
            passwordTextField.becomeFirstResponder()
        }
        else {
            
            textField.endEditing(true)
        }
        
        return true
    }
}
