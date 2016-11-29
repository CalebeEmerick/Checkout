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
    
    @IBAction private func usernameDidChange(_ sender: UITextField) { shouldEnableEnterButton() }
    @IBAction private func passwordDidChange(_ sender: UITextField) { shouldEnableEnterButton() }
    @IBAction private func enterAction(_ sender: UIButton) { doLogin() }
    
    fileprivate lazy var presenter: LoginPresenter = LoginPresenter(loginView: self)
}

// MARK: - Life Cycle -

extension LoginController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundGradient()
        setTextFieldStyle()
    }
}

// MARK: - Methods -

extension LoginController {
    
    fileprivate func doLogin() {
        
        guard
            let username = userTextField.text,
            let password = passwordTextField.text
        else { return }
        
        presenter.doLogin(username: username, password: password)
    }

    fileprivate func shouldEnableEnterButton() {

        presenter.shouldEnable(button: enterButton)
    }
    
    fileprivate func layoutView() {
        
        self.view.layoutIfNeeded()
    }
}

// MARK: - UITextField Delegate -

extension LoginController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userTextField {
            
            presenter.makePasswordTextFieldFirstResponder(passwordTextField)
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
        
        presenter.makeBackgroundGradient(for: self.view)
    }
    
    func setTextFieldStyle() {
        
        presenter.tintPlaceholder(for: userTextField, with: "Usuário")
        presenter.tintPlaceholder(for: passwordTextField, with: "Senha")
    }
    
    func startAnimating() {
        
        enterButtonWidth.constant = 0
        
        UIView.animate(withDuration: 0.3, animations: {
        
            self.layoutView()
            
        }, completion: { completed in
        
            self.activity.startAnimating()
        })
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
}
