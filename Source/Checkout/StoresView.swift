//
//  StoresView.swift
//  Checkout
//
//  Created by Calebe Emerick on 30/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

protocol StoresView : class {
    
    func showLoading()
    func hideLoading()
    func showContainer()
    func update(stores: [Store])
    func showError(message: String)
    func hideError()
    func tryLoadStoresAgain()
}
