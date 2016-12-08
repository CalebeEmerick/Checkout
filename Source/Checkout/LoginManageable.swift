//
//  LoginManageable.swift
//  Checkout
//
//  Created by Calebe Emerick on 30/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

protocol LoginManageable {
    
    var user: User? { get }
    var isUserLoggedIn: Bool { get }
    
    func register(user: User)
    func removeUser()
}

final class LoginManager : LoginManageable {
    
    static var sharedInstance: LoginManageable = LoginManager()
    private init() { }
    
    private(set) var user: User?
    
    var isUserLoggedIn: Bool {
        
        return user != nil
    }
    
    func register(user: User) {
        
        self.user = user
    }
    
    func removeUser() {
        
        self.user = nil
    }
}
