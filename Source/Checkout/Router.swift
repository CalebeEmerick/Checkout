//
//  Router.swift
//  Checkout
//
//  Created by Calebe Emerick on 30/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

struct Router {
    
    private static var storeControllerStack: ControllerStack<StoresController>? {
        
        guard
            let nc = Storyboard.main.instantiateViewController(withIdentifier: "StoresNavigationController") as? UINavigationController,
            let vc = nc.contentViewController as? StoresController
        else { return nil }
        
        return ControllerStack(navigation: nc, controller: vc)
    }
    
    static func enterApplication() {
        
        guard let window = Constants.appDelegate.window else { return }
        guard let snapshot = window.snapshotView(afterScreenUpdates: true) else { return }
        
        storeControllerStack?.navigation.view.addSubview(snapshot)
        window.rootViewController = storeControllerStack?.navigation
        
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: {
        
            snapshot.layer.opacity = 0
            snapshot.removeFromSuperview()
            
        }, completion: nil)
    }
}
