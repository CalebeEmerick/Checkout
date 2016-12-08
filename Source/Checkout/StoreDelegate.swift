//
//  StoreDelegate.swift
//  Checkout
//
//  Created by Calebe Emerick on 30/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

final class StoreDelegate : NSObject {
    
    var selectedStore: ((Store) -> Void)?
}

extension StoreDelegate : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard
            let cell = collectionView.cellForItem(at: indexPath) as? StoreCell,
            let store = cell.store
        else { return }
        
        selectedStore?(store)
    }
}
