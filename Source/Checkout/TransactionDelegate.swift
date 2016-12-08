//
//  TransactionDelegate.swift
//  Checkout
//
//  Created by Calebe Emerick on 07/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

class TransactionDelegate : NSObject {
    
    var creditCardSelected: ((CreditCardBrand) -> Void)?
}

extension TransactionDelegate : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? CreditCardCell else { return }
        guard let brand = cell.brand else { return }
        
        creditCardSelected?(brand)
    }
}
