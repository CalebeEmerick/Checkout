//
//  ValityDate.swift
//  Checkout
//
//  Created by Calebe Emerick on 08/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

struct ValityDate {
    
    let months: [Month]
    let years: [Year]
    
    init() {
        
        months = [ .jan, .feb, .mar, .apr, .may, .jun, .jul, .aug, .set, .oct, .nov, .dez ]
        years = [
            .year2016, .year2017, .year2018, .year2019, .year2020, .year2021,
            .year2022, .year2023, .year2024, .year2025, .year2026
        ]
    }
}
