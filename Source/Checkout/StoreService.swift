//
//  StoreService.swift
//  Checkout
//
//  Created by Calebe Emerick on 30/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

typealias CustomerKey = String

protocol StoreServiceProtocol  : ServiceProtocol {
    
    associatedtype T
    
    func getStores(from customerKey: CustomerKey, completion: @escaping (Result<T>) -> Void)
}

struct StoreService : StoreServiceProtocol {
    
    func getStores(from customerKey: CustomerKey, completion: @escaping (Result<[Store]>) -> Void) {
        
        let url = "\(baseURL)/\(customerKey)/merchants"
        
        Just.get(url) { result in
            
            print(result.json)
        }
    }
}
