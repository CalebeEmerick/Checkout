//
//  LayoutProtocol.swift
//  Checkout
//
//  Created by Calebe Emerick on 09/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

protocol LayoutProtocol { }

extension LayoutProtocol {
    
    func showAlert(for controller: UIViewController, with message: String, title: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(okAction)
        controller.present(alert, animated: true, completion: nil)
    }
}
