//
//  ServiceProtocol.swift
//  Checkout
//
//  Created by Calebe Emerick on 30/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

protocol ServiceProtocol {
    
}

extension ServiceProtocol {
    
    var baseURL: String {
        
        return "https://private-anon-b1ce5f19aa-mundipaggportal.apiary-mock.com"
    }
    
    var defaultJSONHeader: [String: String] {
        
        return [
            
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    }
}
