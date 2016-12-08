//
//  CreditCardBrand.swift
//  Checkout
//
//  Created by Calebe Emerick on 08/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

enum CreditCardBrand {
    
    case visa, masterCard, visaElectron, maestro, dinersClub
    
    var name: String {
        
        switch self {
            
        case .visa: return "Visa"
        case .masterCard: return "Master Card"
        case .visaElectron: return "Visa Electron"
        case .maestro: return "Maestro"
        case .dinersClub: return "Diners Club"
        }
    }
    
    var image: UIImage {
        
        switch self {
            
        case .visa: return #imageLiteral(resourceName: "visa")
        case .masterCard: return #imageLiteral(resourceName: "master-card")
        case .visaElectron: return #imageLiteral(resourceName: "visa-electron")
        case .maestro: return #imageLiteral(resourceName: "maestro")
        case .dinersClub: return #imageLiteral(resourceName: "diners-club")
        }
    }
}
