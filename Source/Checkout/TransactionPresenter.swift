//
//  TransactionPresenter.swift
//  Checkout
//
//  Created by Calebe Emerick on 09/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

struct TransactionPresenter {
    
    private let service = TransactionService()
    private unowned var transactionView: TransactionView
    
    init(transactionView: TransactionView) {
        
        self.transactionView = transactionView
    }
    
    func makeTransaction(from merchantKey: MerchantKey, with transaction: Transaction) {
        
        transactionView.showLoading()
        
        let json = makeJSON(from: transaction)
        service.makeTransaction(from: merchantKey, with: json) { result in
            
            DispatchQueue.main.async {
            
                switch result {
                    
                case .success(let transaction):
                    self.transactionView.hideLoading()
                    print(transaction)
                    
                case .failure(let error):
                    self.transactionView.hideLoading()
                    self.transactionView.showAlert(with: error)
                }
            }
        }
        
    }
    
    private func makeJSON(from transaction: Transaction) -> JSON {
        
        let creditCard: [String: Any] = [
        
            "CreditCardBrand": transaction.creditCard.brand.name,
            "CreditCardNumber": transaction.creditCard.number,
            "ExpMonth": transaction.creditCard.valityDate.month,
            "ExpYear": transaction.creditCard.valityDate.year,
            "HolderName": transaction.creditCard.name,
            "SecurityCode": transaction.creditCard.securityCode
        ]
        
        let transactionObject: [String: Any] = [
        
            "AmountInCents": transaction.amount,
            "CreditCard": creditCard,
            "InstallmentCount": 1
        ]
        
        let array: [[String: Any]] = [
        
            transactionObject
        ]
        
        let order: [String: Any] = [
            
            "OrderReference": "NumeroDoPedido"
        ]
        
        let json: [String: Any] = [
            
            "CreditCardTransactionCollection": array,
            "Order": order
        ]
        
        return json
    }
}
