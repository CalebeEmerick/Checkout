//
//  LoginLayout.swift
//  Checkout
//
//  Created by Calebe Emerick on 04/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

struct LoginLayout {
    
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

    func showAlert(for controller: UIViewController, with message: String) {

        let alert = UIAlertController(title: "Ops!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(okAction)
        controller.present(alert, animated: true, completion: nil)
    }
}
