//
//  ViewController.swift
//  Checkout
//
//  Created by Calebe Emerick on 30/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

public protocol ViewControllerReusable {
    
    static var identifier: String { get }
    var contentViewController: UIViewController { get }
}

public extension ViewControllerReusable where Self : UIViewController {
    
    static var identifier: String {
        
        return String(describing: self)
    }
    
    var contentViewController: UIViewController {
        
        guard let nc = self as? UINavigationController else { return self }
        guard let vc = nc.visibleViewController else { return self }
        
        return vc
    }
}

extension UIViewController : ViewControllerReusable { }
