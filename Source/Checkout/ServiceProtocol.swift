//
//  ServiceProtocol.swift
//  Checkout
//
//  Created by Calebe Emerick on 30/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

protocol ServiceProtocol {
    
    var baseURL: String { get }
    var defaultJSONHeader: [String: String] { get }
    func getErrorMessage(from json: JSON) -> String
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
    
    func getErrorMessage(from json: JSON) -> String {
        
        guard let errors = json["errors"] as? [[String: Any]] else { return Message.generalError }
        
        var message: String = ""
        
        for error in errors {
            
            guard let errorMessage = error["message"] as? String else { return Message.generalError }
            
            message += "\(errorMessage) "
        }
        
        return message
    }
}
