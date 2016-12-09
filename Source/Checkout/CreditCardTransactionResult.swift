//
//  CreditCardTransactionResult.swift
//  Checkout
//
//  Created by Calebe Emerick on 09/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

struct CreditCardTransactionResult {
    
    let message: String
    let amount: Int64
    let brand: String
    let maskedNumber: String
    
    init() {
        self.message = ""
        self.amount = 0
        self.brand = ""
        self.maskedNumber = ""
    }
    
    init(message: String, amount: Int64, brand: String, maskedNumber: String) {
        
        self.message = message
        self.amount = amount
        self.brand = brand
        self.maskedNumber = maskedNumber
    }
}

extension CreditCardTransactionResult : JSONDecodable {
    
    init?(json: JSON) {
        
        guard
            let message = json["AcquirerMessage"] as? String,
            let amount = json["AmountInCents"] as? Int64,
            let creditCardInformation = json["CreditCard"] as? JSON,
            let brand = creditCardInformation["CreditCardBrand"] as? String,
            let maskedCard = creditCardInformation["MaskedCreditCardNumber"] as? String
        else { return nil }
        
        self.message = message
        self.amount = amount
        self.brand = brand
        self.maskedNumber = maskedCard
    }
}
