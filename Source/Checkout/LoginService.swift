//
//  LoginService.swift
//  Checkout
//
//  Created by Calebe Emerick on 29/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

protocol LoginServiceProtocol : ServiceProtocol {
    
    associatedtype T
    
    func doLogin(username: String, password: String, completion: @escaping (Result<T>) -> Void)
}

struct LoginService : LoginServiceProtocol {

    func doLogin(username: String, password: String, completion: @escaping (Result<User>) -> Void) {
        
        let url = "\(baseURL)/users/accesstokens"
        let parameters = makeParametersFrom(username: username, password: password)
        
        Just.post(url, params: parameters, headers: defaultJSONHeader) { result in
            
            guard let code = result.statusCode else {
                return completion(.failure(Message.generalError)) }
            
            guard let result = result.json else {
                return completion(.failure(Message.generalError)) }
            
            guard let json = result as? [String: Any] else {
                return completion(.failure(Message.generalError)) }
            
            switch code {
                
            case 200 ..< 300:
                guard let user = self.makeUser(from: json) else {
                    return completion(Result.failure(Message.generalError)) }
                completion(.success(user))
                
            default:
                completion(.failure(self.getErrorMessage(from: json)))
            }
        }
    }
    
    private func makeUser(from json: JSON) -> User? {
        
        guard let user = User(json: json) else { return nil }
        
        return user
    }
    
    private func makeParametersFrom(username: String, password: String) -> [String: Any] {
        
        return [
        
            "username": username,
            "password": password
        ]
    }
}
