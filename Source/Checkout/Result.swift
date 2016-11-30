//
//  Result.swift
//  Checkout
//
//  Created by Calebe Emerick on 30/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

public enum Result<T> {
    
    case success(T)
    case failure(String)
}
