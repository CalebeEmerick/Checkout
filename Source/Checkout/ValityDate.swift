//
//  ValityDate.swift
//  Checkout
//
//  Created by Calebe Emerick on 08/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

struct ValityDate {
    
    let month: Int
    let year: Int
}

extension ValityDate {
    
    var dateFormatted: String {
    
        return "\(month)/\(year)"
    }
}
