//
//  Month.swift
//  Checkout
//
//  Created by Calebe Emerick on 08/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

enum Month {
    
    case jan, feb, mar, apr, may, jun, jul, aug, set, oct, nov, dez
}

extension Month {
    
    var monthFormatted: String {
        
        switch self {
            
        case .jan: return "01 - Janeiro"
        case .feb: return "02 - Fevereiro"
        case .mar: return "03 - Março"
        case .apr: return "04 - Abril"
        case .may: return "05 - Mario"
        case .jun: return "06 - Junho"
        case .jul: return "07 - Julho"
        case .aug: return "08 - Agosto"
        case .set: return "09 - Setembro"
        case .oct: return "10 - Outubro"
        case .nov: return "11 - Novembro"
        case .dez: return "12 - Dezembro"
        }
    }
    
    var apiMonth: Int {
        
        switch self {
            
        case .jan: return 01
        case .feb: return 02
        case .mar: return 03
        case .apr: return 04
        case .may: return 05
        case .jun: return 06
        case .jul: return 07
        case .aug: return 08
        case .set: return 09
        case .oct: return 10
        case .nov: return 11
        case .dez: return 12
        }
    }
}
