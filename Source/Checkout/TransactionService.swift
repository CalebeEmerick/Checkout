//
//  TransactionService.swift
//  Checkout
//
//  Created by Calebe Emerick on 09/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import Foundation

typealias MerchantKey = String

protocol TransactionServiceProtocol : ServiceProtocol {
    
    associatedtype T
    
    func makeTransaction(from merchantKey: MerchantKey, with transaction: JSON, completion: @escaping (Result<T>) -> Void)
}

struct TransactionService : TransactionServiceProtocol {
    
    var baseURL: String { return "https://sandbox.mundipaggone.com" }
    
    func makeTransaction(from merchantKey: MerchantKey, with transaction: JSON, completion: @escaping (Result<CreditCardTransactionResult>) -> Void) {
        
        let url = "\(baseURL)/Sale"
        var headers = defaultJSONHeader
        
        headers["MerchantKey"] = merchantKey
        
        Just.post(url, json: transaction, headers: headers, timeout: 60) { result in
            
            guard let code = result.statusCode else {
                return completion(.failure(Message.generalError)) }
            
            guard let result = result.json else {
                return completion(.failure(Message.generalError)) }
            
            guard let json = result as? [String: Any] else {
                return completion(.failure(Message.generalError)) }
            
            switch code {
                
            case 200 ..< 300:
                let transaction = self.makeTransaction(from: json)
                completion(.success(transaction))
                
            default:
                completion(.failure(self.getErrorMessage(from: json)))
            }
        }
    }
    
    func getErrorMessage(from json: JSON) -> String {
        
        guard let error = json["ErrorReport"] as? JSON else { return Message.generalError }
        guard let collection = error["ErrorItemCollection"] as? [JSON] else { return Message.generalError }
        var message = ""
        
        for item in collection {
            
            guard let description = item["Description"] as? String else { return Message.generalError }
            message = description
        }
        
        return message
    }
    
    private func makeTransaction(from json: JSON) -> CreditCardTransactionResult {
        
        var transaction = CreditCardTransactionResult()
        
        guard let collection = json["CreditCardTransactionResultCollection"] as? [JSON] else { return transaction }
        
        for item in collection {
            
            guard let transactionModel = CreditCardTransactionResult(json: item) else { return transaction }
            transaction = transactionModel
        }
        
        return transaction
    }
}
