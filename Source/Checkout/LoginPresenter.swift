//
//  LoginPresenter.swift
//  Checkout
//
//  Created by Calebe Emerick on 29/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

struct LoginPresenter {
    
    private let service = LoginService()
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
                    self.register(user: user)
                    
                case let .failure(error):
                    self.showMessage(with: error)
                }
            }
        }
    }
    
    private func register(user: User) {
        
        LoginManager.sharedInstance.register(user: user)
        Router.enterApplication()
        stopLoading()
    }
    
    private func showMessage(with error: String) {
        
        self.stopLoading()
        self.loginView.showErrorAlert(error)
    }
    
    private func stopLoading() {
        
        self.loginView.stopAnimating()
        self.loginView.toggleLockFields()
    }
}
