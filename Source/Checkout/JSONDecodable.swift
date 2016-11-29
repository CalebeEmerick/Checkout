//
//  JSONDecodable.swift
//  Checkout
//
//  Created by Calebe Emerick on 29/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

public typealias JSON = [String: Any]

public protocol JSONDecodable {
    
    init?(json: JSON)
}
