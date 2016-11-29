//
//  LoginService.swift
//  Checkout
//
//  Created by Calebe Emerick on 29/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

enum LoginStatus { case success(User), failure(String) }

protocol LoginServiceProtocol {
    
    func doLogin(username: String, password: String, completion: @escaping (LoginStatus) -> Void)
}

struct LoginService : LoginServiceProtocol {
    
    func doLogin(username: String, password: String, completion: @escaping (LoginStatus) -> Void) {
        
        let headers = makeHeaders()
        let parameters = makeParametersFrom(username: username, password: password)
        
        Just.post("https://private-anon-b1ce5f19aa-mundipaggportal.apiary-mock.com/users/accesstokens", params: parameters, headers: headers) { result in
            
            guard let code = result.statusCode else {
                return completion(.failure(Message.generalError)) }
            
            guard let result = result.json else {
                return completion(.failure(Message.generalError)) }
            
            guard let json = result as? [String: Any] else {
                return completion(.failure(Message.generalError)) }
            
            switch code {
                
            case 200 ..< 300:
                guard let user = self.makeUser(from: json) else {
                    return completion(LoginStatus.failure(Message.generalError)) }
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
    
    private func getErrorMessage(from json: JSON) -> String {
        
        guard let errors = json["errors"] as? [[String: Any]] else { return Message.generalError }
        
        var message: String = ""
        
        for error in errors {
            
            guard let errorMessage = error["message"] as? String else { return Message.generalError }
            
            message += "\(errorMessage) "
        }
        
        return message
    }
    
    private func makeHeaders() -> [String: String] {
        
        return [
            
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    }
    
    private func makeParametersFrom(username: String, password: String) -> [String: Any] {
        
        return [
        
            "username": username,
            "password": password
        ]
    }
}
