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
        
        Just.get(url, timeout: 60) { result in
            
            guard let code = result.statusCode else {
                return completion(.failure(Message.generalError)) }
            
            guard let result = result.json else {
                return completion(.failure(Message.generalError)) }
            
            guard let json = result as? [String: Any] else {
                return completion(.failure(Message.generalError)) }
            
            switch code {
                
            case 200 ..< 300:
                let stores = self.makeStores(from: json)
                completion(Result.success(stores))
                
            default:
                completion(.failure(self.getErrorMessage(from: json)))
            }
        }
    }
    
    private func makeStores(from json: JSON) -> [Store] {
        
        var stores: [Store] = []
        
        guard let items = json["items"] as? [[String: Any]] else { return stores }
        
        for item in items {
            
            guard let store = Store(json: item) else { return stores }
            
            stores.append(store)
            stores.append(store)
            stores.append(store)
            stores.append(store)
        }
        
        return stores
    }
}
