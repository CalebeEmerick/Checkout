//
//  TransactionView.swift
//  Checkout
//
//  Created by Calebe Emerick on 08/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

protocol TransactionView : class {
    
    func showLoading()
    func hideLoading()
    func showAlert(with message: String, title: String)
}
