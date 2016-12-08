//
//  StoreDataSource.swift
//  Checkout
//
//  Created by Calebe Emerick on 30/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

final class StoreDataSource : NSObject {
    
    var stores: [Store] = []
}

extension StoreDataSource : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return stores.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: StoreCell = collectionView.dequeueReusableCell(for: indexPath)
        let store = stores[indexPath.row]
        
        cell.store = store
        cell.setImage(by: indexPath.row)
        
        return cell
    }
}
