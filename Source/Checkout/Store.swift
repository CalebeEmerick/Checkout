//
//  Store.swift
//  Checkout
//
//  Created by Calebe Emerick on 30/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

struct Store {
    
    let merchantKey: String
    let publicMerchantKey: String
    let merchantName: String
    let documentNumber: String
    let corporateName: String
    let isEnabled: Bool
    let merchantStatus: String
    var image: UIImage? = nil
}

extension Store : JSONDecodable {
    
    init?(json: JSON) {
        
        guard
            let publicMerchantKey = json["publicMerchantKey"] as? String,
            let merchantName = json["merchantName"] as? String,
            let documentNumber = json["documentNumber"] as? String,
            let corporateName = json["corporateName"] as? String,
            let isEnabled = json["isEnabled"] as? Bool,
            let merchantStatus = json["merchantStatus"] as? String
        else { return nil }
        
        self.merchantKey = "85328786-8ba6-420f-9948-5352f5a183eb"
        self.publicMerchantKey = publicMerchantKey
        self.merchantName = merchantName
        self.documentNumber = documentNumber
        self.corporateName = corporateName
        self.isEnabled = isEnabled
        self.merchantStatus = merchantStatus
    }
}
