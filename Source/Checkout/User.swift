//
//  User.swift
//  Checkout
//
//  Created by Calebe Emerick on 29/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

struct User {
    
    let id: String
    let token: String
    let tokenType: String
    let refreshToken: String
    let name: String
    let username: String
    let customerKey: String
}

extension User : JSONDecodable {
    
    init?(json: JSON) {
        
        guard
            let id = json["userId"] as? String,
            let token = json["accessToken"] as? String,
            let tokenType = json["tokenType"] as? String,
            let refreshToken = json["refreshToken"] as? String,
            let name = json["name"] as? String,
            let username = json["username"] as? String,
            let customerKey = json["customerKey"] as? String
        else { return nil }
        
        self.id = id
        self.token = token
        self.tokenType = tokenType
        self.refreshToken = refreshToken
        self.name = name
        self.username = username
        self.customerKey = customerKey
    }
}
