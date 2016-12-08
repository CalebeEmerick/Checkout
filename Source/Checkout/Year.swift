//
//  Year.swift
//  Checkout
//
//  Created by Calebe Emerick on 08/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

enum Year {
    
    case year2016, year2017, year2018, year2019, year2020, year2021,
         year2022, year2023, year2024, year2025, year2026
}

extension Year {
    
    var yearFormmated: String {
        
        switch self {

        case .year2016: return "2016"
        case .year2017: return "2017"
        case .year2018: return "2018"
        case .year2019: return "2019"
        case .year2020: return "2020"
        case .year2021: return "2021"
        case .year2022: return "2022"
        case .year2023: return "2023"
        case .year2024: return "2024"
        case .year2025: return "2025"
        case .year2026: return "2026"
        }
    }
    
    var apiYear: Int {
        
        switch self {
            
        case .year2016: return 16
        case .year2017: return 17
        case .year2018: return 18
        case .year2019: return 19
        case .year2020: return 20
        case .year2021: return 21
        case .year2022: return 22
        case .year2023: return 23
        case .year2024: return 24
        case .year2025: return 25
        case .year2026: return 26
        }
    }
}
