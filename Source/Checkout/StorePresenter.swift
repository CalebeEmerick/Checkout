//
//  StorePresenter.swift
//  Checkout
//
//  Created by Calebe Emerick on 30/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

struct StorePresenter {
    
    private let service = StoreService()
    private unowned var storeView: StoresView
    
    init(storeView: StoresView) {
        
        self.storeView = storeView
    }
    
    func getStores(from customerKey: CustomerKey) {
        
        service.getStores(from: customerKey) { result in
            
            
        }
    }
    
    func setLayout(for collectionView: UICollectionView) {
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let width: CGFloat = collectionView.bounds.width / 2
        let height: CGFloat = collectionView.bounds.height / 2
        
        layout?.itemSize = CGSize(width: width, height: height)
    }
}
