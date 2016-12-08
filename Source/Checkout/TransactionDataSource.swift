//
//  TransactionDataSource.swift
//  Checkout
//
//  Created by Calebe Emerick on 07/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

final class TransactionDataSource : NSObject {
    
    fileprivate let creditCardBrands: [CreditCardBrand] = [
        
        .visa, .masterCard, .visaElectron, .maestro, .dinersClub
    ]
}

extension TransactionDataSource : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return creditCardBrands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CreditCardCell = collectionView.dequeueReusableCell(for: indexPath)
        let brand = creditCardBrands[indexPath.row]
        
        cell.brand = brand
        
        return cell
    }
}
