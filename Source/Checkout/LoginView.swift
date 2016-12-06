//
//  LoginView.swift
//  Checkout
//
//  Created by Calebe Emerick on 29/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

protocol LoginView : class {
    
    func setBackgroundGradient()
    func setTextFieldStyle()
    func startAnimating()
    func stopAnimating()
    func toggleLockFields()
    func isFieldsEmpty() -> Bool
    func hideKeyboard()
    func showErrorAlert(_ error: String)
    func shouldEnableLoginButton()
}
