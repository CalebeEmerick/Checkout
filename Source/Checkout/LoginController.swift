//
//  LoginController.swift
//  Checkout
//
//  Created by Calebe Emerick on 28/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

// MARK: - Variables & Outlets -

final class LoginController : UITableViewController {

    @IBOutlet fileprivate weak var userTextField: UITextField!
    @IBOutlet fileprivate weak var passwordTextField: UITextField!
    @IBOutlet fileprivate weak var enterButtonWidth: NSLayoutConstraint!
    @IBOutlet fileprivate weak var enterButton: UIButton!
    @IBOutlet fileprivate weak var activity: UIActivityIndicatorView!
    
    @IBAction private func usernameDidChange(_ sender: UITextField) { shouldEnableLoginButton() }
    @IBAction private func passwordDidChange(_ sender: UITextField) { shouldEnableLoginButton() }
    @IBAction private func enterAction(_ sender: UIButton) { doLogin() }
    
    fileprivate var presenter: LoginPresenter?
    fileprivate var layout: LoginLayout?
}

// MARK: - Life Cycle -

extension LoginController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = LoginPresenter(loginView: self)
        layout = LoginLayout()
        makeBackgroundGradient(for: self.view)
        setBackgroundGradient()
        setTextFieldStyle()
    }
}

// MARK: - Methods -

extension LoginController {
    
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
    
    fileprivate func doLogin() {
        
        guard
            let username = userTextField.text,
            let password = passwordTextField.text
        else { return }
        
        presenter?.doLogin(username: username, password: password)
    }
    
    fileprivate func layoutView() {
        
        self.view.layoutIfNeeded()
    }
}

// MARK: - UITextField Delegate -

extension LoginController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userTextField {
            
            layout?.makePasswordTextFieldFirstResponder(passwordTextField)
        }
        else {
            
            doLogin()
        }
        
        return true
    }
}

// MARK: - LoginView Protocol -

extension LoginController : LoginView {
    
    func setBackgroundGradient() {
        
        layout?.makeBackgroundGradient(for: self.view)
    }
    
    func setTextFieldStyle() {
        
        layout?.tintPlaceholder(for: userTextField, with: "Usuário")
        layout?.tintPlaceholder(for: passwordTextField, with: "Senha")
    }
    
    func startAnimating() {
        
        enterButtonWidth.constant = 0
        activity.startAnimating()
        
        UIView.animate(withDuration: 0.3) { self.layoutView() }
    }
    
    func stopAnimating() {
        
        activity.stopAnimating()
        enterButtonWidth.constant = 200
        
        UIView.animate(withDuration: 0.3) { self.layoutView() }
    }
    
    func isFieldsEmpty() -> Bool {
        
        return !userTextField.text!.isEmpty && !passwordTextField.text!.isEmpty
    }
    
    func toggleLockFields() {
        
        userTextField.isEnabled = !userTextField.isEnabled
        passwordTextField.isEnabled = !passwordTextField.isEnabled
    }
    
    func hideKeyboard() {
        
        self.view.endEditing(true)
    }
    
    func showErrorAlert(_ error: String) {
        
        layout?.showAlert(for: self, with: error, title: "Oops!")
    }
    
    func shouldEnableLoginButton() {
        
        enterButton.isEnabled = isFieldsEmpty()
    }
}
