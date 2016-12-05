//
//  StoresView.swift
//  Checkout
//
//  Created by Calebe Emerick on 30/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

protocol StoresView : class {
    
    func startAnimating()
    func stopAnimating()
    func showContainer(with stores: [Store])
}
