//
//  ControllerStack.swift
//  Checkout
//
//  Created by Calebe Emerick on 30/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

struct ControllerStack<T: UIViewController> {
    
    let navigation: UINavigationController
    let controller: T
}
