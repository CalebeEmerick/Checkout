//
//  TransactionRouter.swift
//  Checkout
//
//  Created by Calebe Emerick on 06/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

struct TransactionRouter {
    
    static func openCreditCardTransactionController(from viewController: UIViewController, with store: Store) {
        
        guard let transaction = Storyboard.main.instantiateViewController(withIdentifier: TransactionController.identifier) as? TransactionController else { return }
        
        transaction.store = store
        
        viewController.show(transaction, sender: nil)
    }
}
