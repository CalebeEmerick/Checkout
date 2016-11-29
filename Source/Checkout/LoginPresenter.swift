//
//  LoginPresenter.swift
//  Checkout
//
//  Created by Calebe Emerick on 29/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

struct LoginPresenter {
    
    private let service: LoginServiceProtocol = LoginService()
    private unowned var loginView: LoginView
    
    init(loginView: LoginView) {
        
        self.loginView = loginView
    }
    
    func doLogin(username: String, password: String) {
        
        loginView.hideKeyboard()
        loginView.startAnimating()
        loginView.toggleLockFields()
        
        service.doLogin(username: username, password: password) { result in
            
            DispatchQueue.main.async {
                
                switch result {
                    
                case let .success(user):
                    self.loginView.stopAnimating()
                    self.loginView.toggleLockFields()
                    
                case let .failure(error):
                    self.loginView.stopAnimating()
                    self.loginView.toggleLockFields()
                }
            }
        }
    }
    
    func makeBackgroundGradient(for view: UIView) {
        
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
    
    func tintPlaceholder(for textField: UITextField, with placeholder: String) {
        
        View.setPlaceholderColor(for: textField, with: placeholder, color: Color(hexString: "#fff", alpha: 0.5).color)
    }
    
    func makePasswordTextFieldFirstResponder(_ textField: UITextField) {
        
        textField.becomeFirstResponder()
    }
    
    func shouldEnable(button: UIButton) {
        
        button.isEnabled = loginView.isFieldsEmpty()
    }
}
